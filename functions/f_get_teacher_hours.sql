CREATE FUNCTION get_teacher_hours(
    @TeacherId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @suma1 INT
    DECLARE @suma2 INT
    SELECT @suma1 = COUNT(*) FROM Lessons
    WHERE LessonTeacher = @TeacherId;
    SELECT @suma2 = COUNT(*) FROM ExtraLessons
    WHERE LessonTeacher = @TeacherId;    
    RETURN @suma1 + @suma2
END
GO

PRINT dbo.get_teacher_hours(1);