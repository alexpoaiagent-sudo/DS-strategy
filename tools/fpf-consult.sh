#!/bin/bash
# fpf-consult.sh — FPF Консультант (OpenAI Assistants API v2)
# Использование: fpf-consult.sh "вопрос"
# Ассистент знает FPF-Spec.md (43k строк) через vector store + file_search

set -e

# Загрузка ключа
if [ -f ~/Github/VK-offee-rag/.env ]; then
  set -a; source ~/Github/VK-offee-rag/.env; set +a
fi

if [ -z "$OPENAI_API_KEY" ]; then
  echo "❌ OPENAI_API_KEY не найден в ~/Github/VK-offee-rag/.env"
  exit 1
fi

# Получить вопрос
if [ $# -gt 0 ]; then
  QUESTION="$*"
elif [ -p /dev/stdin ]; then
  QUESTION=$(cat)
else
  echo "Использование: fpf-consult.sh \"вопрос\""
  exit 1
fi

python3 - "$QUESTION" << 'PYTHON'
import sys, json, urllib.request, os, time, re

question = sys.argv[1]
api_key = os.environ["OPENAI_API_KEY"]
ASSISTANT_ID = "asst_Paf2mQ4Qu4PI3eUG0bQI68vY"

headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {api_key}",
    "OpenAI-Beta": "assistants=v2"
}

def api(method, path, data=None):
    url = f"https://api.openai.com/v1{path}"
    body = json.dumps(data).encode() if data else None
    req = urllib.request.Request(url, data=body, headers=headers, method=method)
    with urllib.request.urlopen(req) as r:
        return json.loads(r.read())

# 1. Создать Thread
thread = api("POST", "/threads")
thread_id = thread["id"]

# 2. Добавить вопрос
api("POST", f"/threads/{thread_id}/messages", {
    "role": "user",
    "content": question
})

# 3. Запустить Run
run = api("POST", f"/threads/{thread_id}/runs", {
    "assistant_id": ASSISTANT_ID
})
run_id = run["id"]

# 4. Ждём завершения (polling)
print("⏳ FPF Консультант думает...", flush=True)
for _ in range(60):
    time.sleep(2)
    run = api("GET", f"/threads/{thread_id}/runs/{run_id}")
    status = run["status"]
    if status == "completed":
        break
    elif status in ("failed", "cancelled", "expired"):
        err = run.get("last_error", {})
        print(f"❌ Ошибка run: {status} — {err}")
        sys.exit(1)

# 5. Получить ответ
messages = api("GET", f"/threads/{thread_id}/messages")
answer = messages["data"][0]["content"][0]["text"]["value"]

# Убираем citation-сноски
answer = re.sub(r'【\d+:\d+†[^\】]*】', '', answer)

print("\n" + "─" * 60)
print(answer)
print("─" * 60)
PYTHON
