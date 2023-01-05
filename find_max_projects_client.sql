SELECT name, projects_count
FROM (
	SELECT client.name AS name, COUNT(project.client_id) AS projects_count,
	FROM client
	INNER JOIN project
	ON client.ID = project.client_id
	GROUP BY project.client_id
)
WHERE projects_count = (
	SELECT MAX (projects_count)
	FROM (
		SELECT client.name AS name, COUNT(project.client_id) AS projects_count,
		FROM client
		INNER JOIN project
		ON client.id = project.client_id
		GROUP BY project.client_id
	)	
);
