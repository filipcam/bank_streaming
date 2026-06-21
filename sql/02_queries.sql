-- SQL: przelewy powiązane z jedzeniem lub zwrotem środków, kwota 30-150
SELECT
    id,
    sender,
    receiver,
    amount,
    transaction_timestamp,
    title
FROM transactions
WHERE amount BETWEEN 30 AND 150
  AND (
      title ILIKE '%jedzenie%'
      OR title ILIKE '%obiad%'
      OR title ILIKE '%pizza%'
      OR title ILIKE '%zwrot%'
      OR title ILIKE '%oddaje%'
  )
ORDER BY transaction_timestamp DESC;

-- Cypher:
MATCH (u1:User)-[:USES]->(d:Device)<-[:USES]-(u2:User)
WHERE u1.name < u2.name
  AND EXISTS {
    MATCH (u1)-[t1:TRANSFER]->()
    WHERE t1.timestamp >= datetime('2026-05-10T23:59:59') - duration('P3D')
  }
  AND EXISTS {
    MATCH (u2)-[t2:TRANSFER]->()
    WHERE t2.timestamp >= datetime('2026-05-10T23:59:59') - duration('P3D')
  }
RETURN u1.name AS user1, u2.name AS user2, d.name AS shared_device
ORDER BY shared_device, user1, user2;
