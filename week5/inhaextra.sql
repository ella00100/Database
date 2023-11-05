-- -----------------------------------------------------
-- Table 'inha'.'building'
-- -----------------------------------------------------

CREATE TABLE Building (
    Bid INT(8) NOT NULL,
    Bname VARCHAR(20) NOT NULL,
    PRIMARY KEY (Bid),
    UNIQUE INDEX Name_UNIQUE (Bname ASC) VISIBLE
);

-- -----------------------------------------------------
-- Table 'inha'.'department'
-- -----------------------------------------------------
CREATE TABLE Department (
    Did INT(8) NOT NULL,
    Dname VARCHAR(45) NOT NULL,
    Demail VARCHAR(30),
    DphoneNumber INT,
    PRIMARY KEY (Did),
    UNIQUE INDEX Dname_UNIQUE (Dname ASC) VISIBLE
    );

-- -----------------------------------------------------
-- Table 'inha'.'room'
-- -----------------------------------------------------
CREATE TABLE Room (
    Rid INT(8) NOT NULL,
    Bname VARCHAR(20) NOT NULL,
    Mgr_Dname VARCHAR(40) NULL,
    RName VARCHAR(20) NOT NULL,
    Capacity INT NULL,
    PRIMARY KEY (Rid, Bname),
    UNIQUE INDEX Room_Name_UNIQUE (RName ASC) VISIBLE,
    INDEX fk_building_name_idx (Bname ASC) VISIBLE,
    INDEX fk_dept_name_room_idx (Mgr_Dname ASC) VISIBLE,
    CONSTRAINT fk_building_name
        FOREIGN KEY (Bname)
        REFERENCES Building (Bname)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_dept_name_room
        FOREIGN KEY (Mgr_Dname)
        REFERENCES Department (Dname)
);

-- -----------------------------------------------------
-- Table 'inha'.'club'
-- -----------------------------------------------------
CREATE TABLE Club (
    ClubId INT(8) NOT NULL,
    ClubName VARCHAR(45) NOT NULL,
    PRIMARY KEY (ClubId),
    UNIQUE INDEX ClubName_UNIQUE (ClubName ASC) VISIBLE
    );

-- -----------------------------------------------------
-- Table 'inha'.'student'
-- -----------------------------------------------------
CREATE TABLE Student (
    Sid INT(8) NOT NULL,
    Major VARCHAR(40),
    ClubName VARCHAR(45),
    SName VARCHAR(20) NOT NULL,
    Semail VARCHAR(30),
    SphoneNumber INT,
    PRIMARY KEY (Sid),
    INDEX fk_major (Major ASC) VISIBLE,
    INDEX fk_club_idx (ClubName ASC) VISIBLE,
    CONSTRAINT fk_major
        FOREIGN KEY (Major)
        REFERENCES Department (Dname)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_club
        FOREIGN KEY (ClubName)
        REFERENCES Club (ClubName)
);

-- -----------------------------------------------------
-- Table 'inha'.'Employee'
-- -----------------------------------------------------
CREATE TABLE Employee (
    Eid INT(8) NOT NULL,
    Dname VARCHAR(45) NOT NULL,
    Ename VARCHAR(45) NOT NULL,
    Position VARCHAR(45) NOT NULL,
    PRIMARY KEY (Eid),
    INDEX fk_department_idx (Dname ASC) VISIBLE,
    CONSTRAINT fk_department
        FOREIGN KEY (Dname)
        REFERENCES Department (Dname)
);

-- -----------------------------------------------------
-- Table 'inha'.'class'
-- -----------------------------------------------------
CREATE TABLE Class (
    ClassId INT(8) NOT NULL,
    ProfessorId INT(8) NOT NULL,
    ClassName VARCHAR(45) NOT NULL,
    NumberOfParticipants INT,
    Rname VARCHAR(20),
    PRIMARY KEY (ClassId),
    INDEX fk_employee_id_idx (ProfessorId ASC) VISIBLE,
    INDEX fk_room_name_idx (Rname ASC) VISIBLE,
    CONSTRAINT fk_employee_id
        FOREIGN KEY (ProfessorId)
        REFERENCES Employee (Eid),
    CONSTRAINT fk_room_name
        FOREIGN KEY (Rname)
        REFERENCES Room (RName)
);


-- -----------------------------------------------------
-- Table 'inha'.'class'
-- -----------------------------------------------------

