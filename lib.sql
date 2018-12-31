USE [master]
GO
/****** Object:  Database [LibraryManager]    Script Date: 12/21/2018 10:19:04 PM ******/
CREATE DATABASE [LibraryManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LibraryManager.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LibraryManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryManager] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManager] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManager] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManager', N'ON'
GO
USE [LibraryManager]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 12/21/2018 10:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 12/21/2018 10:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] NOT NULL,
	[GenreName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Media]    Script Date: 12/21/2018 10:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[AuthorID] [int] NULL,
	[Release] [date] NULL,
	[GenreID] [int] NULL,
	[SubGenreID] [int] NULL,
	[PublisherID] [int] NULL,
	[Length] [int] NULL,
	[QtyTotal] [int] NULL,
	[QtyChecked] [int] NULL,
	[ISBN] [nvarchar](13) NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 12/21/2018 10:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubGenre]    Script Date: 12/21/2018 10:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubGenre](
	[SubGenreID] [int] NOT NULL,
	[SubGenre] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubGenre] PRIMARY KEY CLUSTERED 
(
	[SubGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (1, N'J.K.', N'Rowling')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (2, N'J.R.R.', N'Tolkein')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (3, N'Stephen', N'King')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (4, N'Cassandra', N'Clare')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (5, N'Holly', N'Black')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (6, N'Rick', N'Riordan')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (7, N'Stan', N'Lee')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (8, N'Stephanie', N'Meyer')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (1, N'Fiction')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (2, N'NonFiction')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (3, N'Reference')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (4, N'Biography')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (5, N'Childrens')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (101, N'Harry potter and the sorcerers stone', 1, NULL, 1, 5, 1, 300, 5, 3, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (102, N'harry potter and the chamber of secrets', 1, NULL, 1, 5, 1, 320, 5, 4, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (103, N'harry potter and the prisoner of azkaban', 1, NULL, 1, 5, 1, 360, 5, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (104, N'harry potter and the goblet of fire', 1, NULL, 1, 5, 1, 480, 5, 1, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (105, N'harry potter and the order of the phoenix', 1, NULL, 1, 5, 1, 510, 5, 5, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (106, N'harry potter and the half blood prince', 1, NULL, 1, 5, 1, 530, 5, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (107, N'harry potter and the deathly hallows', 1, NULL, 1, 5, 1, 580, 5, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (127, N'encyclopedia britanica ', 7, NULL, 3, 8, 1, 1000000, 1, 0, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (201, N'the hobbit', 2, NULL, 1, 2, 2, 300, 2, 1, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (202, N'lord of the rings : fellowship ', 2, NULL, 1, 2, 2, 325, 2, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (203, N'lord of the rings : two towers', 2, NULL, 1, 2, 2, 335, 2, 0, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (204, N'lord of the rings : return of the king', 2, NULL, 1, 2, 2, 350, 2, 0, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (222, N'twilight', 8, NULL, 2, 10, 3, 400, 4, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (223, N'new moon', 8, NULL, 2, 10, 3, 420, 4, 1, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (224, N'eclipse', 8, NULL, 2, 10, 3, 450, 4, 3, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (225, N'breaking dawn', 8, NULL, 2, 10, 3, 490, 4, 4, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (280, N'city of bones', 4, NULL, 1, 9, 1, 300, 1, 0, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (281, N'city of ashes', 4, NULL, 1, 9, 1, 350, 1, 0, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (282, N'city of glass', 4, NULL, 1, 9, 1, 350, 1, 0, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (345, N'percy jackson the lightening theif', 6, NULL, 5, 2, 3, 200, 3, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (346, N'percy jackson the sea of monsters', 6, NULL, 5, 2, 3, 210, 3, 1, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (347, N'percy jackson the titans curse', 6, NULL, 5, 2, 3, 230, 3, 1, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (348, N'percy jackson the battle of the labyrinth', 6, NULL, 5, 2, 3, 250, 3, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (349, N'percy jackson the last olympian', 6, NULL, 5, 2, 3, 265, 3, 1, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (664, N'the shining', 3, NULL, 4, 4, 2, 321, 3, 2, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (665, N'dreamcatcher', 3, NULL, 4, 4, 2, 358, 2, 1, NULL)
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (666, N'it', 3, NULL, 4, 3, 2, 666, 6, 6, NULL)
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Country]) VALUES (1, N'Scholastic', N'USA')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Country]) VALUES (2, N'Penguin', N'UK')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Country]) VALUES (3, N'Hyperion', N'China')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (1, N'SciFi')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (2, N'Adventure')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (3, N'AutoBiography')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (4, N'Biography')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (5, N'Fantasy')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (6, N'PictureBooks')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (7, N'TextBooks')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (8, N'Encyclopedia')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (9, N'TeenReading')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (10, N'Historical')
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Media] FOREIGN KEY([ID])
REFERENCES [dbo].[Media] ([ID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Media]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_authorID_FK] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_authorID_FK]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_genreID_FK] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_genreID_FK]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_PublisherID_FK] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_PublisherID_FK]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_subgenreID_FK] FOREIGN KEY([SubGenreID])
REFERENCES [dbo].[SubGenre] ([SubGenreID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_subgenreID_FK]
GO
USE [master]
GO
ALTER DATABASE [LibraryManager] SET  READ_WRITE 
GO
