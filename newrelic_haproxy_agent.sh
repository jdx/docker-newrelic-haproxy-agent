#!/bin/sh
exec chpst -u agent newrelic_haproxy_agent run >>/var/log/newrelic_haproxy_agent.log 2>&1
