
CREATE FUNCTION TeachersLessons (@TeacherID int, @Day nvarchar(12)) 
RETURNS @LessonsTable TABLE (
    TeacherID int,
    FirstName nvarchar(50),
    LastName nvarchar(50),
    LessonName nvarchar(50),
    LessonStart time(0), 
    LessonEnd time(0),
    IsExtra nvarchar(3)
) 
AS
BEGIN
    INSERT INTO @LessonsTable 
        SELECT T.TeacherID, T.FirstName, T.LastName, L.LessonName, L.LessonStart, L.LessonEnd, 'Yes'
        FROM Teachers T 
        JOIN Lessons L 
        ON T.TeacherID = L.LessonTeacher
        WHERE T.TeacherID = @TeacherID AND L.LessonDay = @Day
    INSERT INTO @LessonsTable 
        SELECT T.TeacherID, T.FirstName, T.LastName, EL.LessonName, EL.LessonStart, EL.LessonEnd, 'No'
        FROM Teachers T 
        JOIN ExtraLessons EL 
        ON T.TeacherID = EL.LessonTeacher
        WHERE T.TeacherID = @TeacherID AND EL.LessonDay = @Day
    RETURN
END
GO

SELECT * FROM TeachersLessons(2, N'Piatek')
