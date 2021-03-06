#!/bin/bash

source "/etc/stickshift/stickshift-node.conf"
source ${CARTRIDGE_BASE_PATH}/abstract/info/lib/util

for f in ~/.env/*
do
  . $f
done

# Hot deployment support
if hot_deploy_marker_is_present; then
  echo "Hot deploy marker is present. Touching Passenger restart.txt to trigger redeployment."
  touch ${OPENSHIFT_REPO_DIR}tmp/restart.txt
fi

/usr/bin/scl enable ruby193 "user_post_deploy.sh"
