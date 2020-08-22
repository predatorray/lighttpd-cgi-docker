#!/usr/bin/env bash

if [[ "$#" -eq 0 ]]; then
	exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
else
    exec "$@"
fi
