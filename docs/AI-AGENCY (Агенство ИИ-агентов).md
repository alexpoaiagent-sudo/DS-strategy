---
type: governance-doc
created: 2026-03-25
status: active
---

# Агенство ИИ-агентов

## Концепция

Репозиторий `agency-agents` содержит 75+ специализированных агентов. Механизм найма позволяет подключать нужных агентов к задачам экзокортекса.

## Структура agency-agents

| Категория | Агенты | Примеры |
|-----------|--------|---------|
| **engineering** | Backend, Frontend, DevOps, AI Engineer | engineering-backend-architect.md |
| **marketing** | Content, SEO, Social Media | marketing-content-strategist.md |
| **design** | UI/UX, Brand, Visual | design-ui-ux-designer.md |
| **product** | PM, Strategy, Analytics | product-manager.md |
| **sales** | Sales Engineer, Account Manager | sales-engineer.md |
| **specialized** | Domain experts | specialized-*.md |

## Механизм найма

### 1. Поиск агента

```bash
# Поиск по категории
ls ~/Github/agency-agents/engineering/

# Поиск по ключевому слову
grep -r "telegram" ~/Github/agency-agents/ --include="*.md"
```

### 2. Активация агента

Для задачи создаётся контекст с агентом:

```markdown
# Задача: [описание]

## Нанятый агент
Файл: `~/Github/agency-agents/[category]/[agent].md`

## Инструкция Claude
Прочитай агента и работай в его роли для этой задачи.
```

### 3. Интеграция с РП

При создании РП можно указать:
- **Агент**: какой специалист нужен
- **Файл**: путь к агенту в agency-agents

## Примеры использования

### Backend-задача
```
РП: Разработка API для VK-offee
Агент: Backend Architect
Файл: engineering/engineering-backend-architect.md
```

### Telegram-бот
```
РП: Развитие VK-телебота
Агент: Integration Developer
Файл: integrations/integrations-telegram-bot-developer.md
```

### Контент
```
РП: Написание гайда по кофе
Агент: Content Strategist
Файл: marketing/marketing-content-strategist.md
```

## Правила

1. **Один агент на РП** — фокус на специализации
2. **Явная активация** — прочитать файл агента перед работой
3. **Контекст задачи** — агент работает в рамках экзокортекса
4. **Адаптация** — агент следует FPF+SPF+SRT, не своим дефолтам

## Каталог полезных агентов

| Задача | Агент | Файл |
|--------|-------|------|
| API/Backend | Backend Architect | engineering/engineering-backend-architect.md |
| Frontend | Frontend Developer | engineering/engineering-frontend-developer.md |
| DevOps | DevOps Automator | engineering/engineering-devops-automator.md |
| Code Review | Code Reviewer | engineering/engineering-code-reviewer.md |
| AI/ML | AI Engineer | engineering/engineering-ai-engineer.md |
| Контент | Content Strategist | marketing/marketing-content-strategist.md |
| Стратегия | Strategy Consultant | strategy/strategy-consultant.md |
| Тестирование | QA Engineer | testing/testing-qa-engineer.md |

## Утилита найма

Скрипт `~/Github/agency-agents/hire.sh`:

```bash
# Список категорий
bash hire.sh list

# Агенты в категории
bash hire.sh show engineering

# Поиск по ключевому слову
bash hire.sh search backend

# Показать агента
bash hire.sh hire engineering/engineering-backend-architect.md
```

---

*Источник: https://github.com/alexpoaiagent-sudo/agency-agents*
