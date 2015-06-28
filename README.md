# Docker container for Nginx + HyperFastCGI 

this is example of docker container with [Nginx](http://nginx.org/en) and [HyperFastCGI](https://github.com/xplicit/HyperFastCgi)

## Directory Structure

* Dockerfile: container build recipe
* hfcrun.sh: wrapper script for run nginx and HyperFastCGI process
* hfc:directory for HyperFastCGI
    - lib
        * HyperFastCGI.exe:pure managed assembly file of HyperFastCGI(.NET Framework 4.0 or later)
    - etc
        * hfc.config:configuration file for HyperFastCGI
            - apps.d:configuration file for hosting application(filename must be *.webapp)
* nginx:directory for config files of nginx
    - hfc-web-app:nginx server setting(default listen in port 80)
* apps:directory for hosting application
    - webapplication1:sample application(simple asp.net 4.5 webforms app)
* src:directory for sample application sources
    - webapplication1:simple asp.net 4.5 webforms project(developed by monodevelop)


## Build Requirements

Docker engine(see https://docs.docker.com/ for installation details)

## Getting Started

after installation of docker, run following command

    cd [top directory of source]
    docker build -t [container tagname] .
    docker run -d -p [hostport]:[containerport]

warning: you must not use existing port for [hostport]

if you see permission denied error of /var/run/docker.socket,
sudo or add current user to 'docker' group

if you success to run container, access http://[hostname]:[hostport]/ ,then you will see the asp.net site
