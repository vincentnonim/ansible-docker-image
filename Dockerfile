FROM python:3.12-alpine

COPY ansible-requirements.yml python-requirements.txt .

RUN apk add git openssh-client && \
    pip install -r python-requirements.txt && \
    ansible-galaxy install -r ansible-requirements.yml

USER ansible

ENV ANSIBLE_HOST_KEY_CHECKING=False


# 'command -v ssh-agent >/dev/null || ( apt-get update -y && apt-get install openssh-client -y )'
# eval $(ssh-agent -s)
# chmod 400 "$SSH_PRIVATE_KEY"
# ssh-add "$SSH_PRIVATE_KEY"
# mkdir -p ~/.ssh
# chmod 700 ~/.ssh
