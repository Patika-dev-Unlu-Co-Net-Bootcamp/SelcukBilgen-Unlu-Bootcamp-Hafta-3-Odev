CREATE TRIGGER calculate_percentage ON Attendances
AFTER INSERT AS
BEGIN
    -- Değiştirilen inserted tablosundan gelen veriler
    DECLARE @userId INT,@courseId TINYINT
    SELECT @userId=UserId, @courseId=CourseId
    FROM inserted

    -- değeri oku
    -- SELECT [Percent] FROM SuccessSituations WHERE UserId=@userId AND CourseId=@courseId

    -- Kurs tablosundan gelen veriler
    DECLARE @weekTotal INT
    SELECT @weekTotal=HowManyWeeks
    FROM Courses
    WHERE Id=@courseId

    --Yoklama Tablosundan gelen veriler
    DECLARE @statusCount INT, @continuity DECIMAL(5,2)
    SELECT @statusCount=COUNT(*)
    FROM Attendances
    WHERE [Status] = 1 AND UserId=@userId AND CourseId=@courseId
    SELECT @continuity = (CONVERT(DECIMAL(5,2),@statusCount) / CONVERT(DECIMAL(5,2),@weekTotal))*100.00
    
    -- Trigger Update ifadesi

    UPDATE SuccessSituations
    SET [Percent] = @continuity WHERE UserId=@userId AND CourseId=@courseId
END

