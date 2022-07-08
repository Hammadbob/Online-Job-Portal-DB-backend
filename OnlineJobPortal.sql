----------------------------create tables------------------------------------------
create table [dbo].[Applicant_data](
applicant_ID int Primary Key,
Name varchar(20),
Age int not NULL,
EmailAddress varchar(30),
PhoneNumber text
)
create table Education(
applicant_ID int,
UniversityName varchar(35),
Degree varchar(20),
CGPA float
)
create table App_skills(
applicant_ID int,
IT_skills text,
Marketing_skills text,
Buisness_skills text,
Languages varchar(30)
)

create table Company(
Company_id int Primary key,
CompName varchar(30),
CompAddress varchar(30),
Zip_code int not null
)
create table Company_Departments(
dept_id int Primary key,
dep_name varchar(15) not null,
dept_Director varchar(15),
comp_id int
)
create table JobRole(
comp_ID int,
dept_id int,
Job_id int Primary key,
job_role varchar(20),
job_details text
)
create Table [dbo].[JobRltDetails](
Job_id int,
Jb_time text,
Salary float,
bonus float,
Job_duties text,
)


create table availability_details(
applicant_ID int,
preferred_work varchar(10),
preferred_start_date DATE
)

create table users(
id int Primary key,
email varchar(20),
password_ varchar(30),
created_time DATE,
confirmCode varchar(8)
)
create table Vacancies(
VacId int Primary key,
Job_id int,
jri_id int,
Created_date date,
end_date date
)
create table AUDIT_tbl(
ID int Primary key,
Message text
)

create table Vacancies_Audit(
Audit_id Primary key identity(1,1)
Message text
)

