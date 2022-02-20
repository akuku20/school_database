DROP VIEW [Students Details] 

CREATE VIEW [Students Details] AS
SELECT S.StudentId, S.FirstName, S.LastName, S.ClassId, SD.BirthDate,SD.Gender,SD.PhoneNumber,SD.Pesel FROM Students S
JOIN StudentsDetails SD
ON S.AccountId = SD.AccountId
GO

SELECT * FROM [Students Details]