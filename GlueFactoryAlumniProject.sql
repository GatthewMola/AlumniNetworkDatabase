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

/* I've added a Cascade on Delete clause for the alumni_id foreign key so that when someone's alumni information is deleted, their corresponding job information is deleted as well. */
CREATE TABLE job_info(
	job_id SERIAL PRIMARY KEY,
	Current_Job VARCHAR (150),
	Current_Company VARCHAR (150),
	Phone VARCHAR (75) UNIQUE,
	Email VARCHAR (100) UNIQUE NOT NULL,
	Job_Board VARCHAR (100),
	alumni_id SERIAL REFERENCES alumni_info(alumni_id)
    ON DELETE CASCADE
);