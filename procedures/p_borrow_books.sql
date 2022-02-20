CREATE PROCEDURE BorrowBook @AccountId int, @Password nvarchar(30), @Title nvarchar(30)
AS
    IF EXISTS(SELECT AccountId FROM People WHERE AccountId = @AccountId AND Password = @Password) BEGIN
            BEGIN TRANSACTION
                IF (SELECT Amount FROM Books WHERE Title = @Title) > 0 BEGIN
                    INSERT INTO Borrows VALUES
                        ((SELECT StudentId FROM Students S JOIN People A ON S.AccountId = A.AccountId WHERE A.AccountId = @AccountId),
                        (SELECT BookId FROM Books WHERE Title = @Title),
                        GETDATE(),
						NULL)
                    UPDATE Books
                        SET Amount = (SELECT Amount FROM Books WHERE Title = @Title) - 1
                        WHERE Title = @Title
                    END
                ELSE PRINT N'Nie wystarczająca liczba książek w bibliotece o podanym tytule';
            COMMIT TRANSACTION
    END
    ELSE BEGIN
            PRINT N'Nie ma użytkownika o takim haśle/loginie';
END;

EXEC borrow_book 31,'oTD-RbU','Dziady III'
SELECT * FROM Borrows


SELECT * FROM People
SELECT * FROM Students