DROP TABLE IF EXISTS alumni_info;
DROP TABLE IF EXISTS job_info;

CREATE TABLE alumni_info(
	Alumni_ID SERIAL PRIMARY KEY,
	Name VARCHAR (75) NOT NULL,
	Class SMALLINT NOT NULL,
	Major VARCHAR (100) NOT NULL,
	Minor VARCHAR (100),
	Gradudate_School VARCHAR (100),
	Degree VARCHAR (50),
	Lacrosse_Participation VARCHAR (50)
);

/* I've opted to manually insert the alumni spreadsheet data into the tables instead of importing as much of the data is not in the same format and contains manually input "N/A" null values.
Normalizing the data before it is used for the alumni website will make it easier to enter future alumni data and run database maintenance.  */
INSERT INTO alumni_info (name,class,major,minor,Gradudate_School,degree,Lacrosse_Participation) VALUES
('Weston Bimstefer',2017,'Business Administration','Computer Science','Lenoir-Rhyne','MBA','Yes'),
('James McNeill',2018,'Business Administration/Economics','Math','University of Maryland - Smith Business School','MBA','Yes'),
('Dannie Kauffman',2020,'Business Administration','Marketing',NULL,'Bachelors','Yes'),
('Scott Kiewe',2020,'Communications',NULL,NULL,'Bachelors','Yes'),
('Pat Hurly',2020,'Biology','History','Medical University of South Carolina','BSN/RN','Maybe'),
('Tai Foster',2016,'Political Science','Law and Society','University of Hawaii','JD','Maybe'),
('Joe Carroll',2019,'Computer Science','Math',NULL,'Bachelors','Yes'),
('Sean Murphy',2017,'Business Administration','Finance/Spanish','Old Dominion University','Bachelors,CFP','Yes'),
('Will Clampitt',2018,'Accounting','Marketing',NULL,'Bachelors','Yes'),
('Christian Hoch',2020,'Biology',NULL,'Campbell School of Osteopathic Medicine','DO','Maybe'),
('Patrick OLeary',2015,'Political Science','Economics','University of Baltimore Law','JD','Yes'),
('Nick Spicer',2011,'Law & Society','Religion','Wilmington University','EdD','No'),
('Zac Flecksteiner',2021,'Business Administration','Marketing/Psychology',NULL,'Bachelors','Yes'),
('Cody Haas',2015,'Math',NULL,NULL,'Bachelors','No'),
('Ricky Orndorff',2012,'Computer Science',NULL,NULL,'Bachelors',NULL),
('Jared Bileski',2016,'Music Performance/Communicatiuons',NULL,NULL,'Bachelors','Maybe'),
('Gavin Combe',2021,'Business Adminstration',NULL,NULL,'Bachelors',NULL),
('William Lane',2013,'Environmental Biology','Chemistry',NULL,'Bachelors','No'),
('Jeff Tarleton',2010,'Art & Archaeology','History',NULL,'Bachelors','Maybe'),
('Corey Roberts',2012,'Business Management','Marketing',NULL,'Bachelors','Yes'),
('Blake Rust',2010,'Biochemistry',NULL,'Tulane University School of Medicine','PhD','Yes'),
('Drew Althouse',2012,'Chemistry','Physics','Shenandoah University - Athletic Training','Masters','Maybe'),
('Dylan OConnell',2012,'Math','Chemistry/Physics','Worcester Polytechnic Institute','Masters','Yes'),
('Sofiane Lazar',2010,'Communications',NULL,'Temple University School of Medicine','MD','Yes'),
('Grayson Zubradt',2019,'IMC','Psychology',NULL,'Bachelors','Maybe'),
('Chris Gallo',2012,'History',NULL,NULL,NULL,'Yes'),
('Dominic Cetrone',2014,'Biology',NULL,NULL,'Bachelors','Yes'),
('Ryan Pretko',2012,'Environmental Science','Policy','University of Maryland Global Campus','Masters','Yes'),
('James Weger',2015,'Business Administration','Economics',NULL,'Bachelors','Yes'),
('Calvin Burton',2013,'Business Management','Marketing','Robert Morris University','Masters','No'),
('Dan Capps',2014,'Law and Criminal Justice',NULL,'Liberty University School of Law','JD','Maybe'),
('Eddie Somerville',2019,'Biochemistry',NULL,NULL,'Bachelors','Yes'),
('Kyle Lammey',2014,'Math',NULL,'Missouri Science and Technology','Masters','Maybe'),
('Tim Sylvia',2019,'Communications',NULL,NULL,'Bachelors','Yes'),
('Avery Beale',2023,'ENSP/Coastal & Watershed',NULL,NULL,'Bachelors','Yes'),
('Matt Macenka',2022,'Business Administration',NULL,NULL,'Bachelors','Maybe'),
('Justin Nelson',2019,'Math','Computer Science','University of Maryland Global Campus','Masters','Yes'),
('Michael Cook',2021,'Law and Criminal Justice',NULL,'Hood College','Masters',NULL,),
('Matt Gola',2021,'Economics','Business Administration',NULL,'Bachelors','No');


/* I've added a Cascade on Delete clause for the alumni_id foreign key so that when someone's alumni information is deleted, their corresponding job information is deleted as well. */
CREATE TABLE job_info(
	job_id SERIAL PRIMARY KEY,
	Current_Job VARCHAR (150),
	Current_Company VARCHAR (150),
	Phone VARCHAR (75) UNIQUE,
	Email VARCHAR (100) UNIQUE,
	Job_Board VARCHAR (150),
	alumni_id SERIAL REFERENCES alumni_info(alumni_id)
    ON DELETE CASCADE
);

