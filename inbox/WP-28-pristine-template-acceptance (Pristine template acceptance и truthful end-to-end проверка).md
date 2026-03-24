---
type: work-package-context
id: WP-28
created: 2026-03-25
status: pending
budget: 2h
depends_on: WP-27
---

# РП#28: Pristine template acceptance и truthful end-to-end проверка

## Почему это отдельный РП

После WP-27 source-of-truth, close-flow, validator и backup semantics были приведены к truthful модели на рабочем контуре. Следующий шаг — отдельно проверить, что система truthfully работает end-to-end не только на configured fork, но и на pristine template, где должны срабатывать строгие hygiene-checks без локальных подстановок.

## Цель

Подтвердить обе truthful-модели одним acceptance cycle:
- pristine template проходит строгую template-валидацию;
- configured fork truthfully определяется как configured и не падает на ожидаемых локальных путях;
- открытие дня, критические сценарии и закрытие дня не расходятся между status layer, runtime и documented contract.

## Что нужно проверить

### 1. Pristine template validation
- взять действительно pristine copy template;
- запустить `setup/validate-template.sh`;
- подтвердить, что strict hygiene checks работают как задумано;
- убедиться, что required files и protocol set полные.

### 2. Configured fork validation
- повторно подтвердить, что configured fork определяется truthfully;
- убедиться, что локальные пути и author-specific substitutions не дают ложных FAIL;
- проверить, что GitHub Actions и локальный validator используют одну и ту же truth-модель.

### 3. End-to-end open/work/close consistency
- пройти сценарий открытия;
- проверить критический runtime path до close-flow;
- truthfully закрыть цикл и убедиться, что runtime contract, docs и status artifacts не расходятся.

### 4. Backup / mirror reproducibility
- подтвердить, что runtime mirror воспроизводим из setup/update path;
- подтвердить, что backup snapshot не маскируется под canonical source;
- проверить, что backup semantics остаются явными после acceptance run.

## Границы пакета

### Входит
- pristine acceptance для template validator;
- configured acceptance для локального fork;
- end-to-end проверка truthful path model;
- проверка согласованности open/work/close contract.

### Не входит
- новый redesign scheduler/nightly flow;
- новые архитектурные изменения вне acceptance scope;
- правки, не требующиеся для acceptance подтверждения.

## Критерий завершения WP-28

- Pristine template проходит strict validation без ложных исключений;
- Configured fork проходит truthful validation как configured;
- Open/work/close cycle подтверждён end-to-end;
- Runtime, docs, validator и backup semantics не расходятся;
- Acceptance result зафиксирован отдельным truthful close.
