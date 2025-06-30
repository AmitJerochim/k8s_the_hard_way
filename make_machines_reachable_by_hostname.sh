#!/bin/bash
#generate lookup table
echo "" > hosts
echo "# Kubernetes The Hard Way" >> hosts

while read IP FQDN HOST SUBNET; do
    ENTRY="${IP} ${FQDN} ${HOST}"
    echo $ENTRY >> hosts
done < configs/machines.txt

cat hosts
#append lookup table to /etc/hosts in bastion
cat hosts >> /etc/hosts

# verify ssh using hostname works from bastion
for host in master worker1 worker2
   do ssh -o StrictHostKeyChecking=no root@${host} hostname
done

# append lookup table to /etc/hosts on master and workers
while read IP FQDN HOST SUBNET; do
  scp hosts root@${HOST}:~/
  ssh -n \
    root@${HOST} "cat hosts >> /etc/hosts"
done < configs/machines.txt
