CREATE TABLE [dbo].[suggestion] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [first]          VARCHAR (50)  NULL,
    [last]           VARCHAR (50)  NULL,
    [phone]          NVARCHAR (50) NULL,
    [hours]          VARCHAR (50)  NULL,
    [email]          VARCHAR (50)  NULL,
    [comment]        TEXT          NULL,
    [suggestionType] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

