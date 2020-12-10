#!/bin/bash
set -e

GAMEDIR="${HOME}/DedicatedServer"

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

cd "${HOME}/steam"
./steamcmd.sh +login anonymous +force_install_dir ${HOME} +app_update 530870 +quit

mkdir -p "${GAMEDIR}/Logs"

Xvfb :1 -screen 0 800x600x24 &
export WINEDLLOVERRIDES="mscoree,mshtml="
export DISPLAY=:1

cd "${GAMEDIR}"
sh -c 'until [ "`netstat -ntl | tail -n+3`" ]; do sleep 1; done
sleep 5 # gotta wait for it to open a logfile
tail -F Logs/current.log ../Logs/*/*.log ../wine.log' &

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":${GAMEDIR}$ /opt/wine-staging/bin/wine ${MODIFIED_STARTUP} &> ${HOME}/wine.log"

# Run the Server
eval /opt/wine-staging/bin/wine ${MODIFIED_STARTUP} &> ${HOME}/wine.log
