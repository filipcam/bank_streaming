FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y     python3     python3-pip     python3-venv     git     curl     build-essential     && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /home/coder/workspace

USER coder
