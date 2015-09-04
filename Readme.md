

### Info
Docker images generator with apache2 and phpmyadmin

Based on ubuntu : https://hub.docker.com/_/ubuntu/

### Install with image creating

* Download and install https://www.docker.com/toolbox

1° if you have already one database :

* Open **Docker Quick Start Terminal**
* Go in the project path **docker-phpmyadmin**
* Run `docker build -t <?image name phpmyadmin> .`
* Run `docker run -d -P -e HOST="<?host bdd>" -e USER="<?user bdd>" -e PASSWORD="<?password bdd>" --name <?container name phpmyadmin> <?image name phpmyadmin> `
* Open the graphic assistant Kitematic, you can see your  nameofcontainer running.

2° if you haven't a database :

Maria db : https://hub.docker.com/_/mariadb/
* Run `docker pull mariadb`
* Run `$ docker run --name <?container name mariadb> -e MYSQL_ROOT_PASSWORD=<?password bdd> -d mariadb`
* Make the same protocol than 1° with one different on command `docker run` you need to link your two container whit adding `-- link <?container name mariadb>:<?the alias host>`.

Example :
* `docker run --name mydb -e MYSQL_ROOT_PASSWORD=mypw -d mariadb`
* `docker run -d -P -e HOST="maria" -e USER="root" -e PASSWORD="mypw" --link mydb:maria --name mariadbweb sublimevincentherl/phpmyadmin`

Mysql db : https://hub.docker.com/_/mysql/
* Run `docker pull mysql`
* Run `$ docker run --name <?container name mysql> -e MYSQL_ROOT_PASSWORD=<?password bdd> -d mysql`
* Make the same protocol than 1° with one different on command `docker run` you need to link your two container whit adding `-- link <?container name mysql>:<?the alias host>`.

Example :
* `docker run --name mysqldb -e MYSQL_ROOT_PASSWORD=pw -d mysql`
* `docker run -d -P -e HOST="sql" -e USER="root" -e PASSWORD="pw" --link mysqldb:sql --name mysqlweb sublimevincentherl/phpmyadmin`

### Quick install

coming soon ...
