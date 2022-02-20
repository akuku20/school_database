CREATE TRIGGER FifthNote
ON Notes
AFTER INSERT
AS
    IF(SELECT count(*) FROM Notes WHERE StudentId = (SELECT StudentId FROM inserted)) = 5
        BEGIN
            PRINT('Uczen dostal piata uwage.')
        END
GO

