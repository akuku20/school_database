
CREATE PROCEDURE move_student_to_class @AccountLogin NVARCHAR(50), @Password NVARCHAR(50), @StudentFirstName NVARCHAR(50), @StudentLastName NVARCHAR(50), @ClassLabel NVARCHAR(2)
AS
    IF EXISTS(SELECT TeacherId FROM Teachers T JOIN People A ON T.AccountId = A.AccountId WHERE A.Password = @Password)
    AND EXISTS(SELECT StudentId FROM Students WHERE FirstName = @StudentFirstName AND LastName = @StudentLastName)
    AND EXISTS(SELECT ClassId FROM Classes WHERE ClassLabel = @ClassLabel) 
    BEGIN
        Declare @ClassId INT
        SET @ClassId = (SELECT ClassId FROM Classes WHERE ClassLabel = @ClassLabel)

        IF NOT EXISTS(SELECT StudentId FROM Students WHERE FirstName = @StudentFirstName AND LastName = @StudentLastName AND ClassId = @ClassID)
        BEGIN
            BEGIN TRANSACTION
                UPDATE Students
                SET ClassId = @ClassId
                WHERE FirstName = @StudentFirstName AND LastName = @StudentLastName
            COMMIT TRANSACTION
        END
        ELSE BEGIN
            PRINT N'Uczen jest juz w tej klasie.'
        END
    END
    ELSE BEGIN
        PRINT N'Nieprawidlowe dane';
    END


SELECT * FROM Students
EXEC move_student_to_class 1,'E7Po]Y','Godfryd','Gudel','1B'