#!/usr/bin/env sh

echo "Service Starting..."

nohup /usr/sbin/php-fpm8.1 --nodaemonize --fpm-config /etc/php/8.1/fpm/php-fpm.conf >/dev/null 2>&1 &

echo "PHP-FPM Started."

exec nginx -g "daemon off;"
