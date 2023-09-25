CREATE TABLE Building (
  Bid INT(8) NOT NULL,
  Bname VARCHAR(20) NOT NULL,
  PRIMARY KEY (Bid),
  UNIQUE INDEX Name_UNIQUE (Bname ASC) VISIBLE
);

CREATE TABLE Department (
  Did INT(8) NOT NULL,
  Dname VARCHAR(40) NOT NULL,
  Demail VARCHAR(30) NULL,
  DphoneNumber INT(11) NULL,
  PRIMARY KEY (Did),
  UNIQUE INDEX Dname_UNIQUE (Dname ASC) VISIBLE
);

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

CREATE TABLE Student (
  Sid INT(8) NOT NULL,
  Major VARCHAR(40),
  SName VARCHAR(20) NOT NULL,
  Semail VARCHAR(30) NULL,
  SphoneNumber INT(11) NULL,
  PRIMARY KEY (Sid),
  CONSTRAINT fk_major
    FOREIGN KEY (Major)
    REFERENCES Department (Dname)
    ON DELETE SET NULL
    ON UPDATE CASCADE
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
INSERT INTO Department VALUES(35462114, "International Trade", "pqalllm@inha.com", 01079152348);

INSERT INTO Room VALUES(11112222, "Building 1", "Mechanical Engineering", "Room 303", 100);
INSERT INTO Room VALUES(11112223, "Building 2", "Management", "Lounge", 20);
INSERT INTO Room VALUES(11112224, "Building 3", "InC Engineering", "Auditorium", 200);
INSERT INTO Room VALUES(11112225, "Building 4", "Electrical Engineering", "Room 103", 50);
INSERT INTO Room VALUES(11112226, "Building 4", "Electrical Engineering", "Room 208", 30);

INSERT INTO Student VALUES(12192261, "Management", "Yoon Seo Young", "yoon8720@nate.com", 01075799717);
INSERT INTO Student VALUES(12171512, "Electrical Engineering", "Kim Ye Ji", "ejh470@nate.com", 01075799717);
INSERT INTO Student VALUES(12184523, "Mechanical Engineering", "Kim Ye Eun", "ywmdls447@nate.com", 01075799717);
INSERT INTO Student VALUES(12197822, "InC Engineering", "Ha Sung Min", "shandog7@nate.com", 01075799717);
INSERT INTO Student VALUES(12208756, "InC Engineering", "Chae Seo In", "andoewl1@nate.com", 01075799717);
