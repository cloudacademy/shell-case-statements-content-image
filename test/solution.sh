#!/bin/bash

echo "Number of days in current month: "

MONTH=$(date +%m)

case "$MONTH" in
    02)
        echo 28 days...29 in a leap year
        ;;
    04|06|09|11)
        echo 30 days
        ;;
    *)
        echo 31 days
        ;;
esac