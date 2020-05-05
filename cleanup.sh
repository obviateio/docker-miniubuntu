#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

apt-get clean
apt-get autoremove -y --purge
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -rf /var/lib/{apt,cache,log}/

find /bd_build/ -not \( -name 'bd_build' -or -name 'buildconfig' -or -name 'cleanup.sh' \) -delete

# clean up python bytecode
find / -mount -name *.pyc -delete
find / -mount -name *__pycache__* -delete

rm -f /etc/ssh/ssh_host_*
