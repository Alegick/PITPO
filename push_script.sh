#!/bin/bash

# Скрипт для автоматического добавления, коммита и пуша изменений в Git

echo "Проверка статуса..."
git status

echo "Добавление всех изменений в индекс..."
git add .

# Запрашиваем сообщение для коммита у пользователя
read -p "Введите сообщение коммита: " commit_message

if [ -z "$commit_message" ]; then
    echo "Сообщение коммита не может быть пустым. Отмена операции."
else
    echo "Создание коммита с сообщением: $commit_message"
    git commit -m "$commit_message"

    echo "Отправка изменений на GitHub..."
    git push origin main # Убедитесь, что ваша ветка называется main или master
    echo "Готово! Изменения отправлены."
fi
