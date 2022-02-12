CREATE VIEW [Students Details] AS
SELECT S.StudentId, S.FirstName, S.LastName, S.ClassId, SD.BirthDate,SD.Gender,SD.PhoneNumber,SD.Pesel FROM Students S
JOIN StudentsDetails SD
ON S.AccountId = SD.AccountId
GO

CREATE VIEW [Students Grades] AS
SELECT S.FirstName, S.LastName, Round(AVG(Grade),2) AS [Average grade] FROM Students S
LEFT JOIN Grades G
ON S.StudentId = G.StudentId