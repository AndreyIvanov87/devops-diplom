#!/usr/bin/env bash
apt-get update
apt-get install -y rsync
mkdir /home/gitlab-runner/.ssh
chown gitlab-runner:gitlab-runner /home/gitlab-runner/.ssh/
/usr/bin/mv /etc/gitlab-runner/id_rsa /home/gitlab-runner/.ssh/
