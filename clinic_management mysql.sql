CREATE DATABASE Clinic_Management;
USE Clinic_Management;
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone_number VARCHAR(15)
);
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(15)
);
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
INSERT INTO Patients VALUES
(101, 'Arun', 25, 'Male', '9876543210'),
(102, 'Priya', 30, 'Female', '9876543211'),
(103, 'Rahul', 40, 'Male', '9876543212');
INSERT INTO Doctors VALUES
(201, 'Dr. Kumar', 'Cardiologist', '9876543220'),
(202, 'Dr. Meena', 'Dermatologist', '9876543221'),
(203, 'Dr. Ravi', 'Orthopedic', '9876543222');
INSERT INTO Appointments VALUES
(301, 101, 201, '2026-06-15', '10:00:00', 'Scheduled'),
(302, 102, 202, '2026-06-16', '11:00:00', 'Scheduled'),
(303, 103, 203, '2026-06-17', '12:00:00', 'Scheduled');
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT Appointments.appointment_id,
       Patients.patient_name,
       Doctors.doctor_name,
       Doctors.specialization,
       Appointments.appointment_date,
       Appointments.appointment_time,
       Appointments.status
FROM Appointments 
JOIN Patients  ON Appointments.patient_id = Patients.patient_id
JOIN Doctors  ON Appointments.doctor_id = Doctors.doctor_id;
UPDATE Patients SET phone_number = '9999999999' WHERE patient_id = 101;
UPDATE Appointments SET status = 'Completed' WHERE appointment_id = 301;
SELECT * FROM Appointments WHERE status = 'Scheduled';
SELECT Doctors.doctor_name,
       COUNT(Appointments.appointment_id) AS total_appointments
FROM Doctors 
LEFT JOIN Appointments 
ON Doctors.doctor_id = Appointments.doctor_id
GROUP BY Doctors.doctor_name;
DELETE FROM Appointments WHERE appointment_id = 303;