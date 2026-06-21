FROM codercom/code-server

USER root
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    curl \
    tar \
    gzip \
    git \
    build-essential \
    && apt-get clean

USER coder

RUN python3 -m venv /home/coder/nosql_venv

RUN /home/coder/nosql_venv/bin/pip install --no-cache-dir \
    jupyterlab \
    ipywidgets \
    ipykernel \
    kafka-python \
    confluent-kafka \
    psycopg2-binary \
    sentence-transformers \
    neo4j \
    pandas \
    pgvector

RUN /home/coder/nosql_venv/bin/python -m ipykernel install \
    --user \
    --name=nosql_venv \
    --display-name="Python (nosql_venv)"

COPY --chown=coder:coder Docker/vscode/config.yaml /home/coder/.config/code-server/config.yaml
COPY --chown=coder:coder Docker/vscode/settings.json /home/coder/.local/share/code-server/User/settings.json

RUN code-server --install-extension ms-python.python
RUN code-server --install-extension ms-toolsai.jupyter