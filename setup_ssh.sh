#!/bin/bash
sed -i \
  's/^#*PermitRootLogin.*/PermitRootLogin yes/' \
  /etc/ssh/sshd_config

sed -i \
  's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' \
  /etc/ssh/sshd_config

echo -e "password\npassword" | sudo passwd root
rm /root/.ssh -rf
systemctl restart sshd
