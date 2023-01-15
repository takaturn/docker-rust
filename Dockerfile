FROM rust:latest

RUN apt update && apt upgrade -y && \
    apt install -y sudo

ARG USERNAME=vscode
ARG GROUPNAME=vscode
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} ${GROUPNAME} && \
    useradd -m -s /bin/bash -u ${UID} -g ${GID} -G sudo ${USERNAME} && \
    echo "${USERNAME} ALL=NOPASSWD: ALL" > /etc/sudoers.d/${USERNAME} && \
    sed -i -E "s/^# ?(alias.*ls.*)/\1/g; s/^# ?(export LS_OPTIONS.*)/\1/g; s/# ? (eval .*)/\1/g" /home/${USERNAME}/.bashrc