INSERT INTO job_info (Current Company,Current Job,phone,email,job_board) VALUES
('Winning Edge Real Estate','Realtor/Owner','Ellicot City, MD','410-564-4950','weston@jimbim.com',NULL),
('T. Rowe Price','Associate Vice Presidential - Intermediary Sales Consultant','Frederick, MD','301-514-5381','james.mcneill@troweprice.com',NULL),
('Eye in the Sky Drone Media','Owner/Operator','Lancaster, PA','717-371-4046','dkauffman@eyeintheskydronemedia.com',NULL),
('Carahsoft Technology','Government Account Representative','Pikesville, MD','410-350-1522','slkkiewe@gmail.com'),NULL,
('Pat Hurly','Medical University of South Carolina','ICU RN','Charleston, SC','304-312-4165','hurleypatrick360@gmail.com',NULL),
('City & County of Honolulu','Prosecutor','Honolulu, HI','732-543-4275','tai@chingfoster.com',NULL),
('Lockheed Martin','Systems Engineer - IT Sr','Spotsylvania, VA','540-905-9900','carrolljoe8@gmail.com',NULL),
('Edward Jones Investments','Financial Advisor','Virginia Beach, VA','757-803-7021','seanmurphy37@gmail.com',NULL),
('Nodal Exchange','Senior Tax & Revenue Accountant','Frederick, MD','302-344-0578','willclampitt22@gmail.com',NULL),
('Campbell School of Osteopathic Medicine','2nd Year Medical Student (MS2)','Lillington, NC','717-855-8563','24christianh@gmail.com',NULL),
('Maryland Speaker of the House','Senior Advisor','Baltimore, MD','717-507-9066','pat.oleary18@gmail.com',NULL),
('Novant Health','Learning and Education Specialist','Wilmington, NC','910-746-9053','nickolascspicer@gmail.com',NULL),
('City Fitness Philadelphia','Head Trainer','Philadelphia, PA','484-661-9641','flecksteiner82@gmail.com',NULL),
('Riot Games, Inc.','Staff Software Engineer','San Diego, CA','631-742-4173''codymhaas@gmail.com'),NULL,
('Clarity Innovations','Software Engineer/Program Manager','Boston, MA','443-610-2041','rorndorff3@gmail.com','https://www.clarityinnovates.com/careers'),
('Freelance','Live Video Production Engineer','Washington, DC,','240-344-7109','jared.bileski@gmail.com',NULL),
('Stickles Service HVAC',NULL,NULL,NULL,NULL,NULL),
('William Lane','Portsmouth Naval Shipyard, US Dept. of Navy','Radiological Controls','San Diego, CA','301-788-9600','william.a.lane.24@gmail.com','https://www.usajobs.gov'),
('AskBio','Senior Scientist','Durham, NC','301-514-7077','blake.rust@gmail.com',NULL),
('Merkle','Channel Sales Manager','Charleston, SC','410-983-1344','cdrlax@gmail.com',NULL),
('Land & Sea Detailing','Manager of Operations','Baltimore, MD','410-979-4052','tarleton87@gmail.com',NULL),
('Eastern Michigan University','Assistant Athletic Trainer - Swim & Dive & Distance Track','Ypsianti, MI','804-814-0471','aalthous13@su.edu',NULL),
('Hewlette Packard Enterprise','Enterprise Architecht','Bayonne, NJ','443-207-1200','dylanoconnell@protonmail.com','https://careers.hpe.com/us/en/'),
('Thomas Jefferson University Hospital','Anesthesiologist and Intensivist','Philadelphia, PA','401-965-6993','sofiane.lazar.gmail.com',NULL),
('Cision, Inc.','Account Manager','Chicago, IL','630-807-9350','gzubradt@gmail.com','https://jobs.level.co/cision'),
('Maryland Dept. of Labor','Unemployment Professional','Cumberland, MD','609-338-9494','domcetrone@gmail.com',NULL),
('Elior, Inc.','Growth and Retention Director','Currituck, NC','410-259-2135','ryanpretko@gmail.com',NULL),
('Eco Engineering','Associate Development Engineer','New York, NY','717-968-6629','jaweger40@gmail.com',NULL),
('Bell Flight/Textron','Associate Cybersecurity Analyst','Dallas, TX','718-908-3530','calvinburton3@gmail.com','https://textron.taleo.net/careersection/bell/jobsearch.ftl?lang=en'),
('Sanabria Associates','Criminal Defense Attorney','Warrenton, VA','540-219-4949','dancapps14@outlook.com',NULL),
('IQVIA','Associate Project Manager','Frederick, MD','631-848-4107','esomerville20@gmail.com',NULL),
('Army','Engineer','FLW, MO','443-553-6583','klammey96@gmail.com',NULL),
('Albermarle','Senior Content Development Lead','Charlotte, NC','508-562-7339','timsylvia97@gmail.com',NULL),
(NULL,NULL,'Frederick, MD/South Berwick, ME','207-703-9324','avery.beale@gmail.com',NULL),
('Leidos Biomedical Research','Business Processes I','Frederick, MD','804-519-3192','macenkamatt@gmail.com',NULL),
('Bluehalo','Research Engineer II','Hagerstown, MD','240-676-7780','justintimenelson@gmail.com',NULL),
('Quevera','Web Developer I/Security Architect','Baltimore, MD','301-717-3601','michaelcook1999@gmail.com',NULL),
('Regulus Group','Cost Analyst','Baltimore,MD','203-856-6279','mattgola@outlook.com','https://regulus.rec.pro.ukg.net/REG1008RGGL/JobBoard/46674cff-1dcc-447c-93e2-498f29d53e00/?q=&o=postedDateDesc');