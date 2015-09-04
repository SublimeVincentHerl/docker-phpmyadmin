FROM library/ubuntu:latest

ENV HOST ""
ENV USER "root"
ENV PASSWORD "pw"

RUN \
  apt-get update -y && \
  apt-get install apache2 -y && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
  echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true" | debconf-set-selections && \
  echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections && \
  echo "phpmyadmin phpmyadmin/dbconfig-install boolean false" | debconf-set-selections && \
  apt-get -y install phpmyadmin
RUN \
  echo "include('/etc/phpmyadmin/config.inc.docker.php');" >> /etc/phpmyadmin/config.inc.php && \
  echo "<?php" > /etc/phpmyadmin/config.inc.docker.php && \
  echo "\$cfg['Servers'][\$i]['host'] = '$HOST';" >> /etc/phpmyadmin/config.inc.docker.php && \
  echo "\$cfg['Servers'][\$i]['user'] = '$USER';" >> /etc/phpmyadmin/config.inc.docker.php && \
  echo "\$cfg['Servers'][\$i]['password'] = '$PASSWORD';" >> /etc/phpmyadmin/config.inc.docker.php && \
  echo "\$cfg['Servers'][\$i]['auth_type'] = 'config';" >> /etc/phpmyadmin/config.inc.docker.php && \
  echo "?>" >> /etc/phpmyadmin/config.inc.docker.php

# Define working directory.
WORKDIR /


COPY ./docker-start.sh /
RUN chmod 751 /docker-start.sh

# Define default command.
ENTRYPOINT ["/docker-start.sh"]

# Expose ports.
EXPOSE 80
EXPOSE 443
