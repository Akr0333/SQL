-- Hospital Database Analytics

-- Appointments per doctor
SELECT d.doctor_name, COUNT(a.appointment_id) AS appointment_count
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY appointment_count DESC;

-- Patients by city
SELECT city, COUNT(*) AS patient_count
FROM patients
GROUP BY city
ORDER BY patient_count DESC;

-- Doctor and department information
SELECT d.doctor_name, dep.department_name
FROM doctors d
JOIN departments dep ON d.department_id = dep.department_id;

-- Most common diagnoses
SELECT diagnosis, COUNT(*) AS diagnosis_count
FROM appointments
WHERE diagnosis IS NOT NULL
GROUP BY diagnosis
ORDER BY diagnosis_count DESC;

-- Patients who visited more than once
SELECT p.patient_name, COUNT(a.appointment_id) AS visits
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_name
HAVING COUNT(a.appointment_id) > 1;
