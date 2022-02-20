DROP VIEW FailingGradeStudents

CREATE VIEW FailingGradeStudents AS
SELECT S.StudentID, S.ClassID, AVG(G.Grade) GradeAverage FROM Students S 
JOIN Grades G 
ON S.StudentID = G.StudentID
GROUP BY S.StudentID, S.ClassID
HAVING AVG(G.Grade) < 2.0
GO

SELECT * FROM FailingGradeStudents
