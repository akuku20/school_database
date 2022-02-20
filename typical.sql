SELECT * FROM Students

SELECT * FROM Books WHERE Amount > 0

SELECT * FROM ExamResults E 
JOIN Students S ON E.StudentId = S.StudentId
WHERE Grade = 1

SELECT * FROM Teachers WHERE EXISTS(SELECT * FROM CLASSES WHERE HeadTeacherId = TeacherId)

SELECT ClassLabel, FirstName, LastName FROM Students S
JOIN Classes C ON C.ClassLabel = S.ClassId
ORDER BY ClassLabel

SELECT * FROM Exams