----------------PRIMARY KEY, FOREIGN KEY in creating table (10 Queries)---------------------
ALTER TABLE App_skills
ADD FOREIGN KEY (applicant_ID) REFERENCES [dbo].[Applicant_data] (applicant_ID);
ALTER TABLE Education
ADD FOREIGN KEY (applicant_ID) REFERENCES ApplicantData_tbl (applicant_ID);
ALTER TABLE JobRole
ADD FOREIGN KEY (comp_ID) REFERENCES Company (Company_id);
ALTER TABLE JobRole
ADD FOREIGN KEY (dept_id) REFERENCES Company_Departments (dept_id);
ALTER TABLE Company_Departments
ADD FOREIGN KEY (comp_id) REFERENCES Company (Company_id);
ALTER TABLE [dbo].[JobRltDetails]
ADD FOREIGN KEY (Job_id) REFERENCES JobRole (Job_id);
ALTER TABLE [dbo].[Availability_details]
ADD FOREIGN KEY (applicant_ID) REFERENCES [dbo].[Applicant_data] (applicant_ID);
Alter table [dbo].[JobRltDetails]
add foreign key(job_id) references JobRole (Job_id);
alter table availability_details
add foreign key(applicant_id) references [dbo].[Applicant_data] (applicant_ID);
alter table [dbo].[JobRltDetails]
add jri_id int Primary key;
alter table [dbo].[Apply_job]
add foreign key(job_id) references [dbo].[JobRole] (job_id)
alter table [dbo].[Apply_job]
add foreign key(cmp_id) references [dbo].[Company] ([Company_id])
alter table [dbo].[Company_department]
add company_id int;
ALTER TABLE [dbo].[Company_department]
ADD FOREIGN KEY (company_id) REFERENCES Company (Company_id);
alter table [dbo].[Education]
add applicant_ID int;
ALTER TABLE [dbo].[Education]
ADD FOREIGN KEY (applicant_ID) REFERENCES [dbo].[Applicant_data] (applicant_ID);
alter table JobRole
add comp_ID int,dept_id int;
ALTER TABLE [dbo].[JobRole]
ADD FOREIGN KEY (comp_ID) REFERENCES Company (Company_id);
Alter table [dbo].[JobRole]
add FOREIGN KEY (dept_id) References [dbo].[Company_department] (dept_id);


        --------------------------------------------------------------AND------------------------------------------------------------

        SELECT * FROM Applicant_data WHERE applicant_ID
        BETWEEN 4 AND 40

        SELECT * FROM Applicant_data WHERE applicant_ID
        BETWEEN 9 AND 30

        SELECT * FROM Applicant_data WHERE applicant_ID
        BETWEEN 39 AND 50

        Select * from Education
        where UniversityName='UCP' AND CGPA>=3

        select * from Applicant_data
        where applicant_ID=1 AND Name='Hammad';

        select Company_id from Company
        where Company_id=1 AND CompAddress LIKE 'H-block%'

        select * from App_skills
        where applicant_id>=4 AND CurrentWorkplace='YES'

        select * from App_skills
        where applicant_id<=9 AND CurrentWorkplace='NO' 
		
		Select * from Education 
		where UniversityName='BNU' AND CGPA>=3

        select * from Applicant_data
        where applicant_ID<30 AND Name='Shah' ; 

	    Select * from Education 
		where UniversityName='LUMS' AND CGPA>=3

        Select CompAddress from Company
        where Zip_code=12543 and CompName='Carpenter Choices'

        Select Zip_code,CompAddress from Company
        where CompName LIKE 'Umer & Usman Firm' AND Company_id=8;

        SELECT * FROM Applicant_data WHERE applicant_ID
        BETWEEN 34 AND 40

        SELECT * FROM Applicant_data WHERE applicant_ID
        BETWEEN 21 AND 30

        SELECT * FROM Applicant_data WHERE applicant_ID
        BETWEEN 36 AND 50

		SELECT * FROM Education
		where applicant_ID>5 AND UniversityName='BNU'

		SELECT * FROM Education
		where applicant_ID>5 AND UniversityName='PU'

		SELECT * FROM Education
		where applicant_ID>5 AND UniversityName='UMT'

		SELECT * FROM Education
		where applicant_ID>25 AND UniversityName='NUST'

		SELECT * FROM Education
		where applicant_ID>5 AND UniversityName='0'
        --------------------------------OR------------------------------------------------------------

        select * from Applicant_data
        where applicant_ID=1 OR Name='Hammad';

        select * from Applicant_data
        where NAME='Ali' OR Name='Hammad';

        Select * from Education
        where UniversityName='UCP' OR CGPA>=3

        select Company_id from Company
        where Company_id=20 OR Company.Zip_code=54700

		select * from Applicant_data
        where applicant_ID=1 OR Name='shah';

		select * from Applicant_data
        where applicant_ID=1 OR Name='javed';

		select * from Applicant_data
        where applicant_ID=1 OR Name='fiza';

		select * from JobRltDetails
		where job_id=4 or Salary>3800

        ----------------------LIKE Operator---------------------------------------

        select * from Applicant_data
        where Name like '%mm%'

        select * from Applicant_data
        where Name like '%mm'

        select * from Applicant_data
        where Name like '%ha%'

        select * from Applicant_data
        where Name like '%ed%'

        Select dep_name,dept_Director from [dbo].[Company_department]
        where dep_name like '%ag'

		Select * from JobRole
        where job_role LIKE '%Manager'

        select * from Company_department
        where dept_id=6;

        select * from JobRole
        where job_type like 'Full-time'

        ---------------------------IN operator--------------------------------------------------------

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Javed')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Ali','Kumail')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Maria','karamat')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Ali','Hammad')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('Hammad','Murtaza')

        SELECT * FROM Applicant_data
        WHERE applicant_ID IN (2,10);

        SELECT * FROM Applicant_data
        WHERE applicant_ID IN (24,10);

        SELECT * FROM Applicant_data
        WHERE applicant_ID IN (21,10);

        SELECT * FROM Applicant_data
        WHERE applicant_ID IN (9,10);

        SELECT * FROM Applicant_data
        WHERE applicant_ID IN (2,20);

        SELECT * FROM Applicant_data
        WHERE applicant_ID IN (28,49);

        SELECT * FROM Applicant_data
        WHERE Name IN ('Akmal','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('shafeeq','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('sobia','Murtaza')

        SELECT * FROM Applicant_data
        WHERE Name IN ('shah','Murtaza')

        SELECt * from Education
        where Education.CGPA In (3.10,3.76)

        SELECt * from Education
        where Education.CGPA In (3.20,3.67)

        SELECt * from Education
        where Education.CGPA In (3.10,3.0)

        SELECt * from Education
        where Education.CGPA In (2.7,3.56)

        ---------------------Where Clause----------------------------------------------------
        select * from Applicant_data
        where applicant_ID=1

        select * from App_skills
        where applicant_id>=4

        select * from Applicant_data
        where NAME='Ali'

        SELECt * from Education
        where Education.CGPA In (3.20,3.67)

        SELECt * from Education
        where Education.CGPA In (3.10,3.0)

        select * from Applicant_data
        where Name='Hammad'

        select * from Company
        where CompName='UpComm Solution'

        select * from Company_department
        where dep_name='Tech'

        select * from Company_department
        where dep_name='HR'

        select * from Company_department
        where dep_name='ERP'

        Select * from JobRole
        where job_role LIKE '%Manager'

        select * from Company_department
        where dept_id=6;

        select * from JobRole
        where job_type like 'Full-time'


        select * from JobRole
        where comp_ID=4

        select * from JobRole
        where comp_ID=2

        select * from JobRole
        where comp_ID=9

        select * from JobRole
        where comp_ID=7

        select * from JobRole
        where comp_ID=1

        select * from JobRole
        where dept_id=4

        select * from JobRole
        where dept_id=4

        select * from JobRole
        where job_role like 'QA%'

        select * from Applicant_data
        where Email like '%gmail.com'

        select * from Applicant_data
        where Email='%nmt.com'

        select * from Applicant_data
        where Phone like '03164617819'

        select * from Education
        where Degree='BSIT'

        select * from Education
        where CGPA>=3

		--------------------------------------TOP clause-------------------------------
		SELECT TOP (3) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]

	  SELECT TOP (6) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]

	  SELECT TOP (9) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]

	  SELECT TOP (20) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]

	  SELECT TOP (15) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]

	  SELECT TOP(10) applicant_ID,
	  Applicant_data.Name,
	  Applicant_data.Phone
	  from Applicant_data

	  SELECT TOP(19) applicant_ID,
	  Applicant_data.Name,
	  Applicant_data.Phone
	  from Applicant_data

	  SELECT TOP(13) applicant_ID,
	  Applicant_data.Name,
	  Applicant_data.Phone
	  from Applicant_data

	  SELECT TOP(10) applicant_ID,
	  Applicant_data.Name
	  from Applicant_data

	  SELECT TOP(10) applicant_ID,
	  Applicant_data.Name,
	  Applicant_data.Phone,
	  Applicant_data.Email
	  from Applicant_data

	  SELECT TOP(10) Company.Company_id,
	  CompAddress,
	  Zip_code
	  FROM Company

	  
	  SELECT TOP(20) Company.Company_id,
	  CompAddress,
	  Zip_code
	  FROM Company

	  
	  SELECT TOP(15) Company.Company_id,
	  CompAddress,
	  Zip_code
	  FROM Company

	  
	  SELECT TOP(13) Company.Company_id,
	  CompAddress,
	  Zip_code
	  FROM Company

	  
	  SELECT TOP(5) Company.Company_id,
	  CompName,
	  CompAddress,
	  Zip_code
	  FROM Company

	  SELECT TOP(10) E.applicant_ID,
	  E.UniversityName
	  FROM Education E

	  SELECT TOP(15) E.applicant_ID,
	  E.UniversityName,
	  E.CGPA
	  FROM Education E

	  SELECT TOP(20) E.applicant_ID,
	  E.UniversityName,
	  E.Degree
	  FROM Education E
	  
	  SELECT TOP(14) E.applicant_ID,
	  E.UniversityName,
	  E.Degree,
	  E.CGPA
	  FROM Education E

	  SELECT TOP(20) R.job_role
	  FROM JobRole R

	  SELECT TOP(10) R.job_role,
	  R.comp_ID
	  FROM JobRole R

	  SELECT TOP(5) R.job_role,
	  R.Job_id,
	  R.dept_id
	  FROM JobRole R

	  SELECT TOP(2) R.job_role,
	  R.Job_id,
	  R.comp_ID,
	  R.job_role
	  FROM JobRole R

	  SELECT TOP(6) R.job_role,
	  R.Job_id,
	  R.comp_ID,
	  R.job_role,
	  R.job_type
	  FROM JobRole R
	  -----------------------------------------Order By----------------------------
