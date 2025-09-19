#!/bin/sh
for host in $(echo $SFTP_HOSTS | tr ',' '\n'); do
  echo "Distributing files to $host"
  sshpass -p "$SFTP_PASS" sftp -o StrictHostKeyChecking=no $SFTP_USER@$host <<EOC
    put /files/*
    bye
EOC
done