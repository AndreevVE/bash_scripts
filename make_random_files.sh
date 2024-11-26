#!/bin/bash

# Проверяем, передано ли количество файлов как аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: не указано количество файлов. Используйте $0 <количество_файлов>"
    exit 1
fi

# Переменная с количеством файлов для генерации
NUM_FILES=$1
EXT="sh txt"
ext=($EXT)
NUM_EXT=${#ext[*]}
# Создаем директорию для файлов, если она не существует
mkdir -p generated_files

# Генерируем случайные файлы с расширениями txt и sh
for ((i=1; i<=NUM_FILES; i++))
do
    # Генерируем случайное имя файла
    FILE_NAME="generated_files/file_$i-$(date '+%Y-%m-%d').${ext[$((RANDOM%NUM_EXT))]}"
    # Генерируем случайный текст для файла
    RANDOM_TEXT=$(head /dev/urandom | head -c 100)
    # Создаем файл с случайным именем и содержимым
    echo "$RANDOM_TEXT" > "$FILE_NAME"
    # Если файл с расширением sh, то добавляем права на исполнение
    if [[ "$FILE_NAME" == *.sh ]]; then
        chmod +x "$FILE_NAME"
    fi
done

echo "Файлы успешно созданы!"
