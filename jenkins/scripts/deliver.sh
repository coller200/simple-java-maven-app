#!/usr/bin/env bash

ssh ubuntu@13.208.172.148 -rm -rf /home/ubuntu/testjava/*
ssh ubuntu@13.208.172.148 mkdir -p /home/ubuntu/testjava
scp -r 'target/*.jar' ubuntu@13.208.172.148:/home/ubuntu/testjava/
