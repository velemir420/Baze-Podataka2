
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/03/2022 17:02:55
-- Generated from EDMX file: C:\Users\velemir\Downloads\Nikola Velemir PR52-2017\Template BP2\UserInterface\Model\StudentskiCentarModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [StudentskiCentar];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_domar_radnik_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[domars] DROP CONSTRAINT [FK_domar_radnik_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_menza_stud_centar_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[menzas] DROP CONSTRAINT [FK_menza_stud_centar_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_popravlja_domar]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[popravlja] DROP CONSTRAINT [FK_popravlja_domar];
GO
IF OBJECT_ID(N'[dbo].[FK_popravlja_prijavljuje]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[popravlja] DROP CONSTRAINT [FK_popravlja_prijavljuje];
GO
IF OBJECT_ID(N'[dbo].[FK_prijavljuje_kvar_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[prijavljujes] DROP CONSTRAINT [FK_prijavljuje_kvar_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_prijavljuje_stanuje_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[prijavljujes] DROP CONSTRAINT [FK_prijavljuje_stanuje_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_radnik_stud_centar_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[radniks] DROP CONSTRAINT [FK_radnik_stud_centar_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_soba_stud_dom_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[sobas] DROP CONSTRAINT [FK_soba_stud_dom_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_sprema_menza]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[sprema] DROP CONSTRAINT [FK_sprema_menza];
GO
IF OBJECT_ID(N'[dbo].[FK_sprema_spremacica]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[sprema] DROP CONSTRAINT [FK_sprema_spremacica];
GO
IF OBJECT_ID(N'[dbo].[FK_spremacica_radnik_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[spremacicas] DROP CONSTRAINT [FK_spremacica_radnik_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_stanuje_soba_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[stanujes] DROP CONSTRAINT [FK_stanuje_soba_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_stanuje_student_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[stanujes] DROP CONSTRAINT [FK_stanuje_student_fk];
GO
IF OBJECT_ID(N'[dbo].[FK_stud_dom_stud_centar_fk]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[stud_dom] DROP CONSTRAINT [FK_stud_dom_stud_centar_fk];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[domars]', 'U') IS NOT NULL
    DROP TABLE [dbo].[domars];
GO
IF OBJECT_ID(N'[dbo].[kvars]', 'U') IS NOT NULL
    DROP TABLE [dbo].[kvars];
GO
IF OBJECT_ID(N'[dbo].[menzas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[menzas];
GO
IF OBJECT_ID(N'[dbo].[popravlja]', 'U') IS NOT NULL
    DROP TABLE [dbo].[popravlja];
GO
IF OBJECT_ID(N'[dbo].[prijavljujes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[prijavljujes];
GO
IF OBJECT_ID(N'[dbo].[radniks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[radniks];
GO
IF OBJECT_ID(N'[dbo].[sobas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sobas];
GO
IF OBJECT_ID(N'[dbo].[sprema]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sprema];
GO
IF OBJECT_ID(N'[dbo].[spremacicas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[spremacicas];
GO
IF OBJECT_ID(N'[dbo].[stanujes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[stanujes];
GO
IF OBJECT_ID(N'[dbo].[stud_centar]', 'U') IS NOT NULL
    DROP TABLE [dbo].[stud_centar];
GO
IF OBJECT_ID(N'[dbo].[stud_dom]', 'U') IS NOT NULL
    DROP TABLE [dbo].[stud_dom];
GO
IF OBJECT_ID(N'[dbo].[students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[students];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'domars'
CREATE TABLE [dbo].[domars] (
    [licenca] char(1)  NULL,
    [id_radnik] int  NOT NULL
);
GO

-- Creating table 'kvars'
CREATE TABLE [dbo].[kvars] (
    [id_kvar] int  NOT NULL,
    [opis] varchar(250)  NULL
);
GO

-- Creating table 'menzas'
CREATE TABLE [dbo].[menzas] (
    [id_menza] int  NOT NULL,
    [ime] varchar(25)  NULL,
    [br_mesta] int  NULL,
    [stud_centar_id_stud_centar] int  NOT NULL
);
GO

-- Creating table 'prijavljujes'
CREATE TABLE [dbo].[prijavljujes] (
    [stanuje_soba_id_soba] int  NOT NULL,
    [stanuje_student_jmbg] char(13)  NOT NULL,
    [kvar_id_kvar] int  NOT NULL
);
GO

-- Creating table 'radniks'
CREATE TABLE [dbo].[radniks] (
    [ime] varchar(25)  NULL,
    [prezime] varchar(25)  NULL,
    [god_staza] int  NULL,
    [id_radnik] int  NOT NULL,
    [stud_centar_id_stud_centar] int  NOT NULL
);
GO

-- Creating table 'sobas'
CREATE TABLE [dbo].[sobas] (
    [id_soba] int  NOT NULL,
    [broj] int  NULL,
    [stud_dom_id_stud_dom] int  NOT NULL
);
GO

-- Creating table 'spremacicas'
CREATE TABLE [dbo].[spremacicas] (
    [sanitarna_licenca] char(1)  NULL,
    [id_radnik] int  NOT NULL
);
GO

-- Creating table 'stanujes'
CREATE TABLE [dbo].[stanujes] (
    [soba_id_soba] int  NOT NULL,
    [student_jmbg] char(13)  NOT NULL
);
GO

-- Creating table 'stud_centar'
CREATE TABLE [dbo].[stud_centar] (
    [id_stud_centar] int  NOT NULL,
    [ime] varchar(25)  NULL,
    [grad] varchar(25)  NULL
);
GO

-- Creating table 'stud_dom'
CREATE TABLE [dbo].[stud_dom] (
    [id_stud_dom] int  NOT NULL,
    [ime] varchar(25)  NULL,
    [br_soba] int  NULL,
    [stud_centar_id_stud_centar] int  NOT NULL
);
GO

-- Creating table 'students'
CREATE TABLE [dbo].[students] (
    [jmbg] char(13)  NOT NULL,
    [ime] varchar(25)  NULL,
    [prezime] varchar(25)  NULL
);
GO

-- Creating table 'popravlja'
CREATE TABLE [dbo].[popravlja] (
    [domars_id_radnik] int  NOT NULL,
    [prijavljujes_stanuje_soba_id_soba] int  NOT NULL,
    [prijavljujes_stanuje_student_jmbg] char(13)  NOT NULL,
    [prijavljujes_kvar_id_kvar] int  NOT NULL
);
GO

-- Creating table 'sprema'
CREATE TABLE [dbo].[sprema] (
    [menzas_id_menza] int  NOT NULL,
    [spremacicas_id_radnik] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id_radnik] in table 'domars'
ALTER TABLE [dbo].[domars]
ADD CONSTRAINT [PK_domars]
    PRIMARY KEY CLUSTERED ([id_radnik] ASC);
GO

-- Creating primary key on [id_kvar] in table 'kvars'
ALTER TABLE [dbo].[kvars]
ADD CONSTRAINT [PK_kvars]
    PRIMARY KEY CLUSTERED ([id_kvar] ASC);
GO

-- Creating primary key on [id_menza] in table 'menzas'
ALTER TABLE [dbo].[menzas]
ADD CONSTRAINT [PK_menzas]
    PRIMARY KEY CLUSTERED ([id_menza] ASC);
GO

-- Creating primary key on [stanuje_soba_id_soba], [stanuje_student_jmbg], [kvar_id_kvar] in table 'prijavljujes'
ALTER TABLE [dbo].[prijavljujes]
ADD CONSTRAINT [PK_prijavljujes]
    PRIMARY KEY CLUSTERED ([stanuje_soba_id_soba], [stanuje_student_jmbg], [kvar_id_kvar] ASC);
GO

-- Creating primary key on [id_radnik] in table 'radniks'
ALTER TABLE [dbo].[radniks]
ADD CONSTRAINT [PK_radniks]
    PRIMARY KEY CLUSTERED ([id_radnik] ASC);
GO

-- Creating primary key on [id_soba] in table 'sobas'
ALTER TABLE [dbo].[sobas]
ADD CONSTRAINT [PK_sobas]
    PRIMARY KEY CLUSTERED ([id_soba] ASC);
GO

-- Creating primary key on [id_radnik] in table 'spremacicas'
ALTER TABLE [dbo].[spremacicas]
ADD CONSTRAINT [PK_spremacicas]
    PRIMARY KEY CLUSTERED ([id_radnik] ASC);
GO

-- Creating primary key on [soba_id_soba], [student_jmbg] in table 'stanujes'
ALTER TABLE [dbo].[stanujes]
ADD CONSTRAINT [PK_stanujes]
    PRIMARY KEY CLUSTERED ([soba_id_soba], [student_jmbg] ASC);
GO

-- Creating primary key on [id_stud_centar] in table 'stud_centar'
ALTER TABLE [dbo].[stud_centar]
ADD CONSTRAINT [PK_stud_centar]
    PRIMARY KEY CLUSTERED ([id_stud_centar] ASC);
GO

-- Creating primary key on [id_stud_dom] in table 'stud_dom'
ALTER TABLE [dbo].[stud_dom]
ADD CONSTRAINT [PK_stud_dom]
    PRIMARY KEY CLUSTERED ([id_stud_dom] ASC);
GO

-- Creating primary key on [jmbg] in table 'students'
ALTER TABLE [dbo].[students]
ADD CONSTRAINT [PK_students]
    PRIMARY KEY CLUSTERED ([jmbg] ASC);
GO

-- Creating primary key on [domars_id_radnik], [prijavljujes_stanuje_soba_id_soba], [prijavljujes_stanuje_student_jmbg], [prijavljujes_kvar_id_kvar] in table 'popravlja'
ALTER TABLE [dbo].[popravlja]
ADD CONSTRAINT [PK_popravlja]
    PRIMARY KEY CLUSTERED ([domars_id_radnik], [prijavljujes_stanuje_soba_id_soba], [prijavljujes_stanuje_student_jmbg], [prijavljujes_kvar_id_kvar] ASC);
GO

-- Creating primary key on [menzas_id_menza], [spremacicas_id_radnik] in table 'sprema'
ALTER TABLE [dbo].[sprema]
ADD CONSTRAINT [PK_sprema]
    PRIMARY KEY CLUSTERED ([menzas_id_menza], [spremacicas_id_radnik] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [id_radnik] in table 'domars'
ALTER TABLE [dbo].[domars]
ADD CONSTRAINT [FK_domar_radnik_fk]
    FOREIGN KEY ([id_radnik])
    REFERENCES [dbo].[radniks]
        ([id_radnik])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [kvar_id_kvar] in table 'prijavljujes'
ALTER TABLE [dbo].[prijavljujes]
ADD CONSTRAINT [FK_prijavljuje_kvar_fk]
    FOREIGN KEY ([kvar_id_kvar])
    REFERENCES [dbo].[kvars]
        ([id_kvar])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_prijavljuje_kvar_fk'
CREATE INDEX [IX_FK_prijavljuje_kvar_fk]
ON [dbo].[prijavljujes]
    ([kvar_id_kvar]);
GO

-- Creating foreign key on [stud_centar_id_stud_centar] in table 'menzas'
ALTER TABLE [dbo].[menzas]
ADD CONSTRAINT [FK_menza_stud_centar_fk]
    FOREIGN KEY ([stud_centar_id_stud_centar])
    REFERENCES [dbo].[stud_centar]
        ([id_stud_centar])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_menza_stud_centar_fk'
CREATE INDEX [IX_FK_menza_stud_centar_fk]
ON [dbo].[menzas]
    ([stud_centar_id_stud_centar]);
GO

-- Creating foreign key on [stanuje_soba_id_soba], [stanuje_student_jmbg] in table 'prijavljujes'
ALTER TABLE [dbo].[prijavljujes]
ADD CONSTRAINT [FK_prijavljuje_stanuje_fk]
    FOREIGN KEY ([stanuje_soba_id_soba], [stanuje_student_jmbg])
    REFERENCES [dbo].[stanujes]
        ([soba_id_soba], [student_jmbg])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [stud_centar_id_stud_centar] in table 'radniks'
ALTER TABLE [dbo].[radniks]
ADD CONSTRAINT [FK_radnik_stud_centar_fk]
    FOREIGN KEY ([stud_centar_id_stud_centar])
    REFERENCES [dbo].[stud_centar]
        ([id_stud_centar])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_radnik_stud_centar_fk'
CREATE INDEX [IX_FK_radnik_stud_centar_fk]
ON [dbo].[radniks]
    ([stud_centar_id_stud_centar]);
GO

-- Creating foreign key on [id_radnik] in table 'spremacicas'
ALTER TABLE [dbo].[spremacicas]
ADD CONSTRAINT [FK_spremacica_radnik_fk]
    FOREIGN KEY ([id_radnik])
    REFERENCES [dbo].[radniks]
        ([id_radnik])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [stud_dom_id_stud_dom] in table 'sobas'
ALTER TABLE [dbo].[sobas]
ADD CONSTRAINT [FK_soba_stud_dom_fk]
    FOREIGN KEY ([stud_dom_id_stud_dom])
    REFERENCES [dbo].[stud_dom]
        ([id_stud_dom])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_soba_stud_dom_fk'
CREATE INDEX [IX_FK_soba_stud_dom_fk]
ON [dbo].[sobas]
    ([stud_dom_id_stud_dom]);
GO

-- Creating foreign key on [soba_id_soba] in table 'stanujes'
ALTER TABLE [dbo].[stanujes]
ADD CONSTRAINT [FK_stanuje_soba_fk]
    FOREIGN KEY ([soba_id_soba])
    REFERENCES [dbo].[sobas]
        ([id_soba])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [student_jmbg] in table 'stanujes'
ALTER TABLE [dbo].[stanujes]
ADD CONSTRAINT [FK_stanuje_student_fk]
    FOREIGN KEY ([student_jmbg])
    REFERENCES [dbo].[students]
        ([jmbg])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_stanuje_student_fk'
CREATE INDEX [IX_FK_stanuje_student_fk]
ON [dbo].[stanujes]
    ([student_jmbg]);
GO

-- Creating foreign key on [stud_centar_id_stud_centar] in table 'stud_dom'
ALTER TABLE [dbo].[stud_dom]
ADD CONSTRAINT [FK_stud_dom_stud_centar_fk]
    FOREIGN KEY ([stud_centar_id_stud_centar])
    REFERENCES [dbo].[stud_centar]
        ([id_stud_centar])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_stud_dom_stud_centar_fk'
CREATE INDEX [IX_FK_stud_dom_stud_centar_fk]
ON [dbo].[stud_dom]
    ([stud_centar_id_stud_centar]);
GO

-- Creating foreign key on [domars_id_radnik] in table 'popravlja'
ALTER TABLE [dbo].[popravlja]
ADD CONSTRAINT [FK_popravlja_domar]
    FOREIGN KEY ([domars_id_radnik])
    REFERENCES [dbo].[domars]
        ([id_radnik])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [prijavljujes_stanuje_soba_id_soba], [prijavljujes_stanuje_student_jmbg], [prijavljujes_kvar_id_kvar] in table 'popravlja'
ALTER TABLE [dbo].[popravlja]
ADD CONSTRAINT [FK_popravlja_prijavljuje]
    FOREIGN KEY ([prijavljujes_stanuje_soba_id_soba], [prijavljujes_stanuje_student_jmbg], [prijavljujes_kvar_id_kvar])
    REFERENCES [dbo].[prijavljujes]
        ([stanuje_soba_id_soba], [stanuje_student_jmbg], [kvar_id_kvar])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_popravlja_prijavljuje'
CREATE INDEX [IX_FK_popravlja_prijavljuje]
ON [dbo].[popravlja]
    ([prijavljujes_stanuje_soba_id_soba], [prijavljujes_stanuje_student_jmbg], [prijavljujes_kvar_id_kvar]);
GO

-- Creating foreign key on [menzas_id_menza] in table 'sprema'
ALTER TABLE [dbo].[sprema]
ADD CONSTRAINT [FK_sprema_menza]
    FOREIGN KEY ([menzas_id_menza])
    REFERENCES [dbo].[menzas]
        ([id_menza])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [spremacicas_id_radnik] in table 'sprema'
ALTER TABLE [dbo].[sprema]
ADD CONSTRAINT [FK_sprema_spremacica]
    FOREIGN KEY ([spremacicas_id_radnik])
    REFERENCES [dbo].[spremacicas]
        ([id_radnik])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_sprema_spremacica'
CREATE INDEX [IX_FK_sprema_spremacica]
ON [dbo].[sprema]
    ([spremacicas_id_radnik]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------