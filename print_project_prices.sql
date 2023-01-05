SELECT project_name, SUM(duration_in_months * salary) AS price
FROM (
	SELECT id_worker AS project_id, project_name, DATEDIFF(month, start_date, finish_date) AS duration_in_months, worker.salary AS salary
	FROM (
		SELECT ID AS id_worker, name AS project_name, start_date, finish_date  
		FROM project
	)
	INNER JOIN project_worker
	ON id_worker = project_worker.project_id
	INNER JOIN worker
	ON project_worker.worker_id = worker.ID
)
GROUP BY project_id
ORDER BY price DESC;
