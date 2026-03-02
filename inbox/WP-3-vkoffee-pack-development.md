---
type: wp-context
wp_id: W09-3
status: pending
created: 2026-03-02
budget: 4h
---

# РП#3: Развитие архитектуры VK-offee (5 Pack)

## Цель

Заполнить 5 Pack предметными областями: методы, work products, failure modes.

## Артефакт

Заполненные PACK с методами, WP, FM:
- `PACK-bar/` — барная стойка
- `PACK-kitchen/` — кухня
- `PACK-service/` — обслуживание
- `PACK-management/` — управление сменой
- `PACK-hr/` — персонал

## Текущее состояние (из project-brain.md)

**2026-02-28:** Создана структура 5 Pack, мигрированы 4 файла в PACK-kitchen:
- `KITCHEN.METHOD.001` — изменение ингредиентов
- `KITCHEN.METHOD.002` — списание/переработка
- `KITCHEN.ENTITY.001` — концепция кухни
- `KITCHEN.WP.001` — производственная система STA

## План работы

### Фаза 1: Инвентаризация (Haiku)

- [ ] Прочитать `knowledge-base/БАР/` → список тем для PACK-bar
- [ ] Прочитать `knowledge-base/КУХНЯ/` → список тем для PACK-kitchen
- [ ] Прочитать `knowledge-base/ДЛЯ ШЕФА/` → список тем для PACK-management
- [ ] Создать backlog методов для каждого Pack

### Фаза 2: Извлечение методов (Sonnet)

Для каждого Pack:
1. Применить `process/07-method-and-product-extraction.md`
2. Создать карточки методов в `03-methods/`
3. Создать work products в `04-work-products/`
4. Обновить индекс `02-domain-entities/02C-methods-index.md`

### Фаза 3: Failure Modes (Sonnet)

Для каждого метода:
1. Применить `process/08-failure-modes-extraction.md`
2. Создать FM в `05-failure-modes/`
3. Добавить detection tests

### Фаза 4: Карты связей (Sonnet)

- [ ] Обновить `07-map/` для каждого Pack
- [ ] Связи между методами, WP, FM
- [ ] Context Map между Pack

## Process Lint (ОБЯЗАТЕЛЬНО!)

Перед каждым коммитом:
- [ ] Нет дидактического языка
- [ ] Method не является сценарием
- [ ] Work Product имеет критерии существования
- [ ] Failure Mode имеет тест обнаружения
- [ ] Структурные изменения отражены в map
- [ ] SoTA имеет критерий пересмотра

## Чек-лист

- [ ] Инвентаризация knowledge-base
- [ ] Backlog методов для 5 Pack
- [ ] Извлечение методов (минимум 3 метода на Pack)
- [ ] Создание WP для методов
- [ ] Создание FM для методов
- [ ] Обновление карт
- [ ] Process lint перед каждым коммитом
- [ ] Коммит + push
