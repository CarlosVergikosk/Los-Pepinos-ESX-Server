USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_RussianMafia', 'RussianMafia', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_RussianMafia', 'RussianMafia', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_RussianMafia', 'RussianMafia', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('RussianMafia', 'RussianMafia')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('RussianMafia',0,'recrue','Recrue',500,'{}','{}'),
	('RussianMafia',1,'novice','Novice',600,'{}','{}'),
	('RussianMafia',2,'experimente','Employee',700,'{}','{}'),
	('RussianMafia',3,'chief','Manager',1000,'{}','{}'),
	('RussianMafia',4,'boss','Boss',2000,'{}','{}');