SELECT A.Name,A.Email FROM Applicant_data A order by A.Name
SELECT A.Name,A.Email FROM Applicant_data A order by A.Email
SELECT A.Name,A.Email FROM Applicant_data A order by A.Name desc
SELECT A.Name,A.Email FROM Applicant_data A order by A.Email desc
SELECT A.Name,A.Email FROM Applicant_data A order by A.applicant_ID desc

SELECT E.CGPA FROM Education E order by E.CGPA desc
SELECT E.CGPA FROM Education E order by E.CGPA
SELECT E.UniversityName FROM Education E order by E.UniversityName
SELECT E.UniversityName FROM Education E order by E.UniversityName desc
SELECT E.Degree FROM Education E order by E.UniversityName

SELECT Cd.dep_name FROM Company_department Cd order by Cd.dep_name desc
SELECT Cd.dep_name FROM Company_department Cd order by Cd.dep_name
SELECT Cd.dept_Director FROM Company_department Cd order by Cd.dept_Director
SELECT Cd.dept_Director FROM Company_department Cd order by Cd.dept_Director desc
SELECT Cd.company_id FROM Company_department Cd order by Cd.dep_name

SELECT jb.job_role FROM JobRole jb order by jb.job_role
SELECT jb.job_role FROM JobRole jb order by jb.job_role desc SELECT jb.job_role FROM JobRole jb order by jb.Job_id
SELECT jb.job_role FROM JobRole jb order by jb.Job_id desc
SELECT jb.comp_ID,job_type FROM JobRole jb order by jb.dept_id

