FROM alpine:latest
RUN apk add --no-cache openssh sshpass
COPY distribute.sh /scripts/distribute.sh
RUN chmod +x /scripts/distribute.sh
ENTRYPOINT ["/bin/sh", "/scripts/distribute.sh"]
