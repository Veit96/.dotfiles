#!/bin/bash


detox -r "$1"

chmod 755 $(find "$1" -type d)
chmod 644 $(find "$1" -type f)

#find /opt/lampp/htdocs \
#\( -type f -exec chmod u+rw,go+r {} \; \) , \
#\( -type d -exec chmod u+rwxs,go+rx {} \; \)
