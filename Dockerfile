FROM cypress/browsers:node12.14.1-chrome85-ff81

# Install container dependencies
RUN apt-get update && \
    apt-get install -y git-core \
    gettext-base \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io
 
# Install AWS CLI
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
  "docker version:   $(docker --version | awk '{print $3}') \n" \
  "whoami:           $(whoami) \n\n"
