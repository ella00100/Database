-- -----------------------------------------------------
-- Table 'inha'.'building'
-- -----------------------------------------------------

CREATE TABLE Building (
    Bid INT NOT NULL,
    Bname VARCHAR(20) NOT NULL,
    PRIMARY KEY (Bid),
    UNIQUE INDEX Name_UNIQUE (Bname ASC) VISIBLE)

-- -----------------------------------------------------
-- Table 'inha'.'department'
-- -----------------------------------------------------
CREATE TABLE Department (
    Did INT NOT NULL,
    Dname VARCHAR(45) NOT NULL,
    Demail VARCHAR(30) NULL DEFAULT NULL,
    DphoneNumber INT NULL DEFAULT NULL,
    PRIMARY KEY (Did),
    UNIQUE INDEX Dname_UNIQUE (Dname ASC) VISIBLE)

-- -----------------------------------------------------
-- Table 'inha'.'room'
-- -----------------------------------------------------
CREATE TABLE Room (
  Rid INT NOT NULL,
  Bname VARCHAR(20) NOT NULL,
  Mgr_Dname VARCHAR(45) NULL DEFAULT NULL,
  RName VARCHAR(20) NOT NULL,
  Capacity INT NULL DEFAULT NULL,
  PRIMARY KEY (Rid, Bname),
  UNIQUE INDEX Room_Name_UNIQUE (RName ASC) VISIBLE,
  INDEX fk_building_name_idx (Bname ASC) VISIBLE,
  INDEX fk_dept_name_room_idx (Mgr_Dname ASC) VISIBLE,
  CONSTRAINT fk_building_name
    FOREIGN KEY (Bname)
    REFERENCES inha.building (Bname)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_dept_name_room
    FOREIGN KEY (Mgr_Dname)
    REFERENCES inha.department (Dname)
)
-- -----------------------------------------------------
-- Table 'inha'.'club'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS inha.club (
  ClubId INT NOT NULL,
  ClubName VARCHAR(45) NOT NULL,
  PRIMARY KEY (ClubId),
  UNIQUE INDEX ClubName_UNIQUE (ClubName ASC) VISIBLE)

-- -----------------------------------------------------
-- Table 'inha'.'student'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS inha.student (
  Sid INT NOT NULL,
  Major VARCHAR(40) NULL DEFAULT NULL,
  ClubName VARCHAR(45) NULL,
  SName VARCHAR(20) NOT NULL,
  Semail VARCHAR(30) NULL DEFAULT NULL,
  SphoneNumber INT NULL DEFAULT NULL,
  PRIMARY KEY (Sid),
  INDEX fk_major (Major ASC) VISIBLE,
  INDEX fk_club_idx (ClubName ASC) VISIBLE,
  CONSTRAINT fk_major
    FOREIGN KEY (Major)
    REFERENCES inha.department (Dname)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_club
    FOREIGN KEY (ClubName)
    REFERENCES inha.club (ClubName)
)

-- -----------------------------------------------------
-- Table 'inha'.'Employee'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS inha.Employee (
  Eid INT NOT NULL,
  Dname VARCHAR(45) NOT NULL,
  Ename VARCHAR(45) NOT NULL,
  Position VARCHAR(45) NOT NULL,
  PRIMARY KEY (Eid),
  INDEX fk_department_idx (Dname ASC) VISIBLE,
  CONSTRAINT fk_department
    FOREIGN KEY (Dname)
    REFERENCES inha.department (Dname)
)

-- -----------------------------------------------------
-- Table 'inha'.'class'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS inha.class (
  ClassId INT NOT NULL,
  ProfessorId INT NOT NULL,
  ClassName VARCHAR(45) NOT NULL,
  NumberOfParticipants INT NULL,
  Rname VARCHAR(20) NULL,
  PRIMARY KEY (ClassId),
  INDEX fk_employee_id_idx (ProfessorId ASC) VISIBLE,
  INDEX fk_room_name_idx (Rname ASC) VISIBLE,
  CONSTRAINT fk_employee_id
    FOREIGN KEY (ProfessorId)
    REFERENCES inha.Employee (Eid),
  CONSTRAINT fk_room_name
    FOREIGN KEY (Rname)
    REFERENCES inha.room (RName)
)
