CREATE PROCEDURE JustifyAbsence @AccountId INT, @Password nvarchar(30), @AbsenceId INT
AS
    IF EXISTS(SELECT AccountId FROM People WHERE AccountId = @AccountId AND Password = @Password) BEGIN
        UPDATE Absences
            SET Status = 'U'
        WHERE AbsenceId = @AbsenceId
    END

SELECT * FROM Absences
SELECT * FROM People
EXEC justify_absence 32, 'CIy!@|r%', 7
SELECT * FROM Absences
