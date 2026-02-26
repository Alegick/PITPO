#!/bin/bash


echo "🔄 Обновление от препода (upstream)..."

git fetch upstream
git checkout main
git merge upstream/main

echo "✅ Upstream обновлён!"

echo "📥 Pull origin для синхронизации..."
git pull origin main

echo "Проверка статуса..."
git status

if git diff --quiet; then
    echo "Нет изменений для коммита. Готово!"
    exit 0
fi

echo "Добавление всех изменений в индекс..."
git add .

read -p "Введите сообщение коммита (или Enter для пропуска): " commit_message

if [ -z "$commit_message" ]; then
    echo "Коммит отменён."
    exit 0
fi

echo "Создание коммита: $commit_message"
git commit -m "$commit_message"

echo "🚀 Пуш на GitHub..."
git push origin main

echo "🎉 Всё готово! Репозиторий обновлён и запушен."




#./df.sh