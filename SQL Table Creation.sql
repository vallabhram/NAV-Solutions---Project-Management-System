CREATE DATABASE SoftwareProjectsManagement;
use SoftwareProjectsManagement;

CREATE TABLE Client
(
  ClientID VARCHAR(20) NOT NULL,
  BusinessName VARCHAR(75) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Email VARCHAR(75) NOT NULL,
  ContactFName VARCHAR(75) NOT NULL,
  ContactLName VARCHAR(75) NOT NULL,
  PRIMARY KEY (ClientID)
);

CREATE TABLE Developer
(
  DeveloperID VARCHAR(20) NOT NULL,
  DeveloperFName VARCHAR(75) NOT NULL,
  HourlyRate NUMERIC NOT NULL,
  Speciality VARCHAR(75) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Email VARCHAR(75) NOT NULL,
  AverageRating DECIMAL(3,1) NOT NULL,
  DeveloperLName VARCHAR(75) NOT NULL,
  PRIMARY KEY (DeveloperID)
);

CREATE TABLE ProjectStatus
(
  StatusID VARCHAR(20) NOT NULL,
  Status VARCHAR(75) NOT NULL,
  PRIMARY KEY (StatusID)
);

CREATE TABLE Project
(
  ProjectID VARCHAR(20) NOT NULL,
  ProjectName VARCHAR(75) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  PaymentAmount NUMERIC NOT NULL,
  PaymentFrequency VARCHAR(75) NOT NULL,
  Description VARCHAR(275) NOT NULL,
  Platform_Or_Enviornment VARCHAR(75) NOT NULL,
  ClientID VARCHAR(20) NOT NULL,
  StatusID VARCHAR(20) NOT NULL,
  PRIMARY KEY (ProjectID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
  FOREIGN KEY (StatusID) REFERENCES ProjectStatus(StatusID)
);

CREATE TABLE Task
(
  TaskID VARCHAR(20) NOT NULL,
  TaskName VARCHAR(75) NOT NULL,
  StartDate DATE NOT NULL,
  HoursWorked DECIMAL(3,1) NOT NULL,
  DateAssigned DATE NOT NULL,
  EndDate DATE NOT NULL,
  EstimatedHours DECIMAL(3,1) NOT NULL,
  ProjectID VARCHAR(20) NOT NULL,
  DeveloperID VARCHAR(20) NOT NULL,
  PRIMARY KEY (TaskID),
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
  FOREIGN KEY (DeveloperID) REFERENCES Developer(DeveloperID)
);

CREATE TABLE PaymentDetails
(
  PaymentID VARCHAR(20) NOT NULL,
  AmountReceived NUMERIC NOT NULL,
  DateReceived DATE NOT NULL,
  PaymentMethod VARCHAR(75) NOT NULL,
  ProjectID VARCHAR(20) NOT NULL,
  PRIMARY KEY (PaymentID),
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);
