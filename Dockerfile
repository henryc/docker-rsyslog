# Use Alpine Linux as the base image
FROM alpine:latest

# Install rsyslog and other dependencies
RUN apk --no-cache add rsyslog

# Copy the rsyslog configuration file
COPY ./rsyslogd.conf /etc/rsyslogd.conf

# Set the health check command
HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD ["pgrep", "rsyslogd"]

# Expose the default syslog port
EXPOSE 514/tcp 514/udp

# Start rsyslog service
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]
