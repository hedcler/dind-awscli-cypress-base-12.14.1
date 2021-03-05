FROM cypress/base:12.14.1
RUN apt-get update
RUN apt-get install git-core gettext-base -y
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

RUN echo  "" \
  "node version:     $(node -v) \n" \
  "npm version:      $(npm -v) \n" \
  "yarn version:     $(yarn -v) \n" \
  "debian version:   $(cat /etc/debian_version) \n" \
  "git version:      $(git --version | awk '{print $NF}') \n"  \
  "envsubst version: $(envsubst --version | head -n 1 | awk '{print $NF}') \n" \
  "whoami:           $(whoami) \n\n"
