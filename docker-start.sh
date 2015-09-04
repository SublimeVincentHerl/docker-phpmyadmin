#!/bin/bash
set -e
echo "<?php" > /etc/phpmyadmin/config.inc.docker.php && \
echo "\$cfg['Servers'][\$i]['host'] = '$HOST';" >> /etc/phpmyadmin/config.inc.docker.php && \
echo "\$cfg['Servers'][\$i]['user'] = '$USER';" >> /etc/phpmyadmin/config.inc.docker.php && \
echo "\$cfg['Servers'][\$i]['password'] = '$PASSWORD';" >> /etc/phpmyadmin/config.inc.docker.php && \
echo "\$cfg['Servers'][\$i]['auth_type'] = 'config';" >> /etc/phpmyadmin/config.inc.docker.php && \
echo "?>" >> /etc/phpmyadmin/config.inc.docker.php
service apache2 start
tail -f /var/log/apache2/access.log
