CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE StudentCourse (
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Business Administration'),
(3, 'Engineering');

INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID)
VALUES
(101, 'Faculty of Software Engineering', 1),
(102, 'Faculty of Business', 2),
(103, 'Faculty of Engineering', 3);

INSERT INTO Student (StudentID, StudentName)
VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carol White'),
(4, 'David Lee');

INSERT INTO Course (CourseID, CourseName, FacultyID)
VALUES
(1001, 'Database Management', 101),
(1002, 'Marketing Principles', 102),
(1003, 'Structural Design', 103);

INSERT INTO StudentCourse (StudentID, CourseID)
VALUES
(1, 1001),
(3, 1001),
(2, 1002),
(4, 1003);

SELECT
    s.StudentID,
    s.StudentName,
    c.CourseID,
    c.CourseName
FROM Student s
JOIN StudentCourse sc ON sc.StudentID = s.StudentID
JOIN Course c ON c.CourseID = sc.CourseID
ORDER BY s.StudentID;
