CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS transactions (
    id BIGSERIAL PRIMARY KEY,
    sender VARCHAR(100) NOT NULL,
    receiver VARCHAR(100) NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    transaction_timestamp TIMESTAMP NOT NULL,
    device_sender VARCHAR(100) NOT NULL,
    device_receiver VARCHAR(100) NOT NULL,
    title TEXT NOT NULL,
    title_embedding VECTOR(384) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_transactions_timestamp
    ON transactions (transaction_timestamp DESC);

CREATE INDEX IF NOT EXISTS idx_transactions_amount
    ON transactions (amount);

CREATE INDEX IF NOT EXISTS idx_transactions_title
    ON transactions (title);
