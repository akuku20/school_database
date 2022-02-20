
CREATE FUNCTION LessonsPlan (@ClassID int, @Day nvarchar(12)) 
RETURNS @LessonsTable TABLE (
	ClassID int, 
	LessonID int,
	LessonName nvarchar(50),
	LessonStart time(0),
	LessonEnd time(0),
	TeacherFirstName nvarchar(50),
	TeacherLastName nvarchar(50)
) 
AS 
BEGIN
	INSERT INTO @LessonsTable
		SELECT C.ClassID, L.LessonID, L.LessonName, L.LessonStart, L.LessonEnd, T.FirstName, T.LastName
		FROM Classes C 
		JOIN Lessons L 
		ON C.ClassID = L.LessonClass
		JOIN Teachers T
		ON L.LessonTeacher = T.TeacherID
		WHERE C.ClassId = @ClassID AND L.LessonDay = @Day
	RETURN
END
GO