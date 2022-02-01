-- eğitim bazlı öğrencileri listeleyin(gruplu olarak)


CREATE VIEW studentsByCourse
AS
    SELECT u.FirstName, u.LastName, oC.Name AS [Claim Name], c.Name AS[Course Name]
    FROM UserCourses uC
        JOIN Users u on uC.UserId=u.Id
        JOIN Courses c on u.Id=c.Id
        JOIN UserOperationClaims uOC ON u.Id=uOC.UserId
        JOIN OperationClaims oC ON uOC.OperationClaimId=oC.Id

-- view'ı çağırma
 -- select * FROM studentsByCourse