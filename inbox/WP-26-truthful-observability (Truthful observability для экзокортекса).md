---
type: work-package-context
id: WP-26
created: 2026-03-24
status: in_progress
budget: 2h
depends_on: WP-25
---

# РП#26: Truthful observability для экзокортекса

## Почему это отдельный РП

WP-23 задал карту сквозного контроля, WP-24 — truthful semantics состояний, WP-25 — safeguards. Но оператор всё ещё не должен догадываться по косвенным признакам, где именно завис контур. Нужен отдельный наблюдаемый слой: dashboard и status-artifacts должны не просто показывать цвет, а явно раскрывать backlog, stuck-элементы, stale-состояния и неполное прохождение цепочки.

## Цель

Собрать **truthful observability layer**, в котором `AGENTS-STATUS`, `SESSION-OPEN`, `SchedulerReport` и status store показывают:
- какие очереди существуют;
- сколько в них элементов;
- какие элементы застряли;
- где partial/stale/stuck вместо verified success;
- можно ли реально продолжать рабочий день.

## Что должно быть наблюдаемо

### 1. Очереди
Система должна явно показывать состояние очередей:
- `pending-sessions/`
- `processed-sessions/`
- captures без обработки
- extraction reports по текущему окну
- задачи из сессий, которые должны появиться в `INBOX-TASKS.md`
- manual-review notes
- stale status artifacts

Для каждой очереди должно быть видно:
- count;
- oldest item age;
- есть ли stuck элементы;
- нужен ли manual action.

### 2. Статусы сценариев
Для каждого ключевого сценария dashboard должен показывать не просто `ok/error`, а truthful state из WP-24:
- `success-verified`
- `success-unverified`
- `partial`
- `stale`
- `stuck`
- `blocked`
- `failed`

### 3. Верхнеуровневый verdict
Верхнеуровневый статус «можно ли открывать день / продолжать обычную работу» должен строиться только из truthful данных:
- зелёный — только если критический контур в `success-verified`;
- жёлтый — если есть деградация, но нет критического запрета;
- красный — если есть stuck/failed/critical blocked или разрыв в ключевой цепочке.

## Какие артефакты должны показывать truthful observability

### `AGENTS-STATUS.md`
Должен отвечать на вопрос: **какие подсистемы живы, а какие нет**.

Минимум:
- strategist
- extractor
- scheduler
- synchronizer/health-check
- auth/helper layer
- critical integrations

Для каждой подсистемы:
- verdict;
- truthful state;
- evidence summary;
- если плохо — конкретная причина, а не общий "ошибка".

### `SESSION-OPEN (Экран открытия сессии).md`
Должен отвечать на вопрос: **можно ли честно начинать день сейчас**.

Минимум:
- общий verdict среды;
- статус «мозга экзокортекса»;
- критические связки среды;
- что именно мешает обычному открытию;
- требуется ли ручное действие.

### `SchedulerReport YYYY-MM-DD.md`
Должен отвечать на вопрос: **что реально выполнилось, а что только выглядит выполненным**.

Минимум:
- run status;
- evidence status;
- age/freshness;
- backlog/queue symptoms;
- distinction между `success-verified` и `success-unverified`.

### Status store `~/.local/state/exocortex/status/`
Должен быть нижним техническим слоем, но не единственным source-of-truth. Его данные должны сверяться с артефактами уровня оператора.

## Наблюдаемые failure patterns

Observability layer обязан явно подсвечивать:

1. **Stuck queue visible**
   - видно, какой file/item застрял
   - видно, сколько времени он висит

2. **Stale visible**
   - видно, что статус устарел, а не просто зелёный
   - видно age последнего подтверждения

3. **Partial visible**
   - видно, какой шаг прошёл, а какой нет
   - видно разрыв upstream/downstream

4. **Blocked visible**
   - видно тип блокера: auth / billing / network / dependency / manual gate

5. **Inherited green impossible**
   - старый зелёный статус не может пережить новое окно без freshness check

## Что должен видеть оператор

Оператор не должен читать сырые логи, чтобы понять проблему. По status-artifacts должно быть видно:
- где именно проблема;
- это старый статус или свежий;
- это временная деградация или критическая остановка;
- какой backlog накопился;
- можно ли продолжать работу;
- что нужно сделать руками.

## Truthful observability contract

```text
если шаг не доказан -> он не зелёный
если очередь зависла -> это видно по count + age + item
если статус старый -> это stale, а не success
если цепочка оборвалась -> это partial/stuck, а не "в целом нормально"
если нужен человек -> dashboard должен сказать это явно
```

## Связь с предыдущими РП

- WP-23 дал карту: что вообще наблюдать
- WP-24 дал словарь truthful states
- WP-25 дал safeguards и правила эскалации
- WP-26 задаёт, **как это всё показывается оператору**

## Критерий завершения WP-26

- Для status-artifacts задан truthful observability contract
- Все ключевые очереди перечислены как наблюдаемые сущности
- Для stuck/stale/partial/blocked определено, как они должны быть видны оператору
- Исключена модель "общий цвет без конкретики"
- WP-26 становится входом для WP-27 (close-flow and iteration discipline)

## Следующий РП

**WP-27** — truthful close-flow и дисциплина итераций: как закрывать каждый WP без ложного success, с отдельной историей, commit/push и обновлением контекста.
