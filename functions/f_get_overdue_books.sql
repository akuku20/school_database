CREATE FUNCTION get_overdue_books (
    @StudentId INT
)
RETURNS TABLE
AS
RETURN
    SELECT S.FirstName, S.LastName, B.TakenDate, Books.Title
    FROM Students S
    JOIN Borrows B 
    ON S.StudentId = B.StudentId
    JOIN Books 
    ON B.BookId = Books.BookId
    WHERE @StudentId = S.StudentId AND B.ReturnDate IS NULL
GO

SELECT * FROM get_overdue_books(4)