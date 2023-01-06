SELECT CONCAT('Project', id) as name, DATEDIFF(month, start_date, finish_date) AS month_count
FROM (
  SELECT id, start_date, finish_date  
  FROM project
)
WHERE DATEDIFF(month, start_date, finish_date) = (
	SELECT MAX(month_count) AS month_count
	FROM (
		SELECT id AS project_id, DATEDIFF(month, start_date, finish_date) AS month_count
		FROM (
			SELECT id, start_date, finish_date  
			FROM project
		)
	)
);