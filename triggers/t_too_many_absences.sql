DROP TRIGGER TooManyAbsences
CREATE TRIGGER TooManyAbsences ON Absences
AFTER INSERT
AS
	SELECT * FROM INSERTED
	DECLARE @TempStudentID int = (SELECT StudentID FROM INSERTED)
	DECLARE @FirstName nvarchar(50) = (SELECT FirstName FROM Students WHERE StudentID = @TempStudentID)
	DECLARE @LastName nvarchar(50) = (SELECT LastName FROM Students WHERE StudentID = @TempStudentID)
	IF (SELECT COUNT(*) FROM Absences A WHERE A.StudentId = @TempStudentID AND A.Status = N'N') >= 5
	BEGIN
		PRINT('Uczen ' + @FirstName + ' ' + @LastName + ' (id studenta ' + CAST(@TempStudentID AS NVARCHAR(5)) + ') ma 5 lub wiecej nieusprawiedliwionych nieobecnosci!')
	END

EXEC AddAbsence 13, '2020-04-18'
EXEC AddAbsence 13, '2020-04-19'
EXEC AddAbsence 13, '2020-04-20'
EXEC AddAbsence 13, '2020-04-21'
EXEC AddAbsence 13, '2020-04-22'
EXEC AddAbsence 13, '2020-04-23'