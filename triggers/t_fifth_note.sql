CREATE TRIGGER fifth_note
ON Notes
AFTER INSERT
AS
    IF(SELECT count(*) FROM Notes WHERE StudentId = (SELECT StudentId FROM inserted)) = 5
        BEGIN
            PRINT('Uczen dostal piata uwage.')
        END
GO

INSERT INTO Notes VALUES (1,4,'05-05-2020','jedzenie na lekcji')
INSERT INTO Notes VALUES (2,4,'05-05-2020','picie na lekcji')
INSERT INTO Notes VALUES (1,4,'05-05-2020','spanie na lekcji')
INSERT INTO Notes VALUES (1,4,'05-05-2020','rozmawianie na lekcji')
INSERT INTO Notes VALUES (1,4,'05-05-2020','rzucanie w nauczyciela papierkami na lekcji')