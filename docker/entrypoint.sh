#!/bin/sh

if [ -z "$BACKEND_HOSTNAME" ]; then
    echo "BACKEND_HOSTNAME not set"
    exit 1
fi

if [ -z "$PROXY_HOSTNAME" ]; then
    echo "PROXY_HOSTNAME not set"
    exit 1
fi

if [ -z "$CF_ACCESS_CLIENT_ID" ]; then
    echo "CF_ACCESS_CLIENT_ID not set"
    exit 1
fi

if [ -z "$CF_ACCESS_CLIENT_SECRET" ]; then
    echo "CF_ACCESS_CLIENT_SECRET not set"
    exit 1
fi

sed -i s/pipedapi.kavin.rocks/"$BACKEND_HOSTNAME"/g /usr/share/nginx/html/assets/*
sed -i s/Backend-Hostname-Placeholder/"$BACKEND_HOSTNAME"/g /usr/share/nginx/html/assets/*
sed -i s/Proxy-Hostname-Placeholder/"$PROXY_HOSTNAME"/g /usr/share/nginx/html/assets/*
sed -i s/CF-Access-Client-Id-Placeholder/"$CF_ACCESS_CLIENT_ID"/g /usr/share/nginx/html/assets/*
sed -i s/CF-Access-Client-Secret-Placeholder/"$CF_ACCESS_CLIENT_SECRET"/g /usr/share/nginx/html/assets/*
nginx -g "daemon off;"
