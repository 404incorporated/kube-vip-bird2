#!/bin/bash

set -x

bird-gen-config /bird.conf.tmpl /etc/bird/bird.conf

/usr/sbin/bird -d