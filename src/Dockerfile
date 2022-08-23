FROM gcr.io/gcp-runtimes/ubuntu_18_0_4

RUN apt-get update -y && \
  apt install openssh-server -y

COPY ssh_connection.sh /usr/bin
COPY private_key /usr/bin
ENTRYPOINT ["sh", "/usr/bin/ssh_connection.sh"]
