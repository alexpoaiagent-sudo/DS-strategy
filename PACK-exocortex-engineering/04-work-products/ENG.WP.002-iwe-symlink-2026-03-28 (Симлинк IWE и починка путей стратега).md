---
type: work-product
pack: PACK-exocortex-engineering
id: ENG.WP.002
title: Симлинк ~/IWE + починка путей стратега (инцидент 2026-03-28)
created: 2026-03-28
status: done
linked_fm: ENG.FM.001 (новый паттерн FM-06)
---

# ENG.WP.002 — Симлинк ~/IWE→~/Github + пути стратега

## Инцидент

**Дата:** 2026-03-28
**Симптом:** `strategist.sh day-plan` → `cd: /Users/alexander/IWE/DS-strategy: No such file or directory`
**Второй симптом:** `CLAUDE_PATH="{{CLAUDE_PATH}}"` — placeholder не подставлен

## Диагностика

Строки в strategist.sh (из шаблона Цырена):
- `WORKSPACE="$HOME/IWE/DS-strategy"` — захардкожен путь Цырена
- `CLAUDE_PATH="{{CLAUDE_PATH}}"` — placeholder не подставлен при setup.sh

У нас рабочая папка `~/Github/` — путь расходится с апстримом.
После каждого `git pull` от Цырена пути будут перезаписываться обратно.

## Решение

**Симлинк** (а не переименование):
```bash
ln -s ~/Github ~/IWE
```
`~/IWE` → `~/Github`. Все пути Цырена начинают работать без правок скриптов.

**Дополнительно:** подставлен реальный `CLAUDE_PATH` в strategist.sh.

## Системный фикс

Post-merge hook упрощён — патчинг путей больше не нужен.
Симлинк решает проблему на уровне файловой системы.

## Верификация (Шаг 5)

```bash
ls ~/IWE/DS-strategy/current/  # → файлы видны ✅
strategist.sh day-plan          # → проходит cd, упирается в CLAUDECODE=1 ✅
```

Новый блокер: `Claude Code cannot be launched inside another Claude Code session`
— это ожидаемо, не баг. Стратег запускается из чистого терминала (launchd).

## Урок → добавить в ENG.FM.001 (FM-06)

Путь рабочей папки у Цырена (`~/IWE/`) и у нас (`~/Github/`) расходятся.
Решение: симлинк `~/IWE → ~/Github` — один раз, навсегда.
