/*
===============================================================================
Q1661. Average Time of Process per Machine
-------------------------------------------------------------------------------
Problem:
  Compute the average time each machine takes to complete a process.
  - Each process has a 'start' and 'end' timestamp.
  - Processing time = end.timestamp - start.timestamp.
  - Average time = total processing time / number of processes per machine.
  - Round result to 3 decimal places.

Schema:
  Activity(machine_id INT,
           process_id INT,
           activity_type ENUM('start','end'),
           timestamp FLOAT,
           PRIMARY KEY(machine_id, process_id, activity_type))

Constraints:
  - Each (machine_id, process_id) has exactly one 'start' and one 'end'.
  - 'start' timestamp < 'end' timestamp.

Design Principles:
  - Use conditional aggregation to pivot start/end timestamps.
  - Compute per‑process duration, then average per machine.
  - Cast to NUMERIC before rounding for PostgreSQL compatibility.

===============================================================================
*/

-- PostgreSQL query solution
SELECT machine_id,
       ROUND(AVG((end_time - start_time)::numeric), 3) AS processing_time
FROM (
    SELECT machine_id,
           process_id,
           MAX(CASE WHEN activity_type = 'end'   THEN timestamp END) AS end_time,
           MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS process_times
GROUP BY machine_id;
