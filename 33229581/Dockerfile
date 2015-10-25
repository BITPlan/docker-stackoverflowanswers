FROM ubuntu:14.04

ADD ./myproject/ /home/root/myproject/

WORKDIR /home/root/myproject/

# Some other stuff...

CMD [ "/bin/bash", "/home/root/myproject/uwsgi.sh", "start" ] 