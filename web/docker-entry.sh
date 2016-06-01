#!/bin/bash
echo Starting Nginx
sed -Ei "s/PLATFORM_PORT/$PLATFORM_PORT_80_TCP_PORT/" /etc/nginx/sites-available/mattermost
if [ "$MATTERMOST_ENABLE_SSL" = true ]; then
    ssl="-ssl"
fi
ln -s /etc/nginx/sites-available/mattermost$ssl /etc/nginx/sites-enabled/mattermost
nginx -g 'daemon off;'