CREATE TABLE Enroll (
    Sid INT(8) NOT NULL,
    ClassId INT(8) NOT NULL,
    PRIMARY KEY (Sid, ClassId),
    INDEX fk_Student_id_idx (Sid ASC) VISIBLE,
    INDEX fk_class_id_idx (ClassId ASC) VISIBLE,
    CONSTRAINT fk_Student_id
        FOREIGN KEY (Sid)
        REFERENCES Student (Sid),
    CONSTRAINT fk_class_id
        FOREIGN KEY (ClassId)
        REFERENCES Class (ClassId)

);

INSERT INTO Building VALUES(12345678, "Building 1");
INSERT INTO Building VALUES(11111111, "Building 2");
INSERT INTO Building VALUES(12323434, "Building 3");
INSERT INTO Building VALUES(12155878, "Building 4");
INSERT INTO Building VALUES(12387577, "Building 5");

INSERT INTO Department VALUES(33331111, "Management", "bus012@inha.com", 01088889999);
INSERT INTO Department VALUES(33231112, "Electrical Engineering", "ic0113@inha.com", 01022899777);
INSERT INTO Department VALUES(33331113, "Mechanical Engineering", "suldf91@inha.com", 01066669988);
INSERT INTO Department VALUES(35451114, "InC Engineering", "awml0sklm@inha.com", 01088449911);
INSERT INTO Department VALUES(35462115, "International Trade", "pqalllm@inha.com", 01079152348);
INSERT INTO Department VALUES(35462116, "Library", "d1mslalm@inha.com", 01019304500);


INSERT INTO Room VALUES(11112222, "Building 1", "Mechanical Engineering", "Room 303", 100);
INSERT INTO Room VALUES(11112223, "Building 2", "Management", "Lounge", 20);
INSERT INTO Room VALUES(11112224, "Building 3", "InC Engineering", "Auditorium", 200);
INSERT INTO Room VALUES(11112225, "Building 4", "Electrical Engineering", "Room 103", 50);
INSERT INTO Room VALUES(11112226, "Building 4", "Electrical Engineering", "Room 208", 30);

INSERT INTO Club VALUES(99998991, "FLAGON");
INSERT INTO Club VALUES(99998992, "Pop music");
INSERT INTO Club VALUES(99998993, "FLEX");
INSERT INTO Club VALUES(99998994, "RIVS");
INSERT INTO Club VALUES(99998995, "Assess");

INSERT INTO Student VALUES(12192261, "Management", "FLEX","Yoon Seo Young", "yoon8720@nate.com", 01075799717);
INSERT INTO Student VALUES(12171512, "Electrical Engineering", "RIVS", "Kim Ye Ji", "ejh470@nate.com", 01075799717);
INSERT INTO Student VALUES(12184523, "Mechanical Engineering", null, "Kim Ye Eun", "ywmdls447@nate.com", 01075799717);
INSERT INTO Student VALUES(12197822, "InC Engineering", "RIVS", "Ha Sung Min", "shandog7@nate.com", 01075799717);
INSERT INTO Student VALUES(12208756, "InC Engineering",null,  "Chae Seo In", "andoewl1@nate.com", 01075799717);

INSERT INTO Employee VALUES(22220221,  "InC Engineering", "Dr.choi", "Professor");
INSERT INTO Employee VALUES(22220222,  "InC Engineering", "hack nam", "Professor");
INSERT INTO Employee VALUES(22220223,  "Management","Dr.bradden", "Professor");
INSERT INTO Employee VALUES(22220224,  "Management", "Kim Su Ji", "Professor");
INSERT INTO Employee VALUES(22220225,  "Management", "Park hong gi", "team manager");
INSERT INTO Employee VALUES(22220226,  "Library", "Li jung A", "librarian");

INSERT INTO Class VALUES(00199991, 22220221, "Database",  200,  "Auditorium");
INSERT INTO Class VALUES(00199992, 22220222,"C++", 40,  "Room 303");
INSERT INTO Class VALUES(00199993, 22220221,  "Data Structure", 50,  "Room 103");
INSERT INTO Class VALUES(00199994, 22220223, "business english", 30,  "Room 303");
INSERT INTO Class VALUES(00199995, 22220224, "marketing", 100,  "Room 208");

INSERT INTO Enroll VALUES(12192261, 00199991);
INSERT INTO Enroll VALUES(12192261, 00199992);
INSERT INTO Enroll VALUES(12192261, 00199993);
INSERT INTO Enroll VALUES(12192261, 00199994);
INSERT INTO Enroll VALUES(12192261, 00199995);
