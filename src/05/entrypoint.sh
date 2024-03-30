#!/bin/bash

service nginx start
service nginx -s reload
spawn-fcgi -p 8080 ./my_server

while true; do
    wait
done

/bin/bash