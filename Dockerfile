FROM lsiobase/ubuntu:bionic

# environment settings
ENV HOME="/config"

RUN \
 apt-get update && \
 add-apt-repository universe && \
 apt-get install -y \
  wget \
  apt-transport-https \
  unzip \
  acl \
  ffmpeg \
  libc6-dev \
  libgdiplus \
  aspnetcore-runtime-2.2 && \
 mkdir -p /var/www/remotely && \
 wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
 dpkg -i packages-microsoft-prod.deb && \
 wget -q https://remotely.lucency.co/Downloads/linux-x64/Server.zip && \
 unzip -o Server.zip -d /var/www/remotely && \
 rm Server.zip && \
 setfacl -R -m u:www-data:rwx /var/www/remotely && \
 chown -R www-data:www-data /var/www/remotely


# add local files
#COPY /root /

# ports and volumes
EXPOSE 5000
