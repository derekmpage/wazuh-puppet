#! /usr/bin/env bash
set -e

echo `systemctl status`
echo `ls -lah`
echo `git status`
echo `git branch`



cd kitchen

mkdir -p modules/wazuh

cd .. && cp -r `ls -A | grep -v "kitchen"` kitchen/modules/wazuh/

cd kitchen # Access kitchen folder

bundle install

echo "Kitchen is creating the new instances"
bundle exec kitchen create # creating new kitchen instances
bundle exec kitchen converge
bundle exec kitchen destroy