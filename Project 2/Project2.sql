-- Create tables
CREATE TABLE profession (
    prof_id SERIAL PRIMARY KEY,
    profession VARCHAR(255) UNIQUE
);

SELECT * FROM profession;

CREATE TABLE status (
    status_id SERIAL PRIMARY KEY,
    status VARCHAR(255)
);

SELECT * FROM status;
CREATE TABLE zip_code (
    zip_code VARCHAR(4) PRIMARY KEY CHECK (length(zip_code) <= 4),
    city VARCHAR(255),
    province VARCHAR(255)
);

CREATE TABLE interests (
    interest_id SERIAL PRIMARY KEY,
    interest VARCHAR(255)
);

UPDATE interests
	SET interest_id =
	(CASE 
	WHEN  interest_id = 13 THEN 1
	WHEN  interest_id = 14 THEN 2
	WHEN  interest_id = 15 THEN 3
	WHEN  interest_id = 16 THEN 4
	WHEN  interest_id = 17 THEN 5
	WHEN  interest_id = 18 THEN 6
	WHEN  interest_id = 19 THEN 7
	WHEN  interest_id = 20 THEN 8 END);
	
	
CREATE TABLE seeking (
    seeking_id SERIAL PRIMARY KEY,
    seeking VARCHAR(255)
);

UPDATE seeking
	SET seeking_id =
	(CASE 
	WHEN  seeking_id = 7 THEN 1
	WHEN  seeking_id = 8 THEN 2
	WHEN  seeking_id = 9 THEN 3
	WHEN  seeking_id = 10 THEN 4 END);

CREATE TABLE my_contacts (
    contact_id SERIAL PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),
    gender VARCHAR(10),
    birthday DATE,
    prof_id INTEGER REFERENCES profession(prof_id),
    zip_code VARCHAR(4) REFERENCES zip_code(zip_code),
    status_id INTEGER REFERENCES status(status_id)
);
SELECT * FROM my_contacts;

UPDATE my_contacts
	SET contact_id =
	(CASE 
	WHEN  contact_id = 91 THEN 1
	WHEN  contact_id = 92 THEN 2
	WHEN  contact_id = 93 THEN 3
	WHEN  contact_id = 94 THEN 4
	WHEN  contact_id = 95 THEN 5
	WHEN  contact_id = 96 THEN 6
	WHEN  contact_id = 97 THEN 7
	WHEN  contact_id = 98 THEN 8
	WHEN  contact_id = 99 THEN 9
	WHEN  contact_id = 100 THEN 10
	WHEN  contact_id = 101 THEN 11
	WHEN  contact_id = 102 THEN 12
	WHEN  contact_id = 103 THEN 13
	WHEN  contact_id = 104 THEN 14
	WHEN contact_id = 105 THEN 15 END);

CREATE TABLE contact_interest (
    contact_id INTEGER REFERENCES my_contacts(contact_id),
    interest_id INTEGER REFERENCES interests(interest_id),
    PRIMARY KEY (contact_id, interest_id)
);

SELECT * FROM contact_interest;

CREATE TABLE contact_seeking (
    contact_id INTEGER REFERENCES my_contacts(contact_id),
    seeking_id INTEGER REFERENCES seeking(seeking_id),
    PRIMARY KEY (contact_id, seeking_id)
);

-- Populate tables
INSERT INTO profession (profession) VALUES ('Engineer'), ('Doctor'), ('Artist'), ('Teacher');


-- Add status
INSERT INTO status (status) VALUES ('Single'), ('Married'), ('Divorced');


-- Add provinces
INSERT INTO zip_code (zip_code, city, province) VALUES 
('1234', 'City1', 'Province1'), ('1235', 'City2', 'Province1'),
('2234', 'City1', 'Province2'), ('2235', 'City2', 'Province2'),
('3234', 'City1', 'Province3'), ('3235', 'City2', 'Province3'),
('4234', 'City1', 'Province4'), ('4235', 'City2', 'Province4'),
('5234', 'City1', 'Province5'), ('5235', 'City2', 'Province5'),
('6234', 'City1', 'Province6'), ('6235', 'City2', 'Province6'),
('7234', 'City1', 'Province7'), ('7235', 'City2', 'Province7'),
('8234', 'City1', 'Province8'), ('8235', 'City2', 'Province8'),
('9234', 'City1', 'Province9'), ('9235', 'City2', 'Province9');



