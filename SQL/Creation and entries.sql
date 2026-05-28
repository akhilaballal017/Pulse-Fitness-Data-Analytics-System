CREATE DATABASE Pulse_fitness;
USE Pulse_fitness;

CREATE TABLE Membership_plan (
	Membership_id INT PRIMARY KEY,
	Plan_type varchar(50) NOT NULL,
	access_previlege varchar(100),
	price DECIMAL(8,2) NOT NULL,
	access_hour varchar(100),
	class_limit INT
);

CREATE TABLE Member (
	Member_id INT PRIMARY KEY,
    Name varchar(100) NOT NULL,
    DOB date,
    Phone_no Varchar(15),
    Email varchar(15) unique,
    Membership_stsrt_date date,
    Membership_id int NOT NULL,
    foreign key (Membership_id) references Membership_plan(Membership_id)
);

ALTER TABLE Member
MODIFY Email VARCHAR(50) UNIQUE;


CREATE TABLE Trainer (
	Trainer_ID int PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Hourly_rate DECIMAL(8,2),
    specilization varchar(100)
);

CREATE TABLE Fitness_class (
	class_id INT PRIMARY KEY,
    NAME varchar(100) NOT NULL,
    duration int,
    capacity int
);

CREATE TABLE Class_schedule (
	schedule_id int PRIMARY KEY,
    class_id int NOT NULL,
    Trainer_ID int NOT NULL,
    Date date NOT NULL,
    Time time NOT NULL,
    FOREIGN KEY (class_id) references Fitness_class(class_id),
    Foreign key (Trainer_ID) references Trainer( Trainer_ID)
); 

CREATE TABLE PT_session (
	session_id int PRIMARY KEY,
    Member_id int NOT NULL,
    Trainer_ID int NOT NULL,
    Date date NOT NULL,
    Time time NOT NULL,
    FOREIGN KEY (Member_id) references Member(Member_id),
    foreign key (Trainer_ID) references Trainer( Trainer_ID)
); 


Insert into Membership_plan VALUES
(1, 'Basic','Limited accsess to equipment',30.00, '8am-6pm', 2),
(2, 'Premium', 'Full facility access + PT sessions', 70.00, '24/7', Null),
(3, 'Student', 'Discounted access during off-peak', 25.00, '10am-4pm', 3);

INSERT INTO Member VALUES
(101, "Farah Malik", '2002-05-05', '6655443322', 'farah@gmail.com', '2025-04-06', 3),
(102, "John Smith", '1998-12-10', '7788990011', 'john@gmail.com', '2025-03-15', 2),
(103, "Sara Khan", '2000-08-22', '5566778899', 'sara@gmail.com', '2025-04-01', 1),
(104, 'Bob Lee', '1990-07-22', '9876543210', 'bob@gmail.com', '2025-04-02', 2),
(105, 'Chloe Park', '2001-01-10', '1122334455', 'chloe@gmail.com', '2025-04-03', 3),
(106, 'Daniel Kumar', '1988-05-18', '9988776655', 'danel@gmail.com', '2025-04-04', 2),
(107, 'Emily Chen', '1998-12-04', '7766554433', 'emily@gmail.com', '2025-04-05', 1),
(108, 'Ivan Tan', '1997-11-11', '3344556677', 'ivan@gmail.com', '2025-04-09', 3),
(109, 'George King', '1993-09-20', '8899001122', 'george@gmail.com', '2025-04-07', 1),
(110, 'Hannah Osei', '1996-06-17', '7778889990', 'hannah@gmail.com', '2025-04-08', 2);

INSERT INTO Trainer values
(201, 'Sunita rai', 35.00, 'Yoga'),
(202, 'Tom Brooks', 45.00, 'CrossFit'),
(203, 'Sasha Khan', 38.00, 'Zumba'),
(204, 'Ethan Brown', 50.00, 'Strength Training'),
(205, 'Maya Das', 42.00, 'HIIT'),
(206, 'Neel Roy', 44.00, 'Cardio'),
(207, 'Olivia Hart', 39.00, 'Pilates'),
(208, 'Peter Wu', 41.00, 'Stretching'),
(209, 'Queenie Yao', 43.00, 'Spin'),
(210, 'Rahul Mehra', 46.00, 'Functional Training');

INSERT INTO Fitness_class values
(301, 'Yoga', 60, 20),
(302, 'CrossFit', 45, 15),
(303, 'Zumba', 50, 25),
(304, 'HIIT', 30, 20),
(305, 'Pilates', 60, 18),
(306, 'Spin', 45, 15),
(307, 'Cardio Burn', 40, 22),
(308, 'Strength Circuit', 50, 20),
(309, 'Stretch Therapy', 30, 12),
(310, 'Functional Fit', 60, 16);

INSERT INTO Class_schedule VALUES
(401, 301, 201, '2025-04-29', '08:00:00'),
(402, 302, 202, '2025-04-29', '09:00:00'),
(403, 303, 203, '2025-04-30', '10:00:00'),
(404, 304, 205, '2025-04-30', '11:00:00'),
(405, 305, 207, '2025-04-30', '12:00:00'),
(406, 306, 209, '2025-05-01', '13:00:00'),
(407, 307, 206, '2025-05-01', '14:00:00'),
(408, 308, 204, '2025-05-01', '15:00:00'),
(409, 309, 208, '2025-05-02', '16:00:00'),
(410, 310, 210, '2025-05-02', '17:00:00');

INSERT INTO PT_session VALUES
(501, 102, 202, '2025-04-25', '14:00:00'),
(502, 104, 204, '2025-04-26', '13:00:00'),
(503, 108, 205, '2025-04-27', '12:30:00'),
(504, 110, 206, '2025-04-28', '12:00:00'),
(505, 102, 201, '2025-04-29', '11:30:00'),
(506, 104, 204, '2025-04-30', '10:30:00'),
(507, 110, 210, '2025-05-01', '09:00:00'),
(508, 108, 209, '2025-05-01', '15:00:00'),
(509, 102, 202, '2025-05-02', '16:00:00'),
(510, 109, 208, '2025-05-03', '17:00:00');












	


