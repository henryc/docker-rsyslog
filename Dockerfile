# Use Alpine Linux as the base image
FROM alpine:latest

# Install rsyslog and other dependencies
RUN apk --no-cache add rsyslog

# Copy the rsyslog configuration file
COPY ./rsyslogd.conf /etc/rsyslogd.conf

# Expose the default syslog port
EXPOSE 514/tcp 514/udp

# Start rsyslog service
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]
