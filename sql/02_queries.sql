-- a) Znajdź przelewy zawierające kontekst jedzenia lub zwrotu środków
--    w zakresie kwot 30 - 150

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
      OR title ILIKE '%zakupy%'
      OR title ILIKE '%zwrot%'
      OR title ILIKE '%oddaje%'
  )
ORDER BY transaction_timestamp DESC;
