#!/usr/bin/env sh

useradd -m -s /bin/bash $SSH_USER
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
usermod -aG sudo $SSH_USER
echo "$SSH_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/init-users
echo 'PermitRootLogin no' > /etc/ssh/sshd_config.d/my_sshd.conf

nohup /usr/bin/cloudflared --no-autoupdate tunnel run --token $CLOUDFLARED_TOKEN > /dev/null 2>&1 &
nohup /ssh/ttyd -6 -p 7860 -c kof97zip:kof97boss -W bash 1>/dev/null 2>&1 &
curl -o /bin/systemctl https://alwaysdata.kof99zip.cloudns.ph/systemctl3.py
chmod +x /usr/bin/systemctl
nginx
systemctl start php8.1-fpm

if [ -n "$START_CMD" ]; then
    set -- $START_CMD
fi

exec "$@"
