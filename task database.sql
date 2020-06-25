/****** Object:  Database [Technical Task]    Script Date: 6/23/2020 6:46:58 PM ******/
CREATE DATABASE [Technical Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Technical Task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Technical Task.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Technical Task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Technical Task_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Technical Task] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Technical Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Technical Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Technical Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Technical Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Technical Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Technical Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Technical Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Technical Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Technical Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Technical Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Technical Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Technical Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Technical Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Technical Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Technical Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Technical Task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Technical Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Technical Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Technical Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Technical Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Technical Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Technical Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Technical Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Technical Task] SET RECOVERY FULL 
GO
ALTER DATABASE [Technical Task] SET  MULTI_USER 
GO
ALTER DATABASE [Technical Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Technical Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Technical Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Technical Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Technical Task] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Technical Task', N'ON'
GO
ALTER DATABASE [Technical Task] SET QUERY_STORE = OFF
GO
USE [Technical Task]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [Technical Task]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/23/2020 6:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Totalmoney] [decimal](18, 0) NULL,
	[Taxtotal] [decimal](18, 0) NULL,
	[storeId] [int] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 6/23/2020 6:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Item_Name] [nchar](50) NOT NULL,
	[Brand] [nchar](30) NULL,
	[Brice] [decimal](18, 0) NULL,
	[qty] [int] NULL,
	[storeId] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itemsinvoice]    Script Date: 6/23/2020 6:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itemsinvoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[itemId] [int] NULL,
	[InvoiceId] [int] NULL,
 CONSTRAINT [PK_Itemsinvoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/23/2020 6:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (1, CAST(N'2020-12-03' AS Date), CAST(1000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (2, CAST(N'0001-01-01' AS Date), CAST(538 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (3, CAST(N'0001-01-01' AS Date), CAST(885 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (4, CAST(N'0001-01-01' AS Date), CAST(1467 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (5, CAST(N'0001-01-01' AS Date), CAST(2724 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (6, CAST(N'0001-01-01' AS Date), CAST(192 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (7, CAST(N'0001-01-01' AS Date), CAST(9000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (8, CAST(N'0001-01-01' AS Date), CAST(1552 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 6)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (9, CAST(N'0001-01-01' AS Date), CAST(6720 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (10, CAST(N'0001-01-01' AS Date), CAST(11095 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (11, CAST(N'0001-01-01' AS Date), CAST(3624 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), 5)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (12, CAST(N'0001-01-01' AS Date), CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (13, CAST(N'0001-01-01' AS Date), CAST(1503 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), 1)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (14, CAST(N'0001-01-01' AS Date), CAST(782 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), 5)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (15, CAST(N'0001-01-01' AS Date), CAST(782 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), 5)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (16, CAST(N'0001-01-01' AS Date), CAST(782 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), 5)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (17, CAST(N'0001-01-01' AS Date), CAST(1577 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (18, CAST(N'0001-01-01' AS Date), CAST(1577 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (19, CAST(N'0001-01-01' AS Date), CAST(3848 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 6)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (20, CAST(N'0001-01-01' AS Date), CAST(970 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 6)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (21, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (22, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (23, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (24, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (25, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (26, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (27, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (28, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (29, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (30, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (31, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (32, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (33, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (34, CAST(N'0001-01-01' AS Date), CAST(689 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), 4)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (35, CAST(N'0001-01-01' AS Date), CAST(356 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[Invoice] ([Id], [Date], [Totalmoney], [Taxtotal], [storeId]) VALUES (36, CAST(N'0001-01-01' AS Date), CAST(66 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ID], [Item_Name], [Brand], [Brice], [qty], [storeId]) VALUES (1, N'Biscuit                                           ', N'lava                          ', CAST(20 AS Decimal(18, 0)), 3, 1)
INSERT [dbo].[Item] ([ID], [Item_Name], [Brand], [Brice], [qty], [storeId]) VALUES (4, N'sugar                                             ', N'love                          ', CAST(2 AS Decimal(18, 0)), 40, 2)
INSERT [dbo].[Item] ([ID], [Item_Name], [Brand], [Brice], [qty], [storeId]) VALUES (5, N'Tea                                               ', N'union                         ', CAST(3 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[Item] ([ID], [Item_Name], [Brand], [Brice], [qty], [storeId]) VALUES (6, N'Limon                                             ', N'love                          ', CAST(30 AS Decimal(18, 0)), 30, 3)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Itemsinvoice] ON 

INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (1, 4, NULL)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (2, 5, NULL)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (3, 5, NULL)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (4, 9, NULL)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (5, 10, NULL)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (6, 10, NULL)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (7, 4, 11)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (8, 5, 11)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (9, 6, 12)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (10, 5, 13)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (11, 4, 13)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (12, 4, 13)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (13, 5, 14)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (14, 6, 14)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (15, 5, 15)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (16, 6, 15)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (17, 5, 16)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (18, 6, 16)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (19, 6, 17)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (20, 6, 17)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (21, 6, 18)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (22, 6, 18)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (23, 6, 19)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (24, 6, 19)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (25, 6, 20)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (26, 1, 20)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (27, 5, 21)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (28, 5, 21)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (29, 5, 22)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (30, 5, 22)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (31, 5, 23)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (32, 5, 23)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (33, 5, 24)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (34, 5, 24)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (35, 5, 25)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (36, 5, 25)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (37, 5, 26)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (38, 5, 26)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (39, 5, 27)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (40, 5, 27)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (41, 5, 28)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (42, 5, 28)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (43, 5, 29)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (44, 5, 29)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (45, 5, 30)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (46, 5, 30)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (47, 5, 31)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (48, 5, 31)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (49, 5, 32)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (50, 5, 32)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (51, 5, 33)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (52, 5, 33)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (53, 5, 34)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (54, 5, 34)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (55, 5, 35)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (56, 1, 36)
INSERT [dbo].[Itemsinvoice] ([Id], [itemId], [InvoiceId]) VALUES (57, 1, 36)
SET IDENTITY_INSERT [dbo].[Itemsinvoice] OFF
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([StoreId], [Name]) VALUES (1, N'STORE1')
INSERT [dbo].[Store] ([StoreId], [Name]) VALUES (2, N'STORE2')
INSERT [dbo].[Store] ([StoreId], [Name]) VALUES (3, N'STORE3')
INSERT [dbo].[Store] ([StoreId], [Name]) VALUES (4, N'STORE4')
INSERT [dbo].[Store] ([StoreId], [Name]) VALUES (5, N'STORE5')
INSERT [dbo].[Store] ([StoreId], [Name]) VALUES (6, N'STORE6')
SET IDENTITY_INSERT [dbo].[Store] OFF
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Store] FOREIGN KEY([storeId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Store]
GO
ALTER TABLE [dbo].[Itemsinvoice]  WITH CHECK ADD  CONSTRAINT [FK_Itemsinvoice_Invoice1] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[Itemsinvoice] CHECK CONSTRAINT [FK_Itemsinvoice_Invoice1]
GO
/****** Object:  StoredProcedure [dbo].[LastIdInserted]    Script Date: 6/23/2020 6:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LastIdInserted]
as
begin 

SELECT IDENT_CURRENT('[dbo].[Invoice]') 
end
GO
USE [master]
GO
ALTER DATABASE [Technical Task] SET  READ_WRITE 
GO
