DROP VIEW [Students Average Grade] 

CREATE VIEW [Students Average Grade] AS
SELECT S.FirstName, S.LastName, Round(AVG(Grade),2) AS [Average grade] FROM Students S
LEFT JOIN Grades G
ON S.StudentId = G.StudentId
GROUP BY S.FirstName, S.LastName
GO

SELECT * FROM [Students Average Grade]