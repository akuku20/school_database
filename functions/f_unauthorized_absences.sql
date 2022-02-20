
CREATE FUNCTION UnauthorizedAbsences (@StudentID int) 
RETURNS @LessonsTable TABLE (
	Date DATE NOT NULL
)
AS 
BEGIN
	INSERT INTO @LessonsTable 
		SELECT A.Date
		FROM Absences A
		WHERE A.StudentId = @StudentID AND A.Status = N'N'
	RETURN
END
GO

SELECT * FROM UnauthorizedAbsences(22)