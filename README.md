# bank-streaming-repo

Repo zawiera kompletny projekt Kafka + PgVector + Neo4j z wbudowanym code-server, tak aby po sklonowaniu i uruchomieniu `docker compose up -d --build` środowisko miało już Python, pip i biblioteki z `requirements.txt`. Instalowanie zależności na etapie budowy obrazu jest zgodne z praktyką budowania własnych obrazów Docker dla środowisk developerskich [web:92][web:101].

## Struktura
- `docker-compose.yml` — wspólny stack dla code-server, Kafka, PostgreSQL i Neo4j.
- `Docker/vscode/Dockerfile` — obraz code-server z Pythonem, pip i bibliotekami.
- `requirements.txt` — zależności Pythona instalowane podczas builda.
- `data/transactions.json` — dane wejściowe do producenta.
- `sql/01_transactions_schema.sql` — definicja tabeli `transactions`.
- `sql/02_queries.sql` — zapytania sprawdzające.
- `notebooks/*.ipynb` — notebooki do wykonania zadania.

## Uruchomienie
1. `docker compose up -d --build`
2. Wejdź na `http://127.0.0.1:8080`
3. W code-server otwórz folder `/home/coder/workspace`
4. Uruchamiaj notebooki po kolei

## Hosty używane w notebookach
- Kafka: `kafka_streaming_lab:9092`
- PostgreSQL: `postgres_bank_lab:5432`
- Neo4j: `bolt://neo4j_bank_lab:7687`
