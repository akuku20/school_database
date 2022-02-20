CREATE PROCEDURE AddGrade (@StudentID int, @TeacherID int, @GradeLesson nvarchar(20), @Grade float, @Date date, @Type nvarchar(50)) 
AS 
INSERT INTO Grades
VALUES(@StudentID, @TeacherID, @GradeLesson, @Grade, @Date, @Type)
GO