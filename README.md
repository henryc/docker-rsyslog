## Rsyslog Dockerfile

Rsyslog running in a linux container as a server, listening on 514 (tcp and udp), and writing to /var/log/syslog.

### Usage

This container will listen on 514/udp, and 514/tcp and write it to /var/log/syslog.

You can build the image using the following command:
```
docker build -t rsyslog-alpine .
```
After the image is built, you can run a container based on this image with:
```
docker run -d --name rsyslog-container --rm  -p 514:514/udp -p 514:514 -v "./syslog:/var/log/syslog" rsyslog-alpine 
```
Make sure to adjust the container name (rsyslog-container) and the image tag (rsyslog-alpine) to your preferences.

To test your Rsyslog configuration, you can use the logger utility. This tool should already be installed on your system. If not, check your distribution’s documentation for instructions on how to add it. With logger, you specify a message facility and priority with the -p option.

### Here are some examples of how to use logger to test your Rsyslog configuration
To send a message with the facility local6 and priority info to Rsyslog:
```
logger -p local6.info "This is a test message"
```
To send a message with the facility local7 and priority debug to Rsyslog:
```
logger -p local7.debug "This is another test message"
```
To send a message with the facility user and priority notice to Rsyslog:
```
logger -p user.notice "This is yet another test message"
```
You can also check the Rsyslog log file to see if it has been updated with new entries. The Rsyslog service keeps various log files in the /var/log directory. You can open these files using native commands such as tail, head, more, less, cat, and so forth, depending on what you are looking for. For example, to display boot and other kernel messages, view /var/log/messages:
```
cat /var/log/syslog
```
