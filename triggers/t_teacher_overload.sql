CREATE TRIGGER TeacherOverloaded
ON Lessons
AFTER INSERT 
AS 
    IF(SELECT COUNT(*) FROM Lessons WHERE LessonTeacher = (SELECT LessonTeacher FROM INSERTED)) >= 10
    BEGIN 
        PRINT('Nauczyciel ma zbyt duzo godzin pracujacych.')
    END
GO

INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '09:00:00', '09:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '10:00:00', '10:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '11:00:00', '11:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '12:00:00', '12:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '13:00:00', '13:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '14:00:00', '14:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '09:00:00', '09:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '09:00:00', '09:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '09:00:00', '09:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '09:00:00', '09:45:00', 1, 1, 20)
INSERT INTO Lessons VALUES ('Geografia', 'Poniedziałek', '09:00:00', '09:45:00', 1, 1, 20)
SELECT * FROM Lessons;