#!/bin/sh
chmod 400 ./src/private_key
chmod -R 600 ./src/private_key
chmod 700 ./src/private_key
ssh -i ./src/private_key jb_user@45.120.824.45 -o "StrictHostKeyChecking no" '
  # run code inside your virtual machine here:
    sudo docker system prune --force
    sudo rm -r gcloud-vm-ssh
    sudo git clone https://{my_github_key}@github.com/jmbl1685/gcloud-vm-ssh.git
    cd gcloud-vm-ssh
    sudo docker rmi $(sudo docker images 'boilerplate-typescript' -a -q)
    sudo docker stop $(sudo docker ps -a -q  --filter ancestor=boilerplate-typescript)
    sudo docker rm $(sudo docker ps -a -q  --filter ancestor=boilerplate-typescript)
    sudo docker build . -t boilerplate-typescript
    sudo docker run -d -p 3000:3000 boilerplate-typescript
    sudo docker ps
'
