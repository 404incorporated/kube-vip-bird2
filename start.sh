#!/bin/bash

bird-gen-config /etc/bird/bird.conf.tmpl /etc/bird/bird.conf

#/usr/sbin/bird -d -u $BIRD_RUN_USER -g $BIRD_RUN_GROUP $BIRD_ARGS