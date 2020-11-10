drop database if exists employee_tracker;
create database employee_tracker;
use employee_tracker;

CREATE TABLE department (
    id INT AUTO_INCREMENT,
    name VARCHAR(30),
    primary key (id)
);

CREATE TABLE role (
    id INT AUTO_INCREMENT,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT not null,
    FOREIGN KEY (department_id)
        REFERENCES department (id),
    PRIMARY KEY (id)
);

CREATE TABLE employee (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT NOT NULL,
    manager_id INT,
    FOREIGN KEY (role_id)
        REFERENCES role (id),
    FOREIGN KEY (manager_id)
        REFERENCES employee (id),
    PRIMARY KEY (id)
);

insert into department (name) values ("HR"), ("Sales");
insert into role(title, salary, department_id) values ("Manager", 6000, 2), ("Janitor", 5, 1);
insert into employee(first_name, last_name, role_id, manager_id) values
("Shonta", "Wilson", 1, null),
("Ben", "Benson", 2, 1);

-- select * from department;
-- select * from role;
-- select * from employee;

-- SELECT 
--     *
-- FROM
--     role r
--         LEFT JOIN
--     department d ON r.department_id = d.id;

-- select 
-- -- *
-- e.id AS employee_id,
-- e.first_name as employee_first,
-- e.last_name as employee_last,
-- title,
-- salary,
-- d.name as department_name,
-- m.last_name as manager_last
-- from employee e
-- left join role r
-- on e.role_id = r.id
-- left join department d
-- on r.department_id = d.id
-- left join employee m
-- on e.manager_id = m.id;