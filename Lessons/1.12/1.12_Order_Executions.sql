/*
Find the top 10 companies for posting jobs
They must have >3000 job postings
Limit this only to US jobs
*/
EXPLAIN ANALYZE
SELECT
    cd.name AS company_name,
    COUNT(jpf.*) AS postings_count
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE jpf.job_location = 'US'
GROUP BY cd.name
HAVING COUNT(jpf.*) > 3000
ORDER BY COUNT(jpf.*) DESC
LIMIT 10;