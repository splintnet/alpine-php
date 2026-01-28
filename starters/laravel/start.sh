#!/bin/sh

env=${APP_ENV:-production}

if [ "$env" != "local" ]; then
    (cd /application && php artisan config:cache && php artisan route:cache && php artisan view:cache)
fi

role=${CONTAINER_ROLE:-app}

echo "Starting with role $role"

if [ "$role" = "app" ]; then
    exec /usr/local/sbin/php-fpm
elif [ "$role" = "octane" ]; then
    exec /usr/local/bin/php artisan octane:start --host=0.0.0.0
elif [ "$role" = "scheduler" ]; then
    exec /usr/bin/supercronic /opt/starters/laravel/crontab
elif [ "$role" = "horizon" ]; then
    exec /usr/local/bin/php /application/artisan horizon
elif [ "$role" = "worker" ]; then
    exec /usr/local/bin/php /application/artisan queue:work redis --no-interaction --sleep=3 --tries=3 --timeout=600
elif [ "$role" = "reverb" ]; then
    exec /usr/local/bin/php /application/artisan reverb:start
else
    echo "Could not match the container role \"$role\""
    exit 1
fi
