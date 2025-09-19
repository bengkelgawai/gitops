#!/bin/sh
for host in $(echo $SFTP_HOSTS | tr ',' '\n'); do
  echo "Distributing files to $host"
  success=0
  for attempt in 1 2 3; do
    sshpass -p "$SFTP_PASS" sftp -o StrictHostKeyChecking=no $SFTP_USER@$host <<EOC
      put /files/*
      bye
EOC
    if [ $? -eq 0 ]; then
      success=1
      echo "SFTP to $host succeeded on attempt $attempt"
      break
    else
      echo "SFTP to $host failed on attempt $attempt"
      sleep 2
    fi
  done
  if [ $success -eq 0 ]; then
    echo "SFTP to $host failed after 3 attempts, exiting."
    exit 1
  fi
done