CREATE TABLE [constant_one]
(
  [ID] TINYINT IDENTITY (1, 1) NOT NULL,
  [Name] VARCHAR (50) NOT NULL,
  [mgenCreated] DATETIME2 (2) NOT NULL,
  [mgenCreatedBy] INT NOT NULL,
  [mgenLastUpdated] DATETIME2 (2) NULL,
  [mgenLastUpdatedBy] INT NULL
);

CREATE TABLE [constant_two]
(
  [ID] TINYINT IDENTITY (1, 1) NOT NULL,
  [Name] VARCHAR (50) NOT NULL,
  [mgenCreated] DATETIME2 (2) NOT NULL,
  [mgenCreatedBy] INT NOT NULL,
  [mgenLastUpdated] DATETIME2 (2) NULL,
  [mgenLastUpdatedBy] INT NULL
);

INSERT INTO [constant_one]
  ([ID]
  ,[Name]
  ,[mgenCreated]
  ,[mgenCreatedBy]
  ,[mgenLastUpdated]
  ,[mgenLastUpdatedBy])
VALUES
  (1, 'One', date('now'), 1, date('now'), 1),
  (2, 'Two', date('now'), 1, date('now'), 1),
  (3, 'Three', date('now'), 1, date('now'), 1),
  (4, 'Four', date('now'), 1, date('now'), 1)

INSERT INTO [constant_two]
  ([ID]
  ,[Name]
  ,[mgenCreated]
  ,[mgenCreatedBy]
  ,[mgenLastUpdated]
  ,[mgenLastUpdatedBy])
VALUES
  (1, 'Te', date('now'), 1, date('now'), 1),
  (2, 'Twenty', date('now'), 1, date('now'), 1),
  (3, 'Thirty', date('now'), 1, date('now'), 1),
  (4, 'Fourty', date('now'), 1, date('now'), 1)
