-- CREATE TABLE [dbo].[constant_one]
-- (
--   [ID] TINYINT IDENTITY (1, 1) NOT NULL,
--   [Name] VARCHAR (50) NOT NULL,
--   [mgenCreated] DATETIME2 (2) NOT NULL,
--   [mgenCreatedBy] INT NOT NULL,
--   [mgenLastUpdated] DATETIME2 (2) NULL,
--   [mgenLastUpdatedBy] INT NULL
-- );

-- CREATE TABLE [dbo].[constant_two]
-- (
--   [ID] TINYINT IDENTITY (1, 1) NOT NULL,
--   [Name] VARCHAR (50) NOT NULL,
--   [mgenCreated] DATETIME2 (2) NOT NULL,
--   [mgenCreatedBy] INT NOT NULL,
--   [mgenLastUpdated] DATETIME2 (2) NULL,
--   [mgenLastUpdatedBy] INT NULL
-- );

DELETE FROM constant_one
GO
DBCC CHECKIDENT (constant_one, RESEED, 0)
GO

SET IDENTITY_INSERT [dbo].[constant_one] ON
INSERT INTO [dbo].[constant_one]
  ([ID]
  ,[Name]
  ,[mgenCreated]
  ,[mgenCreatedBy]
  ,[mgenLastUpdated]
  ,[mgenLastUpdatedBy])
VALUES
  (1, N'One', GETDATE(), 1, GETDATE(), 1),
  (2, N'Two', GETDATE(), 1, GETDATE(), 1),
  (3, N'Three', GETDATE(), 1, GETDATE(), 1),
  (4, N'Four', GETDATE(), 1, GETDATE(), 1)
SET IDENTITY_INSERT [dbo].[constant_one] OFF

DELETE FROM constant_two
GO
DBCC CHECKIDENT (constant_two, RESEED, 0)
GO

SET IDENTITY_INSERT [dbo].[constant_two] ON
INSERT INTO [dbo].[constant_two]
  ([ID]
  ,[Name]
  ,[mgenCreated]
  ,[mgenCreatedBy]
  ,[mgenLastUpdated]
  ,[mgenLastUpdatedBy])
VALUES
  (1, N'Ten', GETDATE(), 1, GETDATE(), 1),
  (2, N'Twenty', GETDATE(), 1, GETDATE(), 1),
  (3, N'Thirty', GETDATE(), 1, GETDATE(), 1),
  (4, N'Fourty', GETDATE(), 1, GETDATE(), 1)
SET IDENTITY_INSERT [dbo].[constant_two] OFF
