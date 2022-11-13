USE [master]
GO
/****** Object:  Database [Book_Assessment]    Script Date: 12-11-2022 18:28:00 ******/
CREATE DATABASE [Book_Assessment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Book_Assessment', FILENAME = N'D:\MSSQL2017\Data\Book_Assessment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Book_Assessment_log', FILENAME = N'D:\MSSQL2017\Log\Book_Assessment_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Book_Assessment] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book_Assessment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book_Assessment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book_Assessment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book_Assessment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book_Assessment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book_Assessment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book_Assessment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Book_Assessment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book_Assessment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book_Assessment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book_Assessment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book_Assessment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book_Assessment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book_Assessment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book_Assessment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book_Assessment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Book_Assessment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book_Assessment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book_Assessment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book_Assessment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book_Assessment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book_Assessment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Book_Assessment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book_Assessment] SET RECOVERY FULL 
GO
ALTER DATABASE [Book_Assessment] SET  MULTI_USER 
GO
ALTER DATABASE [Book_Assessment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book_Assessment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book_Assessment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book_Assessment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Book_Assessment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Book_Assessment] SET QUERY_STORE = OFF
GO
USE [Book_Assessment]
GO
/****** Object:  User [NT SERVICE\SQLSERVERAGENT]    Script Date: 12-11-2022 18:28:02 ******/
CREATE USER [NT SERVICE\SQLSERVERAGENT] FOR LOGIN [NT SERVICE\SQLSERVERAGENT] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[BookDetails]    Script Date: 12-11-2022 18:28:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Publisher] [varchar](250) NULL,
	[Title] [varchar](250) NULL,
	[AuthorLastName] [varchar](250) NULL,
	[AuthorFirstName] [varchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookDetails] ON 
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (1, N'Balaji', N'Book Assessment', N'Balaji', N'SS', CAST(105 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (2, N'AMadhan', N'Home Assessment', N'Mahendran', N'Madhan', CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (3, N'Balaji', N'Book Assessment', N'Ashok', N'Kumar', CAST(150 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (4, N'Book Assessment', N'Balaji', N'SS', N'105', CAST(145 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (5, N'Home Assessment', N'Mahendran', N'Madhan', N'120', CAST(145 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (6, N'Book Assessment', N'Ashok', N'Kumar', N'150', CAST(145 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (7, N'CBalaji', N'Book Assessment', N'Balaji', N'SS', CAST(105 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (8, N'DAMadhan', N'Home Assessment', N'Mahendran', N'Madhan', CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[BookDetails] ([ID], [Publisher], [Title], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (9, N'EBalaji', N'Book Assessment', N'Ashok', N'Kumar', CAST(150 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[BookDetails] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookDetails]    Script Date: 12-11-2022 18:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetBookDetails]      
(  
@Type varchar(50) = ''  
)  
AS    
BEGIN    
BEGIN TRY   
	  IF(@Type = 'PUBLISHER')
	  BEGIN
		SELECT * FROM BookDetails ORDER BY Publisher,AuthorLastName + ','+AuthorFirstName,Title
	  END
	  ELSE IF(@Type = 'AUTHOR')
	  BEGIN
		SELECT * FROM BookDetails ORDER BY AuthorLastName + ','+AuthorFirstName,Title
	  END
	  ELSE IF(@Type = 'PRICE')
	  BEGIN
		SELECT SUM(PRICE) AS TotalPrice FROM BookDetails
	  END	  
END TRY  
BEGIN CATCH    
	SELECT '' AS Result    
END CATCH   
END
GO
USE [master]
GO
ALTER DATABASE [Book_Assessment] SET  READ_WRITE 
GO
