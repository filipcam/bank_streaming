FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt /tmp/requirements.txt

RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir --default-timeout=1000 --resume-retries 10 \
    torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir --default-timeout=1000 --resume-retries 10 -r /tmp/requirements.txt

WORKDIR /home/coder/workspace

USER coder