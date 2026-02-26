# Оперативная память

> **Инструкции:** `/Users/alexander/Github/CLAUDE.md` | **Настройте под свою экосистему**

## СТАРТ СЕССИИ (читать ДО любого действия)

> Без этого — агент работает вслепую. Обязательно для каждой новой сессии.

| # | Файл | Зачем |
|---|------|-------|
| 1 | `/Users/alexander/Github/CLAUDE.md` | Протоколы Open/Work/Close, WP Gate, ArchGate |
| 2 | `memory/repo-type-rules.md` | Типы репо, что можно/нельзя в каждом |
| 3 | `memory/fpf-reference.md` | FPF различения, терминология |
| 4 | `/Users/alexander/Github/VK-offee/CLAUDE.md` | Правила работы с Pack VK-offee |
| 5 | Текущий WeekPlan в DS-strategy | Активные РП недели |

**Архитектура системы:** FPF (L1) → SPF+Pack (L2) → SRT+Downstream (L3)
**Pack = source-of-truth.** Downstream меняется вслед за Pack.
**Агент работает по протоколам CLAUDE.md — не по своим дефолтам.**

---

## БЛОКИРУЮЩИЕ (проверяй ВСЕГДА)

1. **WP Gate:** Задание → проверь РП в таблице ниже → нет = СТОП (CLAUDE.md § 2)
2. **Close:** push ≠ закрытие → capture-to-pack + подтверждение + backup (CLAUDE.md § 2)
3. **ArchGate ≥8:** Предлагать ТОЛЬКО решения с оценкой ≥8 по ArchGate (ЭМОГСС). Слабые решения (≤7) — НЕ предлагать.

## ВАЖНЫЕ (проверяй на рубежах)

3. **Capture:** На рубеже → «Capture: X → Y» (CLAUDE.md § 2)
4. **Отчёты:** ВСЕ репо в /Users/alexander/Github/
5. **Процессы:** Нельзя реализовывать без PROCESSES.md (CLAUDE.md § 3)

---

## РП текущей недели (W8: 22–28 фев)

> Порядок: in_progress → pending → done.

| # | РП | Бюджет | Статус | Дедлайн |
|---|-----|--------|--------|---------|
| 1 | Интеграция экзокортекса с VK-offee и творческим конвейером | 2h | done | 22 фев |
| 2 | Создать "Производственная система кухни STA v1.0" - Раздел 1: Модель расчёта себестоимости | 3h | done | 24 фев |
| 3 | Создать "Производственная система кухни STA v1.0" - Раздел 2: Модель оплаты труда | 2h | done | 25 фев |
| 6 | Настройка автосинхронизации Obsidian → GitHub (creativ-convector) | 30m | done | 25 фев |
| 4 | Создать стандарт технологических карт (ТТК) | 2h | done | 25 фев |
| 5 | План РП по парку (разрешение на строительство) | 1h | pending | 27 фев |

---

## Экосистема репозиториев

| Репо | Тип | Назначение | Путь |
|------|-----|-----------|------|
| **VK-offee** | Pack | База знаний кофейни (рецепты, процессы, люди) | ~/Github/VK-offee |
| **creativ-convector** | Downstream | Творческий конвейер (заметки → черновики → Pack) | ~/Github/creativ-convector |
| **DS-strategy** | Governance | Стратегический хаб (планы, отчёты, inbox) | ~/Github/DS-strategy |
| **FMT-exocortex-template** | Format | Шаблон системы (только чтение) | ~/Github/FMT-exocortex-template |

## Интеграция

✅ **Скрипт analyze_gaps.py** - автоматический поиск недостающей информации:
- Анализирует пробелы в VK-offee (статус yellow/red)
- Ищет информацию в творческом конвейере
- Запуск: `cd ~/Github/creativ-convector/.github/scripts && python3 analyze_gaps.py`

---

## Навигация (Слой 3)

| Тема | Файл |
|------|------|
| Различения (жёсткие пары) | `memory/hard-distinctions.md` |
| FPF (навигация, принципы) | `memory/fpf-reference.md` |
| Правила по типам репо | `memory/repo-type-rules.md` |
| Чеклисты | `memory/checklists.md` |
| **SOTA-практики** | `memory/sota-reference.md` |
| Обслуживание CLAUDE.md | `memory/claude-md-maintenance.md` |
| Урок WP Gate | `memory/wp-gate-lesson.md` |
| **Системно-специфичное** | **→ repo/CLAUDE.md** |
| Стратег | `DS-strategist/README.md` |
| **Архитектура экзокортекса** | `memory/architecture.md` |
