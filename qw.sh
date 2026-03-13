# 
set -euo pipefail

# Папка с репозиторием препода (mfua)
TEACHER_REPO="/c/Users/dncik/Desktop/distant/mfua"

# Папка с твоим репозиторием (PITPO) 
MY_REPO="/c/Users/dncik/Desktop/distant/PITPO"

echo "🔄 Обновление репозитория препода (mfua)..."
cd "$TEACHER_REPO"
git pull

echo "📁 Копирование файлов из mfua в PITPO (без .git)..."
rsync -a --exclude='.git' "$TEACHER_REPO/" "$MY_REPO/"


echo "✅ Файлы скопированы. Подготовка коммита в PITPO..."
cd "$MY_REPO"

echo "Проверка статуса..."
git status

# Если нет изменений — выходим
if git diff --quiet; then
    echo "Нет изменений для коммита. Готово!"
    exit 0
fi

echo "Добавление всех изменений в индекс..."
git add .

# Запрашиваем сообщение для коммита
read -p "Введите сообщение коммита (или Enter для пропуска): " commit_message

if [ -z "$commit_message" ]; then
    echo "Коммит отменён."
    exit 0
fi

echo "Создание коммита: $commit_message"
git commit -m "$commit_message"

echo "🚀 Пуш в твой репозиторий (origin main)..."
git push origin main

echo "🎉 Всё готово! PITPO обновлён файлами препода и запушен."

