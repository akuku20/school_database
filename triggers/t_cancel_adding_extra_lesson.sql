DROP TRIGGER CancelAddingExtraLesson
CREATE TRIGGER CancelAddingExtraLesson ON ExtraLessons
INSTEAD OF INSERT
AS
	DECLARE @Temp int = (SELECT ExtraLessonID FROM INSERTED)
	DECLARE @Temp1 int = @Temp - 1
	DECLARE @LessonName nvarchar(50) = (SELECT LessonName FROM INSERTED)
	DECLARE @LessonClassroom int = (SELECT Classroom FROM INSERTED)
	DECLARE @LessonDay nvarchar(12) = (SELECT LessonDay FROM INSERTED)
	DECLARE @TeacherID int = (SELECT LessonTeacher FROM INSERTED)
	DECLARE @LessonClass int = (SELECT LessonClass FROM INSERTED)
	DECLARE @LessonStart time(0) = (SELECT LessonStart FROM INSERTED)
	DECLARE @LessonEnd time(0) = (SELECT LessonEnd FROM INSERTED)
	DECLARE @TeacherError int = (SELECT COUNT(*) FROM (SELECT * FROM Lessons WHERE LessonTeacher = @TeacherID AND ((LessonStart >= @LessonStart AND LessonEnd <= @LessonEnd))) T)
	DECLARE @TeacherExtraError int = (SELECT COUNT(*) FROM (SELECT * FROM ExtraLessons WHERE LessonTeacher = @TeacherID AND ((LessonStart >= @LessonStart AND LessonEnd <= @LessonEnd))) T)
	DECLARE @ClassError int = (SELECT COUNT(*) FROM (SELECT * FROM Lessons WHERE LessonClass = @LessonClass AND ((LessonStart >= @LessonStart AND LessonEnd <= @LessonEnd))) T)
	DECLARE @ClassExtraError int = (SELECT COUNT(*) FROM (SELECT * FROM ExtraLessons WHERE LessonClass = @LessonClass AND ((LessonStart >= @LessonStart AND LessonEnd <= @LessonEnd))) T)
	IF (@TeacherError + @TeacherExtraError > 0)
	BEGIN
		RAISERROR('Nie powiodło się dopisanie - nauczyciel ma już wtedy lekcje', 16,1)	
	END
	ELSE IF (@ClassError + @ClassExtraError > 0)
	BEGIN
		RAISERROR('Nie powiodło się dopisanie - klasa ma już wtedy lekcje', 16,1)
	END
	ELSE 
	BEGIN
		INSERT INTO ExtraLessons VALUES
		(@LessonName, @LessonDay, @LessonStart, @LessonEnd, @TeacherID, @LessonClass, @LessonClassroom) 
	END
GO

INSERT INTO ExtraLessons VALUES 
('Koło teatralne', 'Wtorek', '13:00:00', '14:30:00', 12, 3, 17)
INSERT INTO ExtraLessons VALUES 
('Koło matematyczne', 'Czwartek', '12:15:00', '13:15:00', 17, 4, 7)
INSERT INTO ExtraLessons VALUES 
('Koło fizyczne', 'Piątek', '11:15:00', '12:00:00', 3, 6, 12)
INSERT INTO ExtraLessons VALUES  
('SKS - Koszykówka', 'Poniedziałek', '14:00:00', '15:30:00', 21, 2, 20)
INSERT INTO ExtraLessons VALUES  
('Koło chemiczne', 'Środa', '12:15:00', '13:15:00', 23, 1, 19)
INSERT INTO ExtraLessons VALUES 
('Koło artystyczne', 'Wtorek', '13:00:00', '15:30:00', 12, 3, 17)
SELECT * FROM ExtraLessons