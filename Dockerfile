FROM ubuntu:22.04

# Install MongoDB
RUN apt-get update && \
    apt-get install -y wget gnupg software-properties-common ca-certificates lsb-release
RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-6.gpg && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
RUN apt-get update && \
    apt-get install -y mongodb-org
RUN mkdir -p /data/db

# Install Python dependencies
RUN apt-get install -y git build-essential libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev libffi-dev

# Install pyenv and Python 3.11.5
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    export PYENV_ROOT="$HOME/.pyenv" && \
    export PATH="$PYENV_ROOT/bin:$PATH" && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    /bin/bash -c 'source ~/.bashrc && pyenv install 3.11.5 && pyenv global 3.11.5 && pyenv rehash && pyenv exec pip install -U pip'

# path to python
ENV PATH="/root/.pyenv/shims:${PATH}"

# copy the app and install dependencies
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt

# Expose the port
EXPOSE 27017

# Run the app
CMD ["bash", "-c", "mongod --bind_ip_all > /dev/null 2>&1 & sleep 5 && python test.py"]
