---
type: scheduler-report
date: 2026-03-22
week: W12
agent: Синхронизатор
---

# Отчёт планировщика: 2026-03-22

## 🔴 Требуется внимание

## Результаты

| # | Задача | Статус | Время |
|---|--------|--------|-------|
| 1 | Сканирование кода | **✅ успех** | 2026-03-22 00:01:02 |
| 2 | Стратег утренний | **❌ ошибка** | 2026-03-22 13:31:46 |
| 3 | Разбор заметок | **✅ успех** | 2026-03-21 22:11:44 |
| 4 | Обзор недели | **⚪ нет статуса** | — |
| 5 | Проверка входящих | **✅ успех** | 2026-03-21 22:12:50 |
| 6 | Отчёт планировщика | **🟦 в процессе** | 2026-03-22 13:31:46 |

## Проблемы и действия

### strategist-morning
- Статус: ошибка
- Обновлено: 2026-03-22 13:31:46
- Exit code: 17
- Причина: [2026-03-22 12:05:15] Morning: running day plan [2026-03-22 12:05:15] Fetching WakaTime data (day mode) [2026-03-22 12:05:15] Fetching WakaTime data (week mode) [2026-03-22 12:05:15] Starting scenario: day-plan [2026-03-22 12:05:15] Command file: /Users/alexander/Github/FMT-exocortex-template/roles/strategist/prompts/day-plan.md [2026-03-22 12:05:15] Claude path: /opt/homebrew/bin/claude [2026-03-22 13:31:46] CRITICAL: Auth failed via helper/env/custom API 
- Лог: /Users/alexander/logs/synchronizer/scheduler-2026-03-22.log
