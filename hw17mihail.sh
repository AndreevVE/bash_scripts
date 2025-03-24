#!/bin/bash

# Получаем адрес из аргумента или спрашиваем у пользователя
TARGET=${1:-$(read -p "Введите адрес для пинга: " input && echo $input)}

# Счётчик неудачных пингов
fail_count=0

echo "Начинаем пинговать $TARGET..."

while true; do
    # Выполняем один пинг, выводим только строку с time
    output=$(ping -c 1 -W 1 "$TARGET" | grep 'time=')

    if [ -n "$output" ]; then
        # Извлекаем значение времени
        ping_time=$(echo "$output" | sed -E 's/.*time=([0-9]+(\.[0-9]+)?) ms.*/\1/')

        echo "Время пинга: ${ping_time} мс"

        # Проверка времени пинга
        if (( $(echo "$ping_time > 100" | bc -l) )); then
            echo "Пинг выше 100 мс!"
        fi

        # Сброс счётчика неудач
        fail_count=0
    else
        echo "Пинг не удался!"
        ((fail_count++))

        if [ "$fail_count" -ge 3 ]; then
            echo "3 последовательных неудачных пинга"
            fail_count=0  # можно обнулить или выйти
        fi
    fi

    sleep 1
done