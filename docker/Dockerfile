FROM ubuntu:20.04

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y curl git apache2 apache2-utils supervisor


COPY git.conf /etc/apache2/sites-available/git.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir /var/www/git
RUN mkdir /var/www/git/app.git
WORKDIR /var/www/git/app.git
RUN cd /var/www/git/app.git
RUN pwd; git init --bare
RUN touch git-daemon-export-ok
RUN cp hooks/post-update.sample hooks/post-update
RUN git config http.receivepack true
RUN git update-server-info
RUN chown -Rf www-data:www-data /var/www/git/app.git
RUN ls -la /var/www/git/
RUN a2enmod env cgi alias rewrite
RUN a2dissite 000-default.conf
RUN a2ensite git.conf

RUN service apache2 stop
#RUN systemctl disable apache2
RUN mv /etc/init.d/apache2 /root/apache2-initd
RUN mv /etc/systemd/system/multi-user.target.wants/apache2.service /root/
#RUN systemctl daemon-reload
RUN mkdir -p /var/log/supervisor
EXPOSE 80

CMD ["/usr/bin/supervisord"]


CMD ["/usr/bin/supervisord"]
