DROP PROCEDURE AddAbsence
CREATE PROCEDURE AddAbsence (@StudentID int, @Date date)
AS
INSERT INTO Absences 
VALUES (@StudentID, @Date, 'N')
GO

AddAbsence 12,'12-01-2021'
SELECT * FROM Absences