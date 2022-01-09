﻿/*
Deployment script for StudentskiCentar

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "StudentskiCentar"
:setvar DefaultFilePrefix "StudentskiCentar"
:setvar DefaultDataPath "C:\Users\neman\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb"
:setvar DefaultLogPath "C:\Users\neman\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[menza]...';


GO
CREATE TABLE [dbo].[menza] (
    [id_menza]                   INT          NOT NULL,
    [ime]                        VARCHAR (25) NULL,
    [br_mesta]                   INT          NULL,
    [stud_centar_id_stud_centar] INT          NOT NULL,
    CONSTRAINT [menza_pk] PRIMARY KEY CLUSTERED ([id_menza] ASC)
);


GO
PRINT N'Creating [dbo].[popravlja]...';


GO
CREATE TABLE [dbo].[popravlja] (
    [domar_id_radnik]     INT       NOT NULL,
    [prijavljuje_id_soba] INT       NOT NULL,
    [prijavljuje_jmbg]    CHAR (13) NOT NULL,
    [prijavljuje_id_kvar] INT       NOT NULL,
    CONSTRAINT [popravlja_pk] PRIMARY KEY CLUSTERED ([domar_id_radnik] ASC, [prijavljuje_id_soba] ASC, [prijavljuje_jmbg] ASC, [prijavljuje_id_kvar] ASC)
);


GO
PRINT N'Creating [dbo].[prijavljuje]...';


GO
CREATE TABLE [dbo].[prijavljuje] (
    [stanuje_soba_id_soba] INT       NOT NULL,
    [stanuje_student_jmbg] CHAR (13) NOT NULL,
    [kvar_id_kvar]         INT       NOT NULL,
    CONSTRAINT [prijavljuje_pk] PRIMARY KEY CLUSTERED ([stanuje_soba_id_soba] ASC, [stanuje_student_jmbg] ASC, [kvar_id_kvar] ASC)
);


GO
PRINT N'Creating [dbo].[radnik]...';


GO
CREATE TABLE [dbo].[radnik] (
    [ime]                        VARCHAR (25) NULL,
    [prezime]                    VARCHAR (25) NULL,
    [god_staza]                  INT          NULL,
    [id_radnik]                  INT          NOT NULL,
    [stud_centar_id_stud_centar] INT          NOT NULL,
    CONSTRAINT [radnik_pk] PRIMARY KEY CLUSTERED ([id_radnik] ASC)
);


GO
PRINT N'Creating [dbo].[soba]...';


GO
CREATE TABLE [dbo].[soba] (
    [id_soba]              INT NOT NULL,
    [broj]                 INT NULL,
    [stud_dom_id_stud_dom] INT NOT NULL,
    CONSTRAINT [soba_pk] PRIMARY KEY CLUSTERED ([id_soba] ASC)
);


GO
PRINT N'Creating [dbo].[sprema]...';


GO
CREATE TABLE [dbo].[sprema] (
    [spremacica_id_radnik] INT NOT NULL,
    [menza_id_menza]       INT NOT NULL,
    CONSTRAINT [sprema_pk] PRIMARY KEY CLUSTERED ([spremacica_id_radnik] ASC, [menza_id_menza] ASC)
);


GO
PRINT N'Creating [dbo].[spremacica]...';


GO
CREATE TABLE [dbo].[spremacica] (
    [sanitarna_licenca] CHAR (1) NULL,
    [id_radnik]         INT      NOT NULL,
    CONSTRAINT [spremacica_pk] PRIMARY KEY CLUSTERED ([id_radnik] ASC)
);


GO
PRINT N'Creating [dbo].[stanuje]...';


GO
CREATE TABLE [dbo].[stanuje] (
    [soba_id_soba] INT       NOT NULL,
    [student_jmbg] CHAR (13) NOT NULL,
    CONSTRAINT [stanuje_pk] PRIMARY KEY CLUSTERED ([soba_id_soba] ASC, [student_jmbg] ASC)
);


GO
PRINT N'Creating [dbo].[stud_centar]...';


GO
CREATE TABLE [dbo].[stud_centar] (
    [id_stud_centar] INT          NOT NULL,
    [ime]            VARCHAR (25) NULL,
    [grad]           VARCHAR (25) NULL,
    CONSTRAINT [stud_centar_pk] PRIMARY KEY CLUSTERED ([id_stud_centar] ASC)
);


GO
PRINT N'Creating [dbo].[stud_dom]...';


GO
CREATE TABLE [dbo].[stud_dom] (
    [id_stud_dom]                INT          NOT NULL,
    [ime]                        VARCHAR (25) NULL,
    [br_soba]                    INT          NULL,
    [stud_centar_id_stud_centar] INT          NOT NULL,
    CONSTRAINT [stud_dom_pk] PRIMARY KEY CLUSTERED ([id_stud_dom] ASC)
);


GO
PRINT N'Creating [dbo].[student]...';


GO
CREATE TABLE [dbo].[student] (
    [jmbg]    CHAR (13)    NOT NULL,
    [ime]     VARCHAR (25) NULL,
    [prezime] VARCHAR (25) NULL,
    CONSTRAINT [student_pk] PRIMARY KEY CLUSTERED ([jmbg] ASC)
);


GO
PRINT N'Creating [dbo].[kvar_pk]...';


GO
ALTER TABLE [dbo].[kvar]
    ADD CONSTRAINT [kvar_pk] PRIMARY KEY CLUSTERED ([id_kvar] ASC);


GO
PRINT N'Creating [dbo].[menza_stud_centar_fk]...';


GO
ALTER TABLE [dbo].[menza] WITH NOCHECK
    ADD CONSTRAINT [menza_stud_centar_fk] FOREIGN KEY ([stud_centar_id_stud_centar]) REFERENCES [dbo].[stud_centar] ([id_stud_centar]);


GO
PRINT N'Creating [dbo].[popravlja_domar_fk]...';


GO
ALTER TABLE [dbo].[popravlja] WITH NOCHECK
    ADD CONSTRAINT [popravlja_domar_fk] FOREIGN KEY ([domar_id_radnik]) REFERENCES [dbo].[domar] ([id_radnik]);


GO
PRINT N'Creating [dbo].[popravlja_prijavljuje_fk]...';


GO
ALTER TABLE [dbo].[popravlja] WITH NOCHECK
    ADD CONSTRAINT [popravlja_prijavljuje_fk] FOREIGN KEY ([prijavljuje_id_soba], [prijavljuje_jmbg], [prijavljuje_id_kvar]) REFERENCES [dbo].[prijavljuje] ([stanuje_soba_id_soba], [stanuje_student_jmbg], [kvar_id_kvar]);


GO
PRINT N'Creating [dbo].[prijavljuje_kvar_fk]...';


GO
ALTER TABLE [dbo].[prijavljuje] WITH NOCHECK
    ADD CONSTRAINT [prijavljuje_kvar_fk] FOREIGN KEY ([kvar_id_kvar]) REFERENCES [dbo].[kvar] ([id_kvar]);


GO
PRINT N'Creating [dbo].[prijavljuje_stanuje_fk]...';


GO
ALTER TABLE [dbo].[prijavljuje] WITH NOCHECK
    ADD CONSTRAINT [prijavljuje_stanuje_fk] FOREIGN KEY ([stanuje_soba_id_soba], [stanuje_student_jmbg]) REFERENCES [dbo].[stanuje] ([soba_id_soba], [student_jmbg]);


GO
PRINT N'Creating [dbo].[radnik_stud_centar_fk]...';


GO
ALTER TABLE [dbo].[radnik] WITH NOCHECK
    ADD CONSTRAINT [radnik_stud_centar_fk] FOREIGN KEY ([stud_centar_id_stud_centar]) REFERENCES [dbo].[stud_centar] ([id_stud_centar]);


GO
PRINT N'Creating [dbo].[soba_stud_dom_fk]...';


GO
ALTER TABLE [dbo].[soba] WITH NOCHECK
    ADD CONSTRAINT [soba_stud_dom_fk] FOREIGN KEY ([stud_dom_id_stud_dom]) REFERENCES [dbo].[stud_dom] ([id_stud_dom]);


GO
PRINT N'Creating [dbo].[sprema_menza_fk]...';


GO
ALTER TABLE [dbo].[sprema] WITH NOCHECK
    ADD CONSTRAINT [sprema_menza_fk] FOREIGN KEY ([menza_id_menza]) REFERENCES [dbo].[menza] ([id_menza]);


GO
PRINT N'Creating [dbo].[sprema_spremacica_fk]...';


GO
ALTER TABLE [dbo].[sprema] WITH NOCHECK
    ADD CONSTRAINT [sprema_spremacica_fk] FOREIGN KEY ([spremacica_id_radnik]) REFERENCES [dbo].[spremacica] ([id_radnik]);


GO
PRINT N'Creating [dbo].[spremacica_radnik_fk]...';


GO
ALTER TABLE [dbo].[spremacica] WITH NOCHECK
    ADD CONSTRAINT [spremacica_radnik_fk] FOREIGN KEY ([id_radnik]) REFERENCES [dbo].[radnik] ([id_radnik]);


GO
PRINT N'Creating [dbo].[stanuje_soba_fk]...';


GO
ALTER TABLE [dbo].[stanuje] WITH NOCHECK
    ADD CONSTRAINT [stanuje_soba_fk] FOREIGN KEY ([soba_id_soba]) REFERENCES [dbo].[soba] ([id_soba]);


GO
PRINT N'Creating [dbo].[stanuje_student_fk]...';


GO
ALTER TABLE [dbo].[stanuje] WITH NOCHECK
    ADD CONSTRAINT [stanuje_student_fk] FOREIGN KEY ([student_jmbg]) REFERENCES [dbo].[student] ([jmbg]);


GO
PRINT N'Creating [dbo].[stud_dom_stud_centar_fk]...';


GO
ALTER TABLE [dbo].[stud_dom] WITH NOCHECK
    ADD CONSTRAINT [stud_dom_stud_centar_fk] FOREIGN KEY ([stud_centar_id_stud_centar]) REFERENCES [dbo].[stud_centar] ([id_stud_centar]);


GO
PRINT N'Creating [dbo].[domar_radnik_fk]...';


GO
ALTER TABLE [dbo].[domar] WITH NOCHECK
    ADD CONSTRAINT [domar_radnik_fk] FOREIGN KEY ([id_radnik]) REFERENCES [dbo].[radnik] ([id_radnik]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[menza] WITH CHECK CHECK CONSTRAINT [menza_stud_centar_fk];

ALTER TABLE [dbo].[popravlja] WITH CHECK CHECK CONSTRAINT [popravlja_domar_fk];

ALTER TABLE [dbo].[popravlja] WITH CHECK CHECK CONSTRAINT [popravlja_prijavljuje_fk];

ALTER TABLE [dbo].[prijavljuje] WITH CHECK CHECK CONSTRAINT [prijavljuje_kvar_fk];

ALTER TABLE [dbo].[prijavljuje] WITH CHECK CHECK CONSTRAINT [prijavljuje_stanuje_fk];

ALTER TABLE [dbo].[radnik] WITH CHECK CHECK CONSTRAINT [radnik_stud_centar_fk];

ALTER TABLE [dbo].[soba] WITH CHECK CHECK CONSTRAINT [soba_stud_dom_fk];

ALTER TABLE [dbo].[sprema] WITH CHECK CHECK CONSTRAINT [sprema_menza_fk];

ALTER TABLE [dbo].[sprema] WITH CHECK CHECK CONSTRAINT [sprema_spremacica_fk];

ALTER TABLE [dbo].[spremacica] WITH CHECK CHECK CONSTRAINT [spremacica_radnik_fk];

ALTER TABLE [dbo].[stanuje] WITH CHECK CHECK CONSTRAINT [stanuje_soba_fk];

ALTER TABLE [dbo].[stanuje] WITH CHECK CHECK CONSTRAINT [stanuje_student_fk];

ALTER TABLE [dbo].[stud_dom] WITH CHECK CHECK CONSTRAINT [stud_dom_stud_centar_fk];

ALTER TABLE [dbo].[domar] WITH CHECK CHECK CONSTRAINT [domar_radnik_fk];


GO
PRINT N'Update complete.';


GO
