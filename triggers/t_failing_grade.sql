
CREATE TRIGGER FailingGrade ON Grades
AFTER INSERT
AS
	SELECT * FROM INSERTED
	DECLARE @TempStudentID int = (SELECT TOP 1 StudentID FROM INSERTED)
	DECLARE @FirstName nvarchar(50) = (SELECT FirstName FROM Students WHERE StudentID = @TempStudentID)
	DECLARE @LastName nvarchar(50) = (SELECT LastName FROM Students WHERE StudentID = @TempStudentID)
	DECLARE @TempTeacherID nvarchar(50) = (SELECT TOP 1 TeacherID FROM INSERTED)
	DECLARE @TempLessonName nvarchar(50) = (SELECT TOP 1 GradeLesson FROM INSERTED)
	IF (SELECT AVG(Grade) FROM Grades WHERE StudentId = @TempStudentID AND GradeLesson = @TempLessonName) < 2.0
	BEGIN
		PRINT('Uczniowi ' + @FirstName + ' ' + @LastName + ' (id studenta ' + CAST(@TempStudentID AS NVARCHAR(5)) + ') grozi zagrożenie z przedmiotu ' + @TempLessonName + '!')
	END

EXEC AddGrade 50, 22, 'Język angielski', 1, '2020-05-17', 'kartkowka'