SELECT ad.applicant_id,ad.preferred_work FROM Availability_details Ad order by ad.preferred_start_date
SELECT ad.applicant_id,ad.preferred_work FROM Availability_details Ad order by ad.preferred_start_date desc
SELECT C.CompName FROM Company C order by CompName
SELECT C.CompName FROM Company C order by CompName DESC
SELECT C.CompName,c.Zip_code FROM Company C order by c.Zip_code
	  -------------------------------------------------Group by--------------------------------------------------------------

	  select COUNT(app_id) as 'Count',cmp_id from Apply_job 
	  group by cmp_id
	  order by cmp_id

	  select COUNT(A.applicant_ID) as 'Count',aj.job_id from Applicant_data A
	  inner join Apply_job Aj
	  on A.applicant_ID=Aj.app_id
	  group by aj.job_id
	  order by aj.job_id

	  SELECT COUNT(cd.dept_id) as 'LIST',C.Company_id from Company C ---no.of departments in each company
	  inner join Company_department cd
	  on C.Company_id=Cd.company_id
	  group by c.Company_id
	  order by c.Company_id

	  SELECT jr.job_id, SUM(jr.Salary) FROM JobRltDetails jr
	  GROUP BY jr.job_id

 	  -------------------------------------------------Aliases----------------------------------------------------------------

	    select A.applicant_ID as 'ID' from Applicant_data A
	    select A.Phone as 'Mobile' from Applicant_data A
	    select Aps.Field_skills 'Experience' from App_skills Aps
	    select cd.dept_Director as 'DR' from Company_department cd
	    select COUNT(applicant_ID) as 'TotalApplicants' from Applicant_data
		select COUNT(job_id) as 'totalJobs' from Apply_job
		select COUNT(apply_id) as 'TotalVacnacies'from Apply_job
		SELECT COUNT(dept_id) as 'TotalDepartments' FROM Company_department
		select COUNT(Company_id) from Company
		SELECT COUNT(UniversityName) as 'TotalUniversity' from Education
		SELECT COUNT(preferred_start_date) as 'TotalAvalableInfo' from Availability_details
		SELECT MAX(Salary)  as 'MaxSalary' from JobRltDetails
		SELECT MIN(Salary) as'MinSalary' from JobRltDetails
		SELECT MAX(Bonus) as 'MaxBonus' from JobRltDetails
		SELECT MIN(Bonus) as 'MinBonus' from JobRltDetails
		SELECT AVG(CGPA) as 'AverageCGPA' from Education
		SELECT AVG(salary) as 'AvgSalary' from JobRltDetails
		SELECT AVG(Bonus) as 'AvgBonus'from JobRltDetails
		select C.CompName as 'Name',C.CompAddress as 'Address' from Company C
		select J.Job_id as 'id',J.job_type 'Type' from JobRole J




	  
		----------------------------------------------Aggregate Functions-------------------------------------------------------

		select COUNT(applicant_ID) from Applicant_data
		select COUNT(job_id) from Apply_job
		select COUNT(job_role) from JobRole
		select COUNT(apply_id) from Apply_job
		SELECT COUNT(dept_id) FROM Company_department
		select COUNT(Company_id) from Company
		SELECT COUNT(Salary) from JobRltDetails
		SELECT COUNT(UniversityName) from Education
		SELECT COUNT(dep_name) from Company_department
		SELECT COUNT(preferred_start_date) from Availability_details
		SELECT COUNT(Bonus) from JobRltDetails
		SELECT COUNT(dept_id) FROM Company_department
		select COUNT(Company_id) from Company
		SELECT COUNT(Salary) from JobRltDetails
		SELECT COUNT(UniversityName) from Education
		SELECT COUNT(dep_name) from Company_department

		
		SELECT MAX(Salary) from JobRltDetails
		SELECT MAX(Education.UniversityName) from Education
		SELECT MAX(CGPA) from Education
		SELECT MAX(dbo.Availability_details.preferred_start_date) from Availability_details
		SELECT MAX(salary) from JobRltDetails
		SELECT MAX(Bonus) from JobRltDetails
		SELECT MAX(Salary) from JobRltDetails
		SELECT MAX(Education.UniversityName) from Education
		SELECT MAX(CGPA) from Education
		SELECT MAX(dbo.Availability_details.preferred_start_date) from Availability_details
		
		SELECT MIN(CGPA) from Education
		SELECT MIN(dbo.JobRltDetails.Salary) from  JobRltDetails
		SELECT MIN(Education.UniversityName) from Education
		SELECT MIN(dbo.Availability_details.preferred_start_date) from Availability_details
		SELECT MIN(salary) from JobRltDetails
		SELECT MIN(Bonus) from JobRltDetails
		SELECT MIN(CGPA) from Education
		SELECT MIN(dbo.JobRltDetails.Salary) from  JobRltDetails
		SELECT MIN(Education.UniversityName) from Education
		SELECT MIN(dbo.Availability_details.preferred_start_date) from Availability_details
		
		SELECT AVG(CGPA) from Education
		SELECT AVG(salary) from JobRltDetails
		SELECT AVG(Bonus) from JobRltDetails
		SELECT AVG(apply_id) from Apply_job


		-------------------------------------------Joins------------------------------------------------------------------------

        ---------------------------------------Inner Join (25 Queries)------------------------------------------------

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        inner join Education E
        on Ap.applicant_ID=E.applicant_id

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id from Applicant_data Ap
        inner join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id,Aj.DATE from Applicant_data Ap
        inner join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.Name,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        inner join Education E
        on Ap.applicant_ID=E.applicant_id;

        select C.Company_id,C.CompName,Cd.dep_name,Cd.dept_Director from Company C
        inner join Company_department Cd
        on C.Company_id=Cd.company_id

        select Jb.Job_id,jb.comp_ID,jb.dept_id,jb.job_type,Jd.Salary from JobRole Jb
        inner join JobRltDetails Jd
        on Jb.Job_id=Jd.job_id;

        select Ap.Name,Ap.Email,aps.Field_skills,aps.PreviousWorkplace from Applicant_data Ap
        inner join App_skills Aps
        on Ap.applicant_ID=Aps.applicant_id;

        select ad.Name,ad.Phone,avd.preferred_work,avd.preferred_start_date from Applicant_data ad
        inner join Availability_details avd
        on ad.applicant_ID=avd.applicant_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id from Applicant_data Ad
        inner join Education E
        on Ad.applicant_ID=E.applicant_ID
        inner join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id from Applicant_data Ad
        inner join Education E
        on Ad.applicant_ID=E.applicant_ID
        inner join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        inner join Company_department cd
        on C.Company_id=Cd.company_id
        inner join JobRole J
        on cd.dept_id=J.dept_id

        select Ad.applicant_ID,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id,Ap.DATE from Applicant_data Ad
        inner join Education E
        on Ad.applicant_ID=E.applicant_ID
        inner join Apply_job Ap
        on E.applicant_ID=Ap.app_id;


        select Ap.Name as 'App_Name',Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        inner join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,Ap.Email,E.Experience,E.Organzational_skills from Applicant_data Ap
        inner join App_skills E
        on Ap.applicant_ID=E.applicant_id;

		select C.CompName,C.CompAddress,Cd.dept_id,jd.Job_id from Company C
		inner join JobRole Jr
		on C.Company_id=Jr.comp_ID
		inner join JobRltDetails jd
		on jd.job_id=Jr.Job_id
		inner join Company_department Cd
		on Cd.company_id=C.Company_id

		select ap.Name,ap.Email,aj.job_id,aps.Status from Applicant_data ap
		inner join Apply_job aj
		on ap.applicant_ID=aj.app_id
		left join Approved_applicants aps
		on aps.apply_id=aj.apply_id

        -----------------------------------LEFT Join (25)------------------------------------------------

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        left join Education E
        on Ap.applicant_ID=E.applicant_id

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id from Applicant_data Ap
        left join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id,Aj.DATE from Applicant_data Ap
        left join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.Name,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        left join Education E
        on Ap.applicant_ID=E.applicant_id;

        select C.Company_id,C.CompName,Cd.dep_name,Cd.dept_Director from Company C
        left join Company_department Cd
        on C.Company_id=Cd.company_id

        select Jb.Job_id,jb.comp_ID,jb.dept_id,jb.job_type,Jd.Salary from JobRole Jb
        left join JobRltDetails Jd
        on Jb.Job_id=Jd.job_id;

        select Ap.Name,Ap.Email,aps.Field_skills,aps.PreviousWorkplace from Applicant_data Ap
        left join App_skills Aps
        on Ap.applicant_ID=Aps.applicant_id;

        select ad.Name,ad.Phone,avd.preferred_work,avd.preferred_start_date from Applicant_data ad
        left join Availability_details avd
        on ad.applicant_ID=avd.applicant_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id from Applicant_data Ad
        left join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id from Applicant_data Ad
        left join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        left join Company_department cd
        on C.Company_id=Cd.company_id
        left join JobRole J
        on cd.dept_id=J.dept_id

        select Ad.applicant_ID,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id,Ap.DATE from Applicant_data Ad
        left join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on E.applicant_ID=Ap.app_id;

		select ap.Name,ap.Email,aj.job_id,aps.Status from Applicant_data ap
		inner join Apply_job aj
		on ap.applicant_ID=aj.app_id
		left join Approved_applicants aps
		on aps.apply_id=aj.apply_id

        -------------------------------------Right Join(25)-----------------------------------------------------
        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        right join Education E
        on Ap.applicant_ID=E.applicant_id

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id from Applicant_data Ap
        right join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id,Aj.DATE from Applicant_data Ap
        right join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.Name,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        right join Education E
        on Ap.applicant_ID=E.applicant_id;

        select C.Company_id,C.CompName,Cd.dep_name,Cd.dept_Director from Company C
        right join Company_department Cd
        on C.Company_id=Cd.company_id

        select Jb.Job_id,jb.comp_ID,jb.dept_id,jb.job_type,Jd.Salary from JobRole Jb
        right join JobRltDetails Jd
        on Jb.Job_id=Jd.job_id;

        select Ap.Name,Ap.Email,aps.Field_skills,aps.PreviousWorkplace from Applicant_data Ap
        right join App_skills Aps
        on Ap.applicant_ID=Aps.applicant_id;

        select ad.Name,ad.Phone,avd.preferred_work,avd.preferred_start_date from Applicant_data ad
        right join Availability_details avd
        on ad.applicant_ID=avd.applicant_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id from Applicant_data Ad
        right join Education E
        on Ad.applicant_ID=E.applicant_ID
        right join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id from Applicant_data Ad
        right join Education E
        on Ad.applicant_ID=E.applicant_ID
        right join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        right join Company_department cd
        on C.Company_id=Cd.company_id
        right join JobRole J
        on cd.dept_id=J.dept_id

        select Ad.applicant_ID,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id,Ap.DATE from Applicant_data Ad
        right join Education E
        on Ad.applicant_ID=E.applicant_ID
        right join Apply_job Ap
        on E.applicant_ID=Ap.app_id;

		select ap.Name,ap.Email,aj.job_id,aps.Status from Applicant_data ap
		inner join Apply_job aj
		on ap.applicant_ID=aj.app_id
		right join Approved_applicants aps
		on aps.apply_id=aj.apply_id

		-------------------------------FULL Joins (25 queries)--------------------------------------

		select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,Ap.Email,E.CGPA from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,E.CGPA,E.Degree from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select ap.applicant_ID,Ap.Email,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.applicant_ID,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,E.CGPA,E.Degree from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

        select Ap.applicant_ID,Ap.Name,E.CGPA,E.Degree,E.UniversityName,aps.apply_id,aps.DATE from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
		inner join Apply_job aps
		on ap.applicant_ID=aps.app_id
        

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        

		select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id from Applicant_data Ap
        full join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.applicant_ID,Ap.Name,Aj.cmp_id,Aj.DATE from Applicant_data Ap
        full join Apply_job Aj
        on Ap.applicant_ID=Aj.app_id;

        select Ap.Name,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id;

        select C.Company_id,C.CompName,Cd.dep_name,Cd.dept_Director from Company C
        full join Company_department Cd
        on C.Company_id=Cd.company_id

        select Jb.Job_id,jb.comp_ID,jb.dept_id,jb.job_type,Jd.Salary from JobRole Jb
        full join JobRltDetails Jd
        on Jb.Job_id=Jd.job_id;

        select Ap.Name,Ap.Email,aps.Field_skills,aps.PreviousWorkplace from Applicant_data Ap
        full join App_skills Aps
        on Ap.applicant_ID=Aps.applicant_id;

        select ad.Name,ad.Phone,avd.preferred_work,avd.preferred_start_date from Applicant_data ad
        full join Availability_details avd
        on ad.applicant_ID=avd.applicant_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id from Applicant_data Ad
        full join Education E
        on Ad.applicant_ID=E.applicant_ID
        right join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id from Applicant_data Ad
        full join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id;

        select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        full join Company_department cd
        on C.Company_id=Cd.company_id
        left join JobRole J
        on cd.dept_id=J.dept_id

        select Ad.applicant_ID,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id,Ap.DATE from Applicant_data Ad
        full join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on E.applicant_ID=Ap.app_id;

		select ap.Name,ap.Email,aj.job_id,aps.Status from Applicant_data ap
		inner join Apply_job aj
		on ap.applicant_ID=aj.app_id
		full join Approved_applicants aps
		on aps.apply_id=aj.apply_id

		----------------------------------Joins with where Clause---------------------------------------

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        inner join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=15;

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        inner join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=10;

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        inner join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=20;

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        inner join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=38;

		select ad.Name,ad.Phone,avd.preferred_work,avd.preferred_start_date from Applicant_data ad
        left join Availability_details avd
        on ad.applicant_ID=avd.applicant_id
		where avd.preferred_work like 'remote'

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id from Applicant_data Ad
        left join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id
		where Ap.job_id=2;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id from Applicant_data Ad
        left join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id
		where ad.Name='Subhan'

        select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        left join Company_department cd
        on C.Company_id=Cd.company_id
        left join JobRole J
        on cd.dept_id=J.dept_id
		where cd.dept_id=22

        select Ad.applicant_ID,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id,Ap.DATE from Applicant_data Ad
        left join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on E.applicant_ID=Ap.app_id
		where E.applicant_ID=33;

		select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        right join Company_department cd
        on C.Company_id=Cd.company_id
        left join JobRole J
        on cd.dept_id=J.dept_id
		where cd.dept_id=22

        select Ad.applicant_ID,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id,Ap.DATE from Applicant_data Ad
        right join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on E.applicant_ID=Ap.app_id
		where E.applicant_ID=33;

		
        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id from Applicant_data Ad
        right join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id
		where Ap.job_id=2;

        select Ad.applicant_ID,Ad.Name,ad.Phone,E.UniversityName,E.Degree,Ap.cmp_id,Ap.job_id from Applicant_data Ad
        right join Education E
        on Ad.applicant_ID=E.applicant_ID
        left join Apply_job Ap
        on Ad.applicant_ID=Ap.app_id
		where ad.Name='Subhan'

		select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        right join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=25;

		select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=25;

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=15;

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=10;

        select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
        full join Education E
        on Ap.applicant_ID=E.applicant_id
        where Ap.applicant_ID=20;

		-------------------------------Stored Procedure----------------------------------

		--------------------------------Without Parameter-------------------------------------

		create proc getApplicatnInfo
		as 
		begin 
		select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
		inner join Education E
		on Ap.applicant_ID=E.applicant_id
		end

		create proc getCompanyInfo
		as 
		begin
		select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        inner join Company_department cd
        on C.Company_id=Cd.company_id
        inner join JobRole J
        on cd.dept_id=J.dept_id
		end

		create proc getSorteddataApplicant
		as 
		begin 
		SELECT A.Name,A.Email   FROM Applicant_data A order by A.Name
		end

		create proc getCGPA 
		as 
		begin 
		SELECT E.CGPA   FROM Education E order by E.CGPA desc
		end

		create proc getDirectors
		as 
		begin
		SELECT Cd.dept_Director FROM Company_department Cd order by Cd.dept_Director
		end

		create proc getJobroles
		as 
		begin 
		SELECT jb.job_role  FROM JobRole jb order by jb.job_role
		end

		create proc getBySotedZip
		as 
		begin
		SELECT C.CompName,c.Zip_code FROM Company C order by c.Zip_code
		end

		create proc GetCOUNTApplicants
		as
		begin
		select COUNT(applicant_ID) from Applicant_data
		end

		create proc getMaxSalary
		as
		begin
		SELECT MAX(Salary) from JobRltDetails
		end

		create proc getMinCGPA
		as
		begin
		SELECT MIN(CGPA) from Education
		end

		create proc getMinSalary
		as
		begin
		SELECT MIN(dbo.JobRltDetails.Salary) from  JobRltDetails
		end

		create proc getUniversityCount
		as
		begin
		SELECT COUNT(Education.UniversityName) from Education
		end

		create proc getAVGCGPA
		as
		begin
		SELECT AVG(CGPA) from Education
		end


		create proc getAVGSALARY
		as
		begin
		SELECT AVG(salary) from JobRltDetails
		end

		create proc getAVGBonus
		as
		begin
		SELECT AVG(Bonus) from JobRltDetails
		end

		create proc get_top_three_rows
		as
		begin
		SELECT TOP (3) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
        FROM [OnlineJobPortal].[dbo].[JobRltDetails]
		end

		create proc get_top_six_rows
		as
		begin
		SELECT TOP (6) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]
		end

		create proc get_top_nine_rows
		as
		begin
	  SELECT TOP (9) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]
		end

		create proc get_top_twenty_rows
		as
		begin
	  SELECT TOP (20) [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]
		end
		
		create proc getCompaniesName
		as
		begin
		select C.CompName,C.CompAddress from Company C
		end

		create proc getUniversityNames
		as
		begin
		select E.UniversityName from Education E
		end

		create proc GetApplicantSkills
		as
		begin
		select Aps.applicant_id,Aps.Field_skills from App_skills Aps
		end

		create proc get_JobsSalary
		as 
		begin
		select Jd.job_id,Jd.Salary from JobRltDetails Jd
		end
		
		create proc TOUpperCase
		as
		begin
		select UPPER(a.Name) from Applicant_data a
		end

		create proc ToLowerCase
		as
		begin
		select LOWER(a.Name) from Applicant_data a
		end


		---------------------------------Procedures with Parameters--------------------------------------------

		create proc getApplicatnInfoWP
		@id int
		as 
		begin 
		select Ap.Name,Ap.Email,E.CGPA,E.Degree,E.UniversityName from Applicant_data Ap
		inner join Education E
		on Ap.applicant_ID=E.applicant_id
		where E.applicant_ID=@id
		end

		create proc getCompanyInfoWP
		@dp_id int
		as 
		begin
		select C.Company_id,C.CompName,cd.dep_name,CD.dept_Director,j.job_role from Company C
        inner join Company_department cd
        on C.Company_id=Cd.company_id
        inner join JobRole J
        on cd.dept_id=J.dept_id
		where cd.dept_id=@dp_id
		end

		create proc getCGPAWP 
		@Uname varchar(20)
		as 
		begin 
		SELECT E.applicant_id,E.CGPA FROM Education E
		where E.UniversityName=@Uname
		end


		create proc getDirectorsWP
		@Dname varchar(20)
		as 
		begin
		SELECT Cd.dept_Director FROM Company_department Cd
		where cd.dep_name=@Dname
		end

		create proc getJobrolesWP
		@Role varchar(30)
		as 
		begin 
		SELECT jb.job_id  FROM JobRole jb
		where job_role like @Role
		end

		create proc SpgetJobbyUID
		@uid int
		as begin 
		select  U.applicant_ID, U.Name,U.Phone,J.job_role,Ap.cmp_id from Applicant_data U
		inner join JobRole J
		on u.applicant_ID=j.job_id
		inner join Apply_job Ap
		on J.job_id=Ap.app_id
		where U.applicant_ID=@uid
		end

		create proc SpgetRangeValue
		@val2 int
		as
		begin
		select C.CompName,C.CompAddress from Company C
		where C.Company_id
		BETWEEN 5 AND @val2
		end

		create proc SpGetTopROWS
		@pr int 
		as
		begin 
		select TOP(@pr)  [job_id]
      ,[Salary]
      ,[Bonus]
      ,[jb_duties]
      ,[jri_id]
      FROM [OnlineJobPortal].[dbo].[JobRltDetails]
		end

		create proc SpgetComapnyDeartmentsList
		@cmpny_id int
		as
		begin
		select C.Company_id,C.CompName,Cd.dept_id,cd.dep_name from Company C
		inner Join Company_department Cd
		on C.Company_id=Cd.company_id
		where C.Company_id=@cmpny_id
		end

		create proc SpJobsInDepartments
		@deptName varchar(20)
		as
		begin
		select cd.company_id,cd.dep_name,jr.job_role,jr.job_type from Company_department cd
		inner join JobRole Jr
		on cd.dept_id=jr.dept_id
		where cd.dep_name=@deptName
		end

		create proc SpGetallDetailsOnComapny
		@id int
		as
		begin
		select C.CompName,C.CompAddress,Cd.dept_id,jd.Job_id from Company C
		inner join JobRole Jr
		on C.Company_id=Jr.comp_ID
		inner join JobRltDetails jd
		on jd.job_id=Jr.Job_id
		inner join Company_department Cd
		on Cd.company_id=C.Company_id
		where C.Company_id=@id;
		end

		create proc SpGetbyName
		@name varchar(30)
		as
		begin
		select A.Name,A.Email,ap.Experience,ap.Field_skills from Applicant_data A
		inner join App_skills ap
		on a.applicant_ID=ap.applicant_id
		where a.Name=@name
		end

		create proc status_aprroval
		@val int
		as
		begin
		select ap.Name,ap.Email,aj.job_id,aps.Status from Applicant_data ap
		inner join Apply_job aj
		on ap.applicant_ID=aj.app_id
		left join Approved_applicants aps
		on aps.apply_id=aj.apply_id
		where ap.applicant_ID=@val
		end




		--------------------------------------------------Triggers----------------------------------------------------------------------------

		------------------------------------------------INSERT Trigger------------------------------------------------------------------

		create trigger Applicant_Audits
		On [dbo].[Applicant_data]
		for insert 
		as begin 
		declare @id int
		select @id =applicant_ID from inserted
		declare @name varchar(20) 
		select @name= Name from inserted
		insert into [dbo].[AUDIT_tbl]
		values('New Applicant with id ='+CAST(@id as nvarchar(5))+',Name:'+cast(@name as varchar(20))+' added at'+ cast(getdate() as nvarchar(20)))
		end

		create trigger Company_AUDIT
		On [dbo].[Company]
		for insert 
		as begin 
		declare @id int
		select @id =Company_id from inserted
		declare @name varchar(20) 
		select @name= CompName from inserted
		insert into [dbo].[AUDIT_tbl]
		values('New Company with id ='+CAST(@id as nvarchar(5))+',Name:'+cast(@name as varchar(20))+' added at'+ cast(getdate() as nvarchar(20)))
		end

		create trigger Job_AUDIT
		On [dbo].[JobRole]
		for insert 
		as begin 
		declare @id int
		select @id =Job_id from inserted
		declare @name varchar(20) 
		select @name= job_role from inserted
		declare @cp_id int
		select @cp_id = comp_ID from inserted
		declare @dp_id int
		select @dp_id= dept_id from inserted
		insert into [dbo].[AUDIT_tbl]
		values('New Job with id ='+CAST(@id as nvarchar(5))+',Role:'+cast(@name as varchar(20))+'with compnayID:'+CAST(@cp_id as nvarchar(5))
		+' Dept_id:'+CAST(@dp_id as nvarchar(5))+'added at'+ cast(getdate() as nvarchar(20)))
		end

		create trigger Apply_jobAudit
		On [dbo].[Apply_job]
		for insert 
		as begin 
		declare @apID int
		select @apID= app_id from inserted
		declare @jbID int
		select @jbID= job_id from inserted 
		declare @cID int
		select @cID= cmp_id from inserted
		insert into [dbo].[Job_applyAudit]
		values('Applicant:'+CAST(@apID as nvarchar(5))+', has apply for JobID:'+cast(@jbID as nvarchar(5))+' and with compnayID:'+CAST(@cID as nvarchar(5))+
		'apply on'+ cast(getdate() as nvarchar(20)))
		end


		create trigger Approved_VacanciesAudit
		on [dbo].[Approved_applicants]
		for insert 
		as begin
		declare @st_id int
		select @st_id= Status_id from inserted
		declare @aply_id int
		select @aply_id= apply_id from inserted
		declare @Status bit
		select @Status= Status from inserted
		insert into ApplyStatus_Audit
		values('Status_id:'+cast(@st_id as nvarchar(5))+' with apply_id:'+cast(@aply_ID as nvarchar(5))+' Status:'+cast(@Status as nvarchar(5)))
		end

		create trigger Users_Audit
		on [dbo].[users]
		for insert
		as begin
		declare @uid int
		select @uid= [user_id] from inserted
		declare @email varchar(30)
		select @email=email from inserted
		insert into AUDIT_tbl
		values('New User with User_id:'+cast(@uid as nvarchar(5))+' with email:'+cast(@email as nvarchar(5))+' has added')
		end


		---------------------------------------------------DELETE Triggers--------------------------------------------------------------------------

		create trigger ApplicantD_Audits
		On [dbo].[Applicant_data]
		for delete
		as begin 
		declare @id int
		select @id =applicant_ID from deleted
		declare @name varchar(20) 
		select @name= Name from deleted
		insert into [dbo].[AUDIT_tbl]
		values('Existing Applicant with id ='+CAST(@id as nvarchar(5))+',Name:'+cast(@name as varchar(20))+' Removed at'+ cast(getdate() as nvarchar(20)))
		end

		create trigger CompanyD_AUDIT
		On [dbo].[Company]
		for delete 
		as begin 
		declare @id int
		select @id =Company_id from deleted
		declare @name varchar(20) 
		select @name= CompName from deleted
		insert into [dbo].[AUDIT_tbl]
		values('Existing Company with id ='+CAST(@id as nvarchar(5))+',Name:'+cast(@name as varchar(20))+' Removed at'+ cast(getdate() as nvarchar(20)))
		end

		create trigger JobD_AUDIT
		On [dbo].[JobRole]
		for delete
		as begin 
		declare @id int
		select @id =Job_id from deleted
		declare @name varchar(20) 
		select @name= job_role from deleted
		declare @cp_id int
		select @cp_id = comp_ID from deleted
		declare @dp_id int
		select @dp_id= dept_id from deleted
		insert into [dbo].[AUDIT_tbl]
		values('Existing Job with id ='+CAST(@id as nvarchar(5))+',Role:'+cast(@name as varchar(20))+'with compnayID:'+CAST(@cp_id as nvarchar(5))
		+' Dept_id:'+CAST(@dp_id as nvarchar(5))+'Removed at'+ cast(getdate() as nvarchar(20)))
		end

		create trigger ApplyD_jobAudit
		On [dbo].[Apply_job]
		for delete
		as begin 
		declare @apID int
		select @apID= app_id from deleted
		declare @jbID int
		select @jbID= job_id from deleted
		declare @cID int
		select @cID= cmp_id from deleted
		insert into [dbo].[Job_applyAudit]
		values('Applicant:'+CAST(@apID as nvarchar(5))+', had apply for JobID:'+cast(@jbID as nvarchar(5))+' and with compnayID:'+CAST(@cID as nvarchar(5))+
		'application removed at'+ cast(getdate() as nvarchar(20)))
		end

		create trigger UsersD_Audit
		on [dbo].[users]
		for delete
		as begin
		declare @uid int
		select @uid= user_id from deleted
		declare @email varchar(30)
		select @email=email from deleted
		insert into AUDIT_tbl
		values('User_id:'+cast(@uid as nvarchar(5))+' with email:'+cast(@email as nvarchar(5))+'has removed')
		end








