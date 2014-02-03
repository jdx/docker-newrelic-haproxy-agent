echo "Stopping and removing container..."
docker stop newrelic_haproxy_agent
docker rm newrelic_haproxy_agent

set -e

echo "Building from Dockerfile..."
docker build -t newrelic_haproxy_agent_image .

echo "Running image..."
docker run -d -name newrelic_haproxy_agent newrelic_haproxy_agent_image

echo "Stopping image so it can be run by systemd..."
docker stop newrelic_haproxy_agent

echo "Resetting systemd conf..."
sudo cp newrelic_haproxy_agent.service /media/state/units/newrelic_haproxy_agent.service
sudo systemctl daemon-reload
sudo systemctl restart newrelic_haproxy_agent
