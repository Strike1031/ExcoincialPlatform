#!/bin/bash
set -xv

#
# ***************************************************************************
# ***
# ***        proof of docker container instance
# ***
# ***************************************************************************
#

uname -n 2>&1

#
# ***************************************************************************
# ***
# ***        proof of environment
# ***
# ***************************************************************************
#

env

#
# ***************************************************************************
# ***
# ***        proof of git revision
# ***
# ***************************************************************************
#

cd /root/excoincial/excoincial-peatio ; git log --stat | head -n 18

#
# ***************************************************************************
# ***
# ***        proof of unversioned file changes dates
# ***
# ***************************************************************************
#

cd /root/excoincial/excoincial-peatio ; git add --dry-run . | \
  sed 's/add /\/root\/excoincial\//g' | \
  xargs ls -la

#
# ***************************************************************************
# ***
# ***        proof of zero effect of unversioned
# ***        changes over user's reported case
# ***
# ***************************************************************************
#

cd /root/excoincial/excoincial-peatio ; git add --dry-run . | \
  sed 's/add /\/root\/excoincial\//g' | \
  xargs git diff

#
# ***************************************************************************
# ***
# ***        proof of nginx access logs
# ***
# ***************************************************************************
#

cat /var/log/nginx/access.log | grep "45.33.136.26 - - \[15\/Aug\/2019"
