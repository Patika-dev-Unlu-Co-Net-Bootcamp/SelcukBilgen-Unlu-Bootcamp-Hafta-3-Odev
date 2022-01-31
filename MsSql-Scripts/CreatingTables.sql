-- Create a new table called '[Users]' in schema '[dbo.PatikaDev]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Users]', 'U') IS NOT NULL
DROP TABLE [dbo].[Users]
GO
-- Create the table in the specified schema
CREATE TABLE [Users]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    -- Primary Key column
    [Email] VARCHAR(50) UNIQUE NOT NULL,
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [Password] VARCHAR(10) NOT NULL,
    [Status] BIT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[OperationClaim]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[OperationClaims]', 'U') IS NOT NULL
DROP TABLE [dbo].[OperationClaims]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[OperationClaims]
(
    [Id] TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    -- Primary Key column
    [Name] NVARCHAR(50) UNIQUE NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[UserOperationClaim]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserOperationClaims]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserOperationClaims]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserOperationClaims]
(
    [Id] TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    -- Primary Key column
    [UserId] INT NOT NULL FOREIGN KEY REFERENCES Users(Id),
    [OperationClaimId] TINYINT NOT NULL FOREIGN KEY REFERENCES OperationClaims(Id)
    -- Specify more columns here
);
GO

-- Create a new table called '[Courses]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Courses]', 'U') IS NOT NULL
DROP TABLE [dbo].[Courses]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Courses]
(
    [Id] TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    -- Primary Key column
    [Name] NVARCHAR(60) NOT NULL,
    [Description] NVARCHAR(100),
    [HowManyweeks] TINYINT,
    [StartingDate] DATE,
    [EndDate] DATE,

    -- Specify more columns here
);
GO

-- Create a new table called '[UserCourses]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[UserCourses]', 'U') IS NOT NULL
DROP TABLE [dbo].[UserCourses]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[UserCourses]
(
    [Id] TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    -- Primary Key column
    [UserId] INT NOT NULL FOREIGN KEY REFERENCES Users(Id),
    [CourseId] TINYINT NOT NULL FOREIGN KEY REFERENCES Courses(Id)
    -- Specify more columns here
);
GO

-- Create a new table called '[SuccessSituations]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[SuccessSituations]', 'U') IS NOT NULL
DROP TABLE [dbo].[SuccessSituations]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[SuccessSituations]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    -- Primary Key column
    [UserId] INT NOT NULL,
    [CourseId] TINYINT NOT NULL,
    [Percent] DECIMAL(5,2) NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[Attendances]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Attendances]', 'U') IS NOT NULL
DROP TABLE [dbo].[Attendances]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Attendances]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    -- Primary Key column
    [UserId] INT NOT NULL FOREIGN KEY REFERENCES Users(Id),
    [CourseId] TINYINT NOT NULL FOREIGN KEY REFERENCES Courses(Id),
    [EducationDay] DATE,
    [Status] BIT NOT NULL
    -- Specify more columns here
);
GO

