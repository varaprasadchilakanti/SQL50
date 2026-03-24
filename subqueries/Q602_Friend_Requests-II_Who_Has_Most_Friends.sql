/*
===============================================================================
Q602. Friend Requests II: Who Has the Most Friends
-------------------------------------------------------------------------------
Problem:
  Find the person(s) with the most friends.
    - Each accepted request creates a friendship between requester and accepter.
    - Count both sides (bidirectional).
    - Return id and number of friends.
    - Test cases guarantee only one person has the most friends.

Schema:
  RequestAccepted(requester_id INT,
                  accepter_id INT,
                  accept_date DATE,
                  PRIMARY KEY(requester_id, accepter_id))

Constraints:
  - Friendships are symmetric: requester and accepter both gain a friend.
  - Only one person has the maximum in test cases (but query can handle ties).

Design Principles:
  - Single Responsibility: Query computes friend counts per user.
  - Declarative Style: UNION ALL to normalize requester/accepter into one column.
  - Clean Architecture: Aggregate counts, then select max.
  - Extensibility: Can adapt to return multiple people if ties exist.

Edge Cases:
  - User appears only as requester or only as accepter → still counted.
  - Multiple people tied → ORDER BY ensures deterministic output if needed.
  - Empty table → returns nothing.

Pseudocode:
  WITH all_friends AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
  ),
  counts AS (
    SELECT id, COUNT(*) AS num
    FROM all_friends
    GROUP BY id
  )
  SELECT id, num
  FROM counts
  ORDER BY num DESC, id ASC
  LIMIT 1;

===============================================================================
*/

-- PostgreSQL query solution
WITH all_friends AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
),
counts AS (
    SELECT id, COUNT(*) AS num
    FROM all_friends
    GROUP BY id
)
SELECT id, num
FROM counts
ORDER BY num DESC, id ASC
LIMIT 1;
