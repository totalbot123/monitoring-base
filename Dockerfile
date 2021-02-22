FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY requirements.txt /app
WORKDIR /app

# Update to latest certificates
RUN apt-get update && apt-get -y install ca-certificates
# Install required libraries for python modules
RUN apt-get update && apt-get -y install pkg-config libxml2-dev libxmlsec1-dev libxmlsec1-openssl
# Install required python modules
RUN pip install -r requirements.txt

#RUN mv /entrypoint.sh /uwsgi-nginx-docker-entrypoint.sh
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

#ENTRYPOINT ["/entrypoint.sh"]

#CMD ["/start.sh"]
