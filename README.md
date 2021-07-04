# services

## Description

It's a setup configuration for Kubernetes cluster including different web-services.

With the following structure:

![Structure view](/screenshots/structure.png)


## Requirments

You need to install [minikube](https://minikube.sigs.k8s.io/docs/start/) and
[virtualbox](https://minikube.sigs.k8s.io/docs/drivers/ "checkout for virtualbox driver") minikube driver. Than launch the 

`./setup.sh` 

and wait untill cluster sets up.

After setting up checkout for `minikube dashboard` and enjoy this little cute cluster.

## Info

Cluster contains the following services:

#### Nginx server
A Nginx server listening on ports 80 and 443. Port 80 has a systematic redirection of type 301 to 443, which https. 
Also Nginx redirects on WordPress and PhpMyAdmin services 

* IP: 192.168.99.100:80
* IP: 192.168.99.100:443

You can access Nginx service via SSH.

*  IP: 192.168.99.100:22
*  Login: admin
*  Password: admin


#### FTPS server
A FTPS server listening port 21.
* IP: 192.168.99.100:21
* Login: admin
* Password: admin

#### MySQL database
Database for keeping tables of Wordpress and PhpMyAdmin (see bellow)

* IP: no external acceess

#### WordPress
A WordPress website listening on port 5050, which is working with a MySQL database.
The WordPress website has several users and an administrator.

* IP: 192.168.99.100:5050
* Login: www
* Password: www

#### PhpMyAdmin
A PhpMyAdmin linked with MySQL

* IP: 192.168.99.100:5000
* Login: www
* Password: www

#### InfluxDB
Database and it's service to monitore all the containers in the cluster via `docker.sock`.

* IP: no external access

#### Grafana
Grafana platform, listening on port 3000, linked with an InfluxDB database.
Grafana is monitoring all the containers. There'are one dashboard per service.

* IP: 192.168.99.100:3000
* Login: admin
* Password: admin
