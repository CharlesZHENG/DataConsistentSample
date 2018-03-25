﻿USE [master]
GO
/****** Object:  Database [OrderDB]    Script Date: 2018/3/25 8:55:46 ******/
CREATE DATABASE [OrderDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderDB', FILENAME = N'D:\Data\OrderDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderDB_log', FILENAME = N'D:\Data\OrderDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OrderDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrderDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrderDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderDB] SET RECOVERY FULL 
GO
ALTER DATABASE [OrderDB] SET  MULTI_USER 
GO
ALTER DATABASE [OrderDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrderDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OrderDB', N'ON'
GO
ALTER DATABASE [OrderDB] SET QUERY_STORE = OFF
GO
USE [OrderDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OrderDB]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 2018/3/25 8:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](50) NULL,
	[OrderID] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[ShipStatus] [int] NULL,
	[StorageStatus] [int] NULL,
	[EntityJson] [text] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2018/3/25 8:55:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [nvarchar](50) NULL,
	[OrderTime] [datetime] NULL,
	[OrderUserID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_Status]  DEFAULT ((1)) FOR [ShipStatus]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_StorageStatus]  DEFAULT ((1)) FOR [StorageStatus]
GO
USE [master]
GO
ALTER DATABASE [OrderDB] SET  READ_WRITE 
GO
