-- ===========
-- Drop Tables
-- ===========
DROP TABLE Customer;
DROP TABLE Address;
DROP TABLE Technician;
DROP TABLE Station;
DROP TABLE Qrcode;
DROP TABLE Report;
DROP TABLE Map;

-- ==============
-- Table Creation
-- ==============

-- Customer
CREATE TABLE Customer(
	c_custkey DECIMAL(9,0) PRIMARY KEY,
	c_addrkey DECIMAL(9,0),
	c_techkey DECIMAL(9,0),

	c_name VARCHAR(20),
	c_email VARCHAR(30),
	c_phone CHAR(15)
);

-- Address
CREATE TABLE Address(
	a_addresskey DECIMAL(9,0) PRIMARY KEY,
	a_custkey DECIMAL(9,0),

	a_house_no INTEGER,
	a_street_name VARCHAR(20),
	a_street_type VARCHAR(10),
	a_city VARCHAR(20),
	a_state CHAR(2),
	a_zipcode CHAR(5),
	a_county VARCHAR(20)

);

-- Technician
CREATE TABLE Technician(
	t_techkey DECIMAL(9,0) PRIMARY KEY,

	t_name VARCHAR(20),
	t_phone CHAR(15)
);

-- Station
CREATE TABLE Station(
	s_stationkey DECIMAL(9,0) PRIMARY KEY,
	s_techkey DECIMAL(9,0),
	s_reportkey DECIMAL(9,0),
	s_mapkey DECIMAL(9,0),
	s_qrkey DECIMAL(9,0),

	s_type CHAR(25),
	s_activity_present INTEGER,
	s_activity_type CHAR(10),
	s_chemical VARCHAR(20),
	s_chem_amount INTEGER,
	s_inaccess INTEGER,
	s_inaccess_reason VARCHAR(20),
	s_damaged INTEGER,
	s_damaged_reason VARCHAR(20)
	
);

-- Qrcode
CREATE TABLE Qrcode(
	q_qrkey DECIMAL(9,0) PRIMARY KEY,
	q_stationkey DECIMAL(9,0),
	
	q_damaged INTEGER
);

-- Report
CREATE TABLE Report(
	r_reportkey DECIMAL(9,0) PRIMARY KEY,
	r_techkey DECIMAL(9,0),

	r_timein TEXT,
	r_timeout TEXT,
	r_servicedate DATE,
	r_vegetationlevel CHAR(6),
	r_correctRec VARCHAR(100),
	r_actionplan VARCHAR(100)
	
);

-- Map
CREATE TABLE Map(
	m_mapkey DECIMAL(9,0) PRIMARY KEY,
	m_techkey DECIMAL(9,0)
);


-- ===============
-- Populate Tables
-- ===============

-- Customer
INSERT INTO Customer VALUES(1, 1, 1, 'Farm A', 'FarmA@email.com', '123-456-7890');

-- Address
INSERT INTO Address VALUES(1, 1, 123, 'A', 'Street', 'Merced', 'CA', '95343', 'Merced');

-- Technician
INSERT INTO Technician VALUES(1, 'John', '510-111-5555');

-- Station
INSERT INTO Station VALUES(1, 1, 1, 1, 1, 'Bait Box', 1, 'Insect', 'Contract', 5, 0, 'N/A', 0, 'N/A');
INSERT INTO Station VALUES(2, 1, 1, 1, 2, 'Bait Box', 1, 'Insect', 'Contract', 2, 0, 'N/A', 0, 'N/A');
INSERT INTO Station VALUES(3, 1, 1, 1, 3, 'Bait Box', 1, 'Insect', 'Contract', 7, 0, 'N/A', 0, 'N/A');
INSERT INTO Station VALUES(4, 1, 1, 1, 4, 'Bait Box', 1, 'Insect', 'Contract', 9, 0, 'N/A', 0, 'N/A');
INSERT INTO Station VALUES(5, 1, 1, 1, 5, 'Bait Box', 1, 'Insect', 'Contract', 3, 0, 'N/A', 0, 'N/A');

-- Qrcode
INSERT INTO Qrcode VALUES(1, 1, 0);
INSERT INTO Qrcode VALUES(2, 2, 0);
INSERT INTO Qrcode VALUES(3, 3, 0);
INSERT INTO Qrcode VALUES(4, 4, 0);
INSERT INTO Qrcode VALUES(5, 5, 0);

-- Report
INSERT INTO Report VALUES(1, 1, '08:00:00.000', '11:15:00.000', '2021-01-12', 'None', 'N/A', 'Cleaned and Serviced Every Station and Replaced the Bait in Each Box');

-- Map
INSERT INTO Map VALUES(1, 1);


-- =================
-- Example Functions
-- =================

-- Serviced New Station(No QR_code assigned)
INSERT INTO Qrcode VALUES(6, 6, 0);
INSERT INTO Station VALUES(6, 1, 1, 1, 6, 'Bait Box', 1, 'Insect', 'Contract', 4, 0, 'N/A', 0, 'N/A');

-- Chemical Usage (By customer and chemical type)
SELECT c_name AS Customer, s_chemical AS Chemical, SUM(s_chem_amount) AS AmountUsed
FROM Customer, Technician, Station
WHERE
	c_techkey = t_techkey AND
	t_techkey = s_techkey
GROUP BY c_name, s_chemical;

