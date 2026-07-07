# Write your MySQL query statement below
#Self-join setup: Join Activity table with itself to pair start and end records
#Matching conditions: Join on same machine_id and process_id to pair related events
#Activity type filtering: Ensure t1 has 'start' and t2 has 'end' for each pair
#Duration calculation: Subtract start timestamp from end timestamp
#Grouping: Group by machine_id to calculate per-machine averages ,Rounding: Round average to 3 decimal places for precision
SELECT t1.machine_id, ROUND(AVG(t2.timestamp - t1.timestamp),3) as processing_time 
FROM Activity t1
INNER JOIN Activity t2
ON t1.machine_id = t2.machine_id
AND t1.process_id = t2.process_id
AND t1.activity_type = 'start'
AND t2.activity_type = 'end'
GROUP BY t1.machine_id;