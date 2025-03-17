ssh-keygen -t rsa -b 4096
ssh-copy-id -f "-o IdentityFile web.pem" ubuntu@54.91.7.23
ssh -o ' IdentityFile web.pem' 'ubuntu@54.91.7.23'
ssh ubuntu@54.91.7.23

