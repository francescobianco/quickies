#!/bin/bash


database=/var/quickies/quickies.db

if [ ! -f "${database}" ]; then

touch "$database"

sqlite3 "$database" < /var/www/html/public/quickies.sql
php -r '



echo "ciao\n";

'

fi

echo "[webrequest] Run main process..."
#docker-php-entrypoint "$@"
