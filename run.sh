xvfb-run \
--wait=5 -a \
--server-args='-screen 0 1600x1200x24 -ac +extension GLX' \
bash /opt/src/main.sh
