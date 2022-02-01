-- Create a new stored procedure called 'spEnroll' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'spEnroll'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.spEnroll
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.spEnroll

    -- add more stored procedure parameters here
    @userId INT,
    @courseId INT

AS
BEGIN

    -- body of the stored procedure
    -- Variables
    DECLARE @startingDate DATE, @endingDate DATE

    -- kullanıcının daha önce katıldığı kursun başlangıç ve bitiş tarihi.
    SELECT @startingDate = StartingDate,@endingDate = EndDate
    FROM Courses c
        INNER JOIN UserCourses uc ON c.Id = uc.CourseId
        INNER JOIN Users u ON uc.UserId=u.Id
    WHERE u.Id=@userId

    IF (@startingDate BETWEEN (SELECT StartingDate
    FROM Courses
    WHERE Id=@courseId) AND
        (SELECT EndDate
    FROM Courses
    WHERE Id=@courseId))
        BEGIN
        RAISERROR('the user is already enrolled in another course within the date range',1,1)
    END
    ELSE
    BEGIN
        INSERT INTO UserCourses
        VALUES
            (@userId, @courseId)
    END
END
GO

-- example to execute the stored procedure we just created
--EXECUTE dbo.spEnroll 1 /*value_for_param1*/, 2 /*value_for_param2*/
--GO