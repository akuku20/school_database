CREATE PROCEDURE AddExtraLessons (@LessonName nvarchar(50), @Day nvarchar(9), @LessonStart time(7), @LessonEnd time(7), @LessonTeacher int, @Classroom int)
AS
INSERT INTO ExtraLessons
VALUES (@LessonName, @Day, @LessonStart, @LessonEnd, @LessonTeacher, @Classroom)
GO
