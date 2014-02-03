#!/bin/sh
exec chpst -u apps run >>/var/log/newrelic_haproxy_agent.log 2>&1
