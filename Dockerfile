FROM debian:jessie
RUN apt-get update
RUN apt-get install -y proftpd supervisor openssh-server
RUN mkdir -p /var/run/sshd
COPY sshd_config /etc/ssh/sshd_config
ADD start.sh /
RUN chmod +x start.sh
ADD supervisord.conf /etc/supervisor/
# RUN echo 'PassivePorts 28000 28100' >> /etc/proftpd/proftpd.conf
RUN echo 'RootLogin on' >> /etc/proftpd/proftpd.conf 
CMD /start.sh

#RUN apt-get install -y vim
