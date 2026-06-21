# Kafka + PgVector + Neo4j — bank streaming repo

Repo zawiera komplet plików do uruchomienia zadania w jednym środowisku Docker Compose. Inspiracja układem środowiska pochodzi z osobnych laboratoriów streamingowych i Neo4j, gdzie Kafka, PostgreSQL i notebooki były uruchamiane jako osobne usługi, a notebooki łączyły się do kontenerów po nazwach hostów [file:14][file:5].

## Struktura
- `docker-compose.yml` — wspólny stack: Zookeeper, Kafka, PostgreSQL z pgvector i Neo4j.
- `sql/01_transactions_schema.sql` — definicja tabeli `transactions`.
- `data/transactions.json` — dane wejściowe do wysyłki.
- `notebooks/01_create_topic.ipynb` — tworzenie topicu.
- `notebooks/02_producer_transactions.ipynb` — producer.
- `notebooks/03_consumer_postgres_pgvector.ipynb` — consumer do PostgreSQL.
- `notebooks/04_consumer_neo4j.ipynb` — consumer do Neo4j.
- `sql/02_queries.sql` — zapytania sprawdzające.
- `requirements.txt` — biblioteki do notebooków.

## Uruchomienie
1. `docker compose up -d`
2. Zainstaluj biblioteki z `requirements.txt` w środowisku notebookowym.
3. Uruchom notebooki w kolejności `01` → `04`.

## Hosty w notebookach
- Kafka: `kafka_streaming_lab:9092`
- PostgreSQL: `postgres_bank_lab:5432`
- Neo4j: `bolt://neo4j_bank_lab:7687`

## Uwaga o consumerach
Oba consumery powinny mieć różne `group_id`, aby oba odczytały komplet wiadomości z topicu w modelu pub-sub, co jest zgodne z opisem działania grup konsumentów w materiałach o streamingu [file:3][file:12].
