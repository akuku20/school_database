CREATE TRIGGER overdue_borrow 
ON Borrows
AFTER INSERT, UPDATE 
AS 
    IF(SELECT DATEDIFF(day, ReturnDate, TakenDate) FROM INSERTED) > 30
        BEGIN
            INSERT INTO Notes VALUES
                (0,(SELECT StudentId FROM INSERTED),
                GETDATE(), 'Uczen nie oddal ksiazki w terminie')
        END
GO

SELECT * FROM Borrows
