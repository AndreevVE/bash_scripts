#!/usr/bin/env bash

NUM_ERRORS="grep -rni 'error' /var/log 2>/dev/null | wc -l"
eval $NUM_ERRORS
