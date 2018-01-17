CREATE TABLE projects (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  project_status_id TINYINT UNSIGNED NOT_NULL
);

CREATE TABLE project_statuses (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT
  code VARCHAR(255),
  name VARCHAR(255)
);

INSERT INTO project_statuses
  (id, code, name)
VALUES
  (1, 'bidding', 'bidding'),
  (2, 'proposal', 'proposal to client'),
  (3, 'in_progress', 'in progress'),
  (4, 'completed', 'completed'),
  (6, 'canceled', 'canceled');
