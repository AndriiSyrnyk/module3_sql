SELECT CONCAT('Project', id_project) as name, SUM(duration_in_months * salary) AS price
FROM (
	SELECT id_project, DATEDIFF(month, start_date, finish_date) AS duration_in_months, worker.salary AS salary
	FROM (
		SELECT id AS id_project, start_date, finish_date  
		FROM project
	)
	INNER JOIN project_worker
	ON id_project = project_worker.project_id
	INNER JOIN worker
	ON project_worker.worker_id = worker.ID
)
GROUP BY id_project
ORDER BY price DESC;
