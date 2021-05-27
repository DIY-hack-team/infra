#!/usr/bin/env bash
curDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
. ${curDir}/.env

rm -rf build
mkdir build
tar cfz build/infra.tar.gz etc
ssh ${DEPLOY_USER}@${DEPLOY_HOST} "rm -rf /opt/infra; mkdir /opt/infra; sudo rm -f /etc/nginx/conf.d/gui.conf; sudo ln -s /opt/infra/etc/gui.conf /etc/nginx/conf.d/gui.conf"
scp -r ${curDir}/build/infra.tar.gz ${DEPLOY_USER}@${DEPLOY_HOST}:/opt/infra/infra.tar.gz
ssh ${DEPLOY_USER}@${DEPLOY_HOST} "cd /opt/infra && tar xf infra.tar.gz && sudo chown root:root /opt/infra/etc/nginx-selfsigned.key && sudo chmod 600 /opt/infra/etc/nginx-selfsigned.key && sudo service nginx restart"
