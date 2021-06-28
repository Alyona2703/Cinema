
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/28/2021 11:03:02
-- Generated from EDMX file: C:\Users\Admin\Source\Repos\Cinema\CinemaModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CinemaDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[CinemaModelStoreContainer].[Hall]', 'U') IS NOT NULL
    DROP TABLE [CinemaModelStoreContainer].[Hall];
GO
IF OBJECT_ID(N'[CinemaModelStoreContainer].[MovieShow]', 'U') IS NOT NULL
    DROP TABLE [CinemaModelStoreContainer].[MovieShow];
GO
IF OBJECT_ID(N'[CinemaModelStoreContainer].[Place]', 'U') IS NOT NULL
    DROP TABLE [CinemaModelStoreContainer].[Place];
GO
IF OBJECT_ID(N'[CinemaModelStoreContainer].[Status]', 'U') IS NOT NULL
    DROP TABLE [CinemaModelStoreContainer].[Status];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hall'
CREATE TABLE [dbo].[Hall] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NameHall] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'MovieShow'
CREATE TABLE [dbo].[MovieShow] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NameMovie] nvarchar(50)  NOT NULL,
    [DateShow] datetime  NOT NULL
);
GO

-- Creating table 'Place'
CREATE TABLE [dbo].[Place] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Hall] int  NOT NULL,
    [MovieShowId] int  NOT NULL,
    [StatusId] int  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NameStatus] nvarchar(30)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Hall'
ALTER TABLE [dbo].[Hall]
ADD CONSTRAINT [PK_Hall]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MovieShow'
ALTER TABLE [dbo].[MovieShow]
ADD CONSTRAINT [PK_MovieShow]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Place'
ALTER TABLE [dbo].[Place]
ADD CONSTRAINT [PK_Place]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Hall] in table 'Place'
ALTER TABLE [dbo].[Place]
ADD CONSTRAINT [FK_HallPlace]
    FOREIGN KEY ([Hall])
    REFERENCES [dbo].[Hall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HallPlace'
CREATE INDEX [IX_FK_HallPlace]
ON [dbo].[Place]
    ([Hall]);
GO

-- Creating foreign key on [MovieShowId] in table 'Place'
ALTER TABLE [dbo].[Place]
ADD CONSTRAINT [FK_MovieShowPlace]
    FOREIGN KEY ([MovieShowId])
    REFERENCES [dbo].[MovieShow]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MovieShowPlace'
CREATE INDEX [IX_FK_MovieShowPlace]
ON [dbo].[Place]
    ([MovieShowId]);
GO

-- Creating foreign key on [StatusId] in table 'Place'
ALTER TABLE [dbo].[Place]
ADD CONSTRAINT [FK_StatusPlace]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusPlace'
CREATE INDEX [IX_FK_StatusPlace]
ON [dbo].[Place]
    ([StatusId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------