#
# derived by Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:vivid

RUN mkdir -p /srv/www/webapplication1/bin
ADD nginx/hfc-web-app /etc/nginx/sites-enabled/hfc-web-app

ADD apps /srv/apps/

ADD hfc/lib /usr/local/lib/hfc/

ADD hfc/etc /etc/hfc

ADD hfcrun.sh /bin/hfcrun.sh

# Install Nginx.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list && \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nano nginx mono-complete && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx && \
  rm -f /etc/nginx/sites-enabled/default && \
  chmod 0755 /bin/hfcrun.sh


# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["/bin/hfcrun.sh"]

# Expose ports.
EXPOSE 80
EXPOSE 443
