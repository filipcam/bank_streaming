// b) Znajdź użytkowników korzystających z tego samego urządzenia
//    w ciągu ostatnich 3 dni

MATCH (u1:User)-[:USES]->(d:Device)<-[:USES]-(u2:User)
WHERE u1.name < u2.name
  AND EXISTS {
    MATCH (u1)-[t1:TRANSFER]->()
    WHERE t1.timestamp >= datetime() - duration('P3D')
  }
  AND EXISTS {
    MATCH (u2)-[t2:TRANSFER]->()
    WHERE t2.timestamp >= datetime() - duration('P3D')
  }
RETURN u1.name AS user1, u2.name AS user2, d.name AS shared_device
ORDER BY shared_device, user1, user2;