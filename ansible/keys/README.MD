ssh-keygen -t rsa -b 4096
ssh-copy-id -f "-o IdentityFile web.pem" ubuntu@54.91.7.23
ssh -o ' IdentityFile web.pem' 'ubuntu@54.91.7.23'
ssh ubuntu@54.91.7.23

Using Password
Go to the file /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
Update PasswordAuthentication yes
Restart SSH -> sudo systemctl restart ssh

