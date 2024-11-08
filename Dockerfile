FROM ubuntu:latest

# see: https://stackoverflow.com/questions/36611052/install-pip-in-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update && apt-get -y install \
    zsh \
    git curl wget lynx \
    iputils-ping lshw net-tools \
    nano bc gawk htop eza fzf bat neovim stow \
    sudo \
    python3.12 python3-pip pipenv \
    tzdata \
    unminimize

# correct timezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# --------------------------- user:passwd
RUN useradd docker && echo "docker:docker" | chpasswd
RUN usermod --shell /usr/bin/zsh -aG sudo docker
RUN usermod --shell /usr/bin/zsh -aG sudo root
# ------------------------------------- user:group
RUN mkdir -p /home/docker && chown -R docker:docker /home/docker

USER root
RUN zsh





