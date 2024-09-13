-- Question 1.1
SELECT COUNT(admission_ID)
FROM admissions;
-- Question 1.2
SELECT ad.patient_id,ROUND(AVG(di.discharge_date - ad.admission_date)) AS Stay_days
FROM admissions ad
join discharges di ON ad.admission_id= di.admission_id
GROUP BY patient_id;
-- Question 2.1
SELECT primary_diagnosis, COUNT(PATIENT_ID)
FROM admissions
GROUP BY primary_diagnosis;
-- Question 2.2
SELECT AD.service, 
COUNT(AD.ADMISSION_ID)AS Number_of_admissions,
ROUND(AVG(di.discharge_date - ad.admission_date)) AS Stay_days
FROM admissions AD
join discharges di ON ad.admission_id= di.admission_id
GROUP BY AD.SERVICE;
-- Question 2.3
SELECT discharge_disposition,COUNT(discharges_id)
FROM discharges
GROUP BY discharge_disposition;
-- Question 3.1
SELECT SERVICE,COUNT(ADMISSION_ID)
FROM admissions
GROUP BY service
HAVING COUNT(admission_id)>5;
-- Question 3.2
SELECT AD.PATIENT_ID,ROUND(AVG(di.discharge_date - ad.admission_date)) AS Stay_days
FROM admissions AD
join discharges di ON ad.admission_id= di.admission_id
WHERE AD.primary_diagnosis = 'Stroke'
GROUP BY patient_id;
-- Question 4.1
SELECT reason_for_visit,COUNT(ED_VISIT_ID) AS total_visits
FROM ed_visits
GROUP BY reason_for_visit;
-- Question 4.2
SELECT primary_diagnosis,service,COUNT(admission_id)
FROM admissions
GROUP BY primary_diagnosis,service;
-- Question 5.1
SELECT month(admission_date) AS month,COUNT(admission_id) AS total_admissions
FROM admissions
GROUP BY MONTH(admission_date);
-- Questoin 5.2
SELECT ad.primary_diagnosis,MAX(di.discharge_date - ad.admission_date) AS Max_Stay_days
FROM admissions ad
join discharges di ON ad.admission_id= di.admission_id
GROUP BY AD.primary_diagnosis;
-- Question 6
SELECT ad.service,
ROUND(AVG(di.discharge_date - ad.admission_date)) AS AVG_Stay_days,
SUM(di.discharge_date - ad.admission_date) AS total_Stay_days
FROM admissions AD
join discharges di ON ad.admission_id= di.admission_id
GROUP BY service
ORDER BY AVG_Stay_days DESC;
