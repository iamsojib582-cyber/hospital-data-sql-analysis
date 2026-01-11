------------------------------------------30 Days SQL Micro Course Certificate Assignment-------------------------------------
Select * from hospital_data;

1------Write an SQL query to find the total number of patients across all hospitals. 
		Select 
			Sum(patients_count) as total_count
			from hospital_data;

2------Retrieve the average count of doctors available in each hospital. 
		Select 
			hospital_name,
			ROUND(AVG(doctors_count),2) as average_doctors
			from hospital_data
			group by hospital_name
			order by average_doctors DESC;

3-----Find the top 3 hospital departments that have the highest number of patients. 
SELECT 
    department,
    SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;

4------ Identify the hospital that recorded the highest medical expenses. 
		SELECT 
    hospital_name,
    SUM(medical_expenses) AS highest_medical_expenses
FROM hospital_data
GROUP BY hospital_name
ORDER BY highest_medical_expenses DESC
LIMIT 1;

-5---- Calculate the average medical expenses per day for each hospital. 
Select 
	hospital_name,
		 ROUND(SUM(medical_expenses) / SUM(discharge_date - admission_date),2)  as average_medical_expenses_per_day
		from hospital_data
		group by hospital_name;

---6-----Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date (This question is wrong).
		Select 
			hospital_name,
			department,
			discharge_date-admission_date as longest_stay
			from hospital_data
			order by longest_stay DESC
			Limit 1;
			
---7-----Count the total number of patients treated in each city
	Select 
		location,
		SUM(patients_count) as total_patients
		from hospital_data
		group by location 
		order by total_patients DESC;
		
--8--Calculate the average number of days patients spend in each department. 
		Select 
			department,
			ROUND(Avg(discharge_date - admission_date),2) as average_number_of_days
			from hospital_data
			group by department
			order by average_number_of_days DESC;

----9--Find the department with the least number of patients.
		Select 
		department,
		SUM(patients_count) as least_number_of_patients
		from hospital_data
		group by department
		order by least_number_of_patients ASC
		Limit 1;

--or you can use with this formula too
SELECT department, least_number_of_patients
FROM (
    SELECT 
        department,
        SUM(patients_count) AS least_number_of_patients,
        RANK() OVER (ORDER BY SUM(patients_count) ASC) AS total
    FROM hospital_data
    GROUP BY department
) 
WHERE total = 1;

-----10-- Group the data by month and calculate the total medical expenses for each month

Select 
	Extract(Year from admission_date ) as year,
	Extract(Month from admission_date ) as month,
	SUM(medical_expenses) as total_medical_expenses
	from hospital_data
	group by year, month
	order by year, month DESC;

-- or with the month names 
Select 
Extract(Year from admission_date ) as year,
	To_char(admission_date, 'Month') as month_name,
	SUM(medical_expenses) as total_medical_expenses
	from hospital_data
	group by year, month_name, Extract(Month from admission_date);
	
--- Finish Here----	







