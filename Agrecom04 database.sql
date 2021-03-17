--Customer
CREATE TABLE customer(

        --s_name varchar(20) PRIMARY KEY,
    --class varchar(20) NOT NULL,
   -- launched int,
   c_name varchar(20) ...
   c_email...
   c_id

   




);

--POPULATE
INSERT INTO customer(
    c_name,
    c_email,
    c_id,


)
VALUES 
()


--Technician
CREATE TABLE technician(
    t_name varchar(20)...ABORT
    t_email...ABORT
    t_report...
    t_map


);

--POPULATE
INSERT INTO technician(
t_name
t_email,
t_report,
t_map,

)
VALUES 



--Bait Station

CREATE TABLE baitstation(
    b_id
    b_qrcode
    b_county
    b_activitylevel
    b_damaged

);

--POPULATE
INSERT INTO baitstation(
    b_id,
    b_qrcode,
    b_county,
    b_activitylevel,
    b_damaged,

)
VALUES 


--Qr Code

CREATE TABLE qrcode(
    q_id
    q_damaged

);

--POPULATE
INSERT INTO qrcode(
    q_id,
    q_damaged,

)
VALUES 

--REPORT
CREATE TABLE report(
    r_date
    r_time
    r_county
    r_custid

);

--POPULATE
INSERT INTO report(

    r_date,
    r_time,
    r_county,
    r_custid,
)
VALUES 

--Map
CREATE TABLE map(
    m_id
    m_county


);

--POPULATE
INSERT INTO map(
    m_id,
    m_county,

)
VALUES 