-- Add interests and seeking data
INSERT INTO interests (interest) VALUES ('Music'), ('Sports'), ('Art'), ('Technology');
INSERT INTO seeking (seeking) VALUES ('Friendship'), ('Relationship');

-- Add contacts to my_contacts table
INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES 
('Doe', 'John', '555-1234', 'john.doe@example.com', 'Male', '1985-01-15', 13, '1234', 11),
('Smith', 'Jane', '555-5678', 'jane.smith@example.com', 'Female', '1990-04-22', 14, '2234', 12),
('Brown', 'Charlie', '555-8765', 'charlie.brown@example.com', 'Male', '1978-09-10', 15, '3234', 10),
('Johnson', 'Emily', '555-4321', 'emily.johnson@example.com', 'Female', '1992-07-05', 13, '4234', 12),
('Williams', 'David', '555-9876', 'david.williams@example.com', 'Male', '1980-11-30', 15, '5234', 12),
('Jones', 'Laura', '555-2345', 'laura.jones@example.com', 'Female', '1983-03-19', 14, '6234', 11),
('Miller', 'Michael', '555-3456', 'michael.miller@example.com', 'Male', '1987-08-25', 13, '7234', 12),
('Davis', 'Sophia', '555-4567', 'sophia.davis@example.com', 'Female', '1995-05-17', 15, '8234', 10),
('Garcia', 'Carlos', '555-5678', 'carlos.garcia@example.com', 'Male', '1979-12-01', 13, '9234', 11),
('Martinez', 'Maria', '555-6789', 'maria.martinez@example.com', 'Female', '1984-02-20', 14, '1235', 11),
('Hernandez', 'Luis', '555-7890', 'luis.hernandez@example.com', 'Male', '1991-10-13', 13, '2235', 12),
('Lopez', 'Isabella', '555-8901', 'isabella.lopez@example.com', 'Female', '1988-06-09', 15, '3235', 10),
('Gonzalez', 'Jose', '555-9012', 'jose.gonzalez@example.com', 'Male', '1986-12-24', 13, '4235', 12),
('Perez', 'Ana', '555-0123', 'ana.perez@example.com', 'Female', '1993-09-03', 13, '5235', 11),
('Rodriguez', 'Jorge', '555-3456', 'jorge.rodriguez@example.com', 'Male', '1981-11-08', 14, '6235', 10);

-- Assign interests to each contact
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 3), (2, 4),
(3, 2), (3, 3), (3, 4),
(4, 1), (4, 2), (4, 4),
(5, 1), (5, 3), (5, 4),
(6, 2), (6, 3), (6, 4),
(7, 1), (7, 2), (7, 3),
(8, 1), (8, 3), (8, 4),
(9, 2), (9, 3), (9, 4),
(10, 1), (10, 2), (10, 3),
(11, 2), (11, 3), (11, 4),
(12, 1), (12, 3), (12, 4),
(13, 1), (13, 2), (13, 3),
(14, 2), (14, 3), (14, 4),
(15, 1), (15, 3), (15, 4);

-- Assign seeking data to each contact
INSERT INTO contact_seeking (contact_id, seeking_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2),
(3, 1), (3, 2),
(4, 1), (4, 2),
(5, 1), (5, 2),
(6, 1), (6, 2),
(7, 1), (7, 2),
(8, 1), (8, 2),
(9, 1), (9, 2),
(10, 1), (10, 2),
(11, 1), (11, 2),
(12, 1), (12, 2),
(13, 1), (13, 2),
(14, 1), (14, 2),
(15, 1), (15, 2);



-- LEFT JOIN query
SELECT my_contacts.first_name, my_contacts.last_name, profession.profession, zip_code.zip_code, zip_code.city, zip_code.province, status.status, interests.interest, seeking.seeking
FROM my_contacts 
LEFT JOIN profession  ON my_contacts.prof_id = profession.prof_id
LEFT JOIN zip_code  ON my_contacts.zip_code = zip_code.zip_code
LEFT JOIN status  ON my_contacts.status_id = status.status_id
LEFT JOIN contact_interest  ON my_contacts.contact_id = contact_interest.contact_id
LEFT JOIN interests  ON contact_interest.interest_id = interests.interest_id
LEFT JOIN contact_seeking  ON my_contacts.contact_id = contact_seeking.contact_id
LEFT JOIN seeking  ON contact_seeking.seeking_id = seeking.seeking_id;