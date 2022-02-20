CREATE PROCEDURE ReturnBook @AccountId INT, @Password nvarchar(30), @Title nvarchar(30)
AS
    IF EXISTS(SELECT AccountId FROM People WHERE AccountId = @AccountId AND Password = @Password) BEGIN
            BEGIN TRANSACTION
					UPDATE Borrows
						SET ReturnDate = GETDATE()
                    FROM Borrows B
                        JOIN Books Bo ON Bo.BookId = B.BookId
                        JOIN Students S ON S.StudentId = B.StudentId
                        JOIN People P ON S.AccountId = P.AccountId
                        WHERE Bo.Title = @Title AND P.AccountId = @AccountId AND P.Password = @Password
                    UPDATE Books
                        SET Amount = (SELECT Amount FROM Books WHERE Title = @Title) + 1
                        WHERE Title = @Title
            COMMIT TRANSACTION
    END
    ELSE BEGIN
            PRINT N'No such user';
    END

EXEC return_book 31,'oTD-RbU','Dziady III'
SELECT * FROM Borrows