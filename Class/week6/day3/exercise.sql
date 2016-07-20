SELECT* FROM users WHERE name = "Charlie";
SELECT* FROM tasks WHERE user_id = 3;
INSERT INTO tasks (name, user_id) VALUES("Race a cheetah", 3);
UPDATE tasks SET name = "Race a giraffe" WHERE name = "Race a cheetah";
DELETE FROM tasks WHERE user_id = 1;

SELECT location FROM users WHERE user_id = 3

SELECT* FROM tasks WHERE user_id = (SELECT id FROM users WHERE name = "Bob");

DELETE FROM tasks WHERE user_id IN (SELECT id FROM users WHERE location = "Spain");


UPDATE users SET total_tasks = (SELECT count(*) FROM tasks WHERE )


-- count all tasks for all users
SELECT users.name, count(*) AS total_tasks FROM tasks
INNER JOIN users ON users.id = tasks.user_id
GROUP BY tasks.user_id
ORDER BY users.name DESC

-- select the most performant user
SELECT user_name, MAX(total_tasks) FROM (SELECT users.name AS user_name, count(*) AS total_tasks
FROM tasks
INNER JOIN users ON users.id = tasks.user_id
GROUP BY tasks.user_id)
