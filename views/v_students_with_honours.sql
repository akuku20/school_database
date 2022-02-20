CREATE VIEW DiplomaWithHonoursStudents AS
SELECT S.StudentID, S.FirstName, S.LastName, S.ClassID, AVG(G.Grade) GradeAverage FROM Students S 
JOIN Grades G
ON S.StudentID = G.StudentID
GROUP BY S.StudentID, S.FirstName, S.LastName, S.ClassID
HAVING AVG(G.Grade) >= 4.75
GO

SELECT * FROM DiplomaWithHonoursStudents