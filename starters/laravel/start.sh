#!/bin/sh

env=${APP_ENV:-production}

if [ "$env" != "local" ]; then
    (cd /application && php artisan config:cache && php artisan route:cache && php artisan view:cache)
fi

role=${CONTAINER_ROLE:-app}

echo "Starting with role $role"

if [ "$role" = "app" ]; then
    exec /usr/local/sbin/php-fpm
elif [ "$role" = "scheduler" ]; then
    exec /usr/bin/supercronic /opt/starter/laravel/crontab
elif [ "$role" = "worker" ]; then
    exec /usr/local/bin/php /application/artisan horizon
else
    echo "Could not match the container role \"$role\""
    exit 1
fi
