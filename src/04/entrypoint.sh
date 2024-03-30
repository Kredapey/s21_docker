#!/bin/bash

gcc server.c -lfcgi -o my_server
service nginx start
service nginx -s reload
spawn-fcgi -p 8080 ./my_server

/bin/bash