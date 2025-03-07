#!/bin/bash

# Директория логов
LOG_DIR="/var/log"

# Шаблон поиска ошибок
ERROR_PATTERNS="error|Error|ERROR|warning|Warning|WARNING|fail|Fail|FAIL"

# Ищем ошибки во всех лог-файлах в директории
grep -E "$ERROR_PATTERNS" "$LOG_DIR"/*.log 2>/dev/null