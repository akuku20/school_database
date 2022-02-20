
CREATE VIEW TeachersAndTheirSubjects AS
SELECT T.TeacherID, T.FirstName, T.LastName, L.LessonName, 'No' IsExtra FROM Teachers T 
JOIN Lessons L 
ON T.TeacherID = L.LessonTeacher
UNION
SELECT T.TeacherID, T.FirstName, T.LastName, EL.LessonName, 'Yes' IsExtra FROM Teachers T 
JOIN ExtraLessons EL 
ON T.TeacherID = EL.LessonTeacher
GO

SELECT * FROM TeachersAndTheirSubjects
