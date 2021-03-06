USE [master]
GO
/****** Object:  Database [pharm]    Script Date: 11-10-2018 18:35:50 ******/
CREATE DATABASE [pharm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pharm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\pharm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pharm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\pharm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pharm] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pharm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pharm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pharm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pharm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pharm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pharm] SET ARITHABORT OFF 
GO
ALTER DATABASE [pharm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pharm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pharm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pharm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pharm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pharm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pharm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pharm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pharm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pharm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pharm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pharm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pharm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pharm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pharm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pharm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pharm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pharm] SET RECOVERY FULL 
GO
ALTER DATABASE [pharm] SET  MULTI_USER 
GO
ALTER DATABASE [pharm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pharm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pharm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pharm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pharm] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'pharm', N'ON'
GO
ALTER DATABASE [pharm] SET QUERY_STORE = OFF
GO
USE [pharm]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [pharm]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Batch_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost_Price] [decimal](19, 2) NOT NULL,
	[Sell_Price] [decimal](19, 2) NOT NULL,
	[Production_Date] [date] NOT NULL,
	[Expire_Date] [date] NOT NULL,
	[Purchase_ID] [varchar](12) NOT NULL,
	[Medicine_ID] [int] NOT NULL,
 CONSTRAINT [PK__Batch__28E47C5351670F2C] PRIMARY KEY CLUSTERED 
(
	[Batch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill_Information]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Information](
	[Invoice_No] [varchar](12) NOT NULL,
	[Total_Amount] [decimal](19, 2) NOT NULL,
	[Discount] [varchar](10) NOT NULL,
	[Discount_Amount] [decimal](19, 2) NOT NULL,
	[Total_Payable] [decimal](19, 2) NOT NULL,
	[Paid] [decimal](19, 2) NOT NULL,
	[Returned] [decimal](19, 2) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK__Bill_Inf__0DE61CDB18BC7AAA] PRIMARY KEY CLUSTERED 
(
	[Invoice_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[Category] [varchar](20) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drug_Generic_name]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drug_Generic_name](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Genric_Name] [varchar](25) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK__Drug_Gen__3214EC275D98445B] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NULL,
	[ThemeColor] [nvarchar](10) NULL,
	[IsFullDay] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expense_Information]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense_Information](
	[category_Id] [int] IDENTITY(3,1) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Category_Information] PRIMARY KEY CLUSTERED 
(
	[category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[Expense_Id] [int] IDENTITY(6,1) NOT NULL,
	[category_Id] [int] NOT NULL,
	[Details] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[Expense_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer_Name] [varchar](50) NOT NULL,
	[Details] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicine_Information]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine_Information](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Medicine_Name] [varchar](50) NOT NULL,
	[Generic_ID] [int] NOT NULL,
	[Manufacturer_ID] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UnitId] [int] NULL,
 CONSTRAINT [PK__Medicine__3214EC27F9936E38] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Purchase_ID] [varchar](12) NOT NULL,
	[Amount] [decimal](19, 2) NOT NULL,
	[Discount] [int] NOT NULL,
	[Discount_Amount] [decimal](19, 2) NOT NULL,
	[Grand_Total] [decimal](19, 2) NOT NULL,
	[IsPaid] [varchar](20) NOT NULL,
	[Entry_Date] [date] NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
 CONSTRAINT [PK__Purchase__543E6DA3FEEA5AFF] PRIMARY KEY CLUSTERED 
(
	[Purchase_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] [decimal](19, 2) NOT NULL,
	[Amount] [decimal](19, 2) NOT NULL,
	[Medicine_ID] [int] NOT NULL,
	[Bill_Invoice] [varchar](12) NOT NULL,
 CONSTRAINT [PK__Sales__3214EC276D07025C] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [varchar](50) NOT NULL,
	[Contact] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[unitID] [int] NOT NULL,
	[unitShortName] [varchar](5) NOT NULL,
	[unitName] [varchar](20) NOT NULL,
	[unitValue] [varchar](20) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[unitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Access]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Access](
	[Username] [varchar](25) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[Usertype] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Information]    Script Date: 11-10-2018 18:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Information](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Contact] [int] NOT NULL,
	[Blood_Group] [varchar](15) NOT NULL,
	[Marital_Status] [varchar](10) NOT NULL,
	[Join_Date] [date] NOT NULL,
	[Salary] [int] NOT NULL,
	[Username] [varchar](25) NOT NULL,
 CONSTRAINT [PK__User_Inf__3214EC27CDCD9393] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Batch] ON 

INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (1, 1, 1, CAST(123.00 AS Decimal(19, 2)), CAST(132.00 AS Decimal(19, 2)), CAST(N'2018-08-08' AS Date), CAST(N'2018-09-30' AS Date), N'161347', 1)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (2, 2, 1, CAST(145.00 AS Decimal(19, 2)), CAST(147.00 AS Decimal(19, 2)), CAST(N'2018-08-02' AS Date), CAST(N'2018-08-26' AS Date), N'161508', 1)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (3, 3, 5, CAST(320.00 AS Decimal(19, 2)), CAST(340.00 AS Decimal(19, 2)), CAST(N'2018-02-14' AS Date), CAST(N'2019-12-13' AS Date), N'152323', 2)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (4, 4, 12, CAST(160.00 AS Decimal(19, 2)), CAST(165.00 AS Decimal(19, 2)), CAST(N'2018-07-05' AS Date), CAST(N'2020-07-17' AS Date), N'152323', 4)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (5, 5, 23, CAST(13.00 AS Decimal(19, 2)), CAST(15.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2019-12-25' AS Date), N'164825', 1)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (6, 6, 100, CAST(5.00 AS Decimal(19, 2)), CAST(6.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2019-07-31' AS Date), N'165005', 2)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (8, 7, 2, CAST(12.00 AS Decimal(19, 2)), CAST(14.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2018-09-19' AS Date), N'180928120110', 1)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (9, 8, 3, CAST(12.00 AS Decimal(19, 2)), CAST(15.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2018-09-20' AS Date), N'180928122313', 4)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (11, 9, 150, CAST(24.00 AS Decimal(19, 2)), CAST(26.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2020-06-17' AS Date), N'181004161245', 26)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (12, 10, 20, CAST(136.00 AS Decimal(19, 2)), CAST(138.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2019-11-13' AS Date), N'181004161245', 2)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (13, 11, 30, CAST(25.00 AS Decimal(19, 2)), CAST(28.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2019-07-17' AS Date), N'181004161608', 22)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (14, 12, 20, CAST(45.00 AS Decimal(19, 2)), CAST(48.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2020-11-11' AS Date), N'181004161608', 32)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (15, 13, 80, CAST(24.00 AS Decimal(19, 2)), CAST(26.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2020-11-12' AS Date), N'181004161608', 27)
INSERT [dbo].[Batch] ([ID], [Batch_ID], [Quantity], [Cost_Price], [Sell_Price], [Production_Date], [Expire_Date], [Purchase_ID], [Medicine_ID]) VALUES (16, 14, 50, CAST(12.00 AS Decimal(19, 2)), CAST(14.00 AS Decimal(19, 2)), CAST(N'0001-01-01' AS Date), CAST(N'2019-08-22' AS Date), N'181004162008', 33)
SET IDENTITY_INSERT [dbo].[Batch] OFF
INSERT [dbo].[Bill_Information] ([Invoice_No], [Total_Amount], [Discount], [Discount_Amount], [Total_Payable], [Paid], [Returned], [Date]) VALUES (N'103553', CAST(132.00 AS Decimal(19, 2)), N'12', CAST(15.84 AS Decimal(19, 2)), CAST(116.16 AS Decimal(19, 2)), CAST(150.00 AS Decimal(19, 2)), CAST(33.84 AS Decimal(19, 2)), CAST(N'2018-08-28' AS Date))
INSERT [dbo].[Bill_Information] ([Invoice_No], [Total_Amount], [Discount], [Discount_Amount], [Total_Payable], [Paid], [Returned], [Date]) VALUES (N'152922', CAST(1020.00 AS Decimal(19, 2)), N'3', CAST(30.60 AS Decimal(19, 2)), CAST(989.40 AS Decimal(19, 2)), CAST(1000.00 AS Decimal(19, 2)), CAST(10.60 AS Decimal(19, 2)), CAST(N'2018-08-31' AS Date))
INSERT [dbo].[Bill_Information] ([Invoice_No], [Total_Amount], [Discount], [Discount_Amount], [Total_Payable], [Paid], [Returned], [Date]) VALUES (N'155842', CAST(148.00 AS Decimal(19, 2)), N'2', CAST(2.96 AS Decimal(19, 2)), CAST(145.04 AS Decimal(19, 2)), CAST(150.00 AS Decimal(19, 2)), CAST(4.96 AS Decimal(19, 2)), CAST(N'2018-10-18' AS Date))
INSERT [dbo].[Bill_Information] ([Invoice_No], [Total_Amount], [Discount], [Discount_Amount], [Total_Payable], [Paid], [Returned], [Date]) VALUES (N'160133', CAST(108.00 AS Decimal(19, 2)), N'9', CAST(9.72 AS Decimal(19, 2)), CAST(98.28 AS Decimal(19, 2)), CAST(100.00 AS Decimal(19, 2)), CAST(1.72 AS Decimal(19, 2)), CAST(N'2018-10-11' AS Date))
INSERT [dbo].[Bill_Information] ([Invoice_No], [Total_Amount], [Discount], [Discount_Amount], [Total_Payable], [Paid], [Returned], [Date]) VALUES (N'162223', CAST(330.00 AS Decimal(19, 2)), N'8', CAST(26.40 AS Decimal(19, 2)), CAST(303.60 AS Decimal(19, 2)), CAST(350.00 AS Decimal(19, 2)), CAST(26.60 AS Decimal(19, 2)), CAST(N'2018-09-13' AS Date))
INSERT [dbo].[Bill_Information] ([Invoice_No], [Total_Amount], [Discount], [Discount_Amount], [Total_Payable], [Paid], [Returned], [Date]) VALUES (N'162855', CAST(28.00 AS Decimal(19, 2)), N'3', CAST(0.84 AS Decimal(19, 2)), CAST(27.16 AS Decimal(19, 2)), CAST(30.00 AS Decimal(19, 2)), CAST(2.84 AS Decimal(19, 2)), CAST(N'2018-10-11' AS Date))
INSERT [dbo].[Category] ([CategoryId], [Category], [Description]) VALUES (1, N'syrup', N'for')
INSERT [dbo].[Category] ([CategoryId], [Category], [Description]) VALUES (2, N'Capsul', N'--j')
INSERT [dbo].[Category] ([CategoryId], [Category], [Description]) VALUES (3, N'Tablet', N'-')
SET IDENTITY_INSERT [dbo].[Drug_Generic_name] ON 

INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (1, N'carbamazepine', N'Tegretol, carbamazepine USP, is an anticonvulsant ')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (2, N'paracetamol', N'for other illnes')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (3, N'test2', N'test2')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (4, N'Atorvastatin Calcium', N'treat high cholesterol, and to lower the risk of stroke, heart attack')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (5, N'Levothyroxine ', N'treats hypothyroidism (low thyroid hormone)')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (6, N'Lisinopril ', N'treat high blood pressure (hypertension) or congestive heart failure')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (7, N'Omeprazole ', N'treat symptoms of gastroesophageal reflux disease (GERD)')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (8, N'Metformin ', N'used to improve blood sugar control in people with type 2 diabetes')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (9, N'Amlodipine ', N'used to treat high blood pressure (hypertension) or chest pain (angina)')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (10, N'Simvastatin', N'Simvastatin is used to lower cholesterol and triglycerides (types of fat) in the blood')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (11, N'Hydrocodone/Acetaminophen', N'Hydrocodone and acetaminophen combination is used to relieve moderate to moderately severe pain')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (12, N'Metoprolol ER', N'Metoprolol ER is used to treat angina (chest pain) and hypertension (high blood pressure). It is also used to treat or prevent heart attack')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (13, N'Losartan ', N'Losartan is used to treat high blood pressure (hypertension). It is also used to lower the risk of stroke in certain people with heart disease')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (14, N'Azithromycin ', N'for first use')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (15, N'Zolpidem ', N'-')
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (16, N'Hydrochlorothiazide ', NULL)
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (17, N'Furosemide ', NULL)
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (18, N'Metoprolol ', NULL)
INSERT [dbo].[Drug_Generic_name] ([ID], [Genric_Name], [Description]) VALUES (19, N'Pantoprazole ', N'for uses')
SET IDENTITY_INSERT [dbo].[Drug_Generic_name] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (1, N'Meeting', N'Meeting with bidyut adak', CAST(N'2017-06-24T00:00:00.000' AS DateTime), CAST(N'2017-06-24T01:00:00.000' AS DateTime), N'red', 0)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (2, N'Birthday', N'', CAST(N'2017-06-25T00:00:00.000' AS DateTime), NULL, N'green', 1)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (3, N'sdas', N'sdsa', CAST(N'2018-08-16T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (4, N'sdas', N'wdw', CAST(N'2018-09-12T00:00:00.000' AS DateTime), NULL, N'black', 1)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (5, N'efrewrw', N'ewrwrew', CAST(N'2018-09-19T00:00:00.000' AS DateTime), CAST(N'2018-09-20T00:00:00.000' AS DateTime), N'black', 0)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (6, N'efrewrw', N'ewrwrew', CAST(N'2018-09-20T00:00:00.000' AS DateTime), CAST(N'2018-09-21T00:00:00.000' AS DateTime), N'black', 0)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (8, N'test1', N'gg', CAST(N'2018-10-09T00:00:00.000' AS DateTime), CAST(N'2018-10-10T12:00:00.000' AS DateTime), N'blue', 0)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (9, N'efrewrw', N'de', CAST(N'2018-10-23T00:00:00.000' AS DateTime), CAST(N'2018-10-23T23:54:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (10, N'wedding leave', N'for leave', CAST(N'2018-10-10T12:00:00.000' AS DateTime), NULL, N'green', 1)
INSERT [dbo].[Events] ([Id], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (11, N'Trip', N'de', CAST(N'2018-10-23T00:00:00.000' AS DateTime), CAST(N'2018-10-23T23:54:00.000' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[Expense_Information] ON 

INSERT [dbo].[Expense_Information] ([category_Id], [Category], [Description]) VALUES (1, N'food', N'to supply')
INSERT [dbo].[Expense_Information] ([category_Id], [Category], [Description]) VALUES (2, N'Medicine', N'For Supply')
INSERT [dbo].[Expense_Information] ([category_Id], [Category], [Description]) VALUES (6, N'salary', N'for Employees')
INSERT [dbo].[Expense_Information] ([category_Id], [Category], [Description]) VALUES (7, N'Drinks', N'For Customers')
INSERT [dbo].[Expense_Information] ([category_Id], [Category], [Description]) VALUES (8, N'parking', N'For Customers')
SET IDENTITY_INSERT [dbo].[Expense_Information] OFF
SET IDENTITY_INSERT [dbo].[Expenses] ON 

INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (1, 1, N'food', CAST(N'1999-11-12T00:00:00.000' AS DateTime), CAST(210 AS Decimal(18, 0)))
INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (2, 1, N'drink', CAST(N'2018-09-03T00:00:00.000' AS DateTime), CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (3, 1, N'drink', CAST(N'2020-12-11T00:00:00.000' AS DateTime), CAST(268 AS Decimal(18, 0)))
INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (4, 2, N'Medicine', CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (5, 2, N'for illness', CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (6, 6, N'nooooo', CAST(N'2018-09-13T00:00:00.000' AS DateTime), CAST(1020 AS Decimal(18, 0)))
INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (7, 8, N'for visitors', CAST(N'2018-09-13T00:00:00.000' AS DateTime), CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[Expenses] ([Expense_Id], [category_Id], [Details], [Date], [Amount]) VALUES (8, 7, N'for officers', CAST(N'2018-09-25T00:00:00.000' AS DateTime), CAST(200 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Expenses] OFF
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (2, N'sidhalepa', N'india')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (3, N'harcourts', N'lanka')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (4, N'Anchor', NULL)
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (5, N'Amgen', NULL)
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (6, N'Sun Pharma', N'Market Cap: 28 Lakh Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (7, N'Cadila Health', N'Market Cap: 55.46 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (8, N'Lupin', N'Market Cap: 53.17 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (9, N'Piramal Enter', N'Market Cap: 51.98 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (10, N'Cipla', N'Market Cap: 44.29 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (11, N'Dr Reddys Labs', N'Market Cap: 43.55 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (12, N'Aurobindo Pharm', N'Market Cap: 35.39 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (13, N'Alkem Lab', N'Market Cap: 22.58 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (14, N'GlaxoSmithKline', N'Market Cap: 20.80 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (15, N'Torrent Pharma', N'Market Cap: 20.59 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (16, N'Biocon', N'Market Cap: 20.44 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (17, N'Glenmark', N'Market Cap: 17.80 Thousand Crore Rupees Approx')
INSERT [dbo].[Manufacturer] ([ID], [Manufacturer_Name], [Details]) VALUES (18, N'Pfizer', N'Market Cap: 7.75 Thousand Crore Rupees Approx')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[Medicine_Information] ON 

INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (1, N'carbatol', 1, 2, 1, 2)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (2, N'panadol', 2, 3, 2, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (4, N'sidhalepa', 3, 2, 1, NULL)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (22, N'vix', 8, 8, 3, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (26, N'Acetaminophen', 4, 5, 3, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (27, N'Clonazepam', 5, 3, 3, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (28, N'Metoprolol', 7, 5, 2, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (30, N'Lorazepam', 6, 10, 3, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (31, N'Citalopram', 11, 6, 3, 2)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (32, N'Zoloft', 15, 13, 3, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (33, N'Tramadol', 13, 3, 3, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (34, N'Gabapentin', 10, 13, 2, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (36, N'Lexapro', 16, 6, 1, 2)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (37, N'Oxycodone', 19, 18, 3, 1)
INSERT [dbo].[Medicine_Information] ([ID], [Medicine_Name], [Generic_ID], [Manufacturer_ID], [CategoryId], [UnitId]) VALUES (39, N'Loratadine', 17, 5, 3, 2)
SET IDENTITY_INSERT [dbo].[Medicine_Information] OFF
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (3, N'152323', CAST(3520.00 AS Decimal(19, 2)), 5, CAST(176.00 AS Decimal(19, 2)), CAST(3344.00 AS Decimal(19, 2)), N'Paid', CAST(N'2018-08-31' AS Date), N'For Emergency purpose', 2)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (1, N'161347', CAST(123.00 AS Decimal(19, 2)), 1, CAST(1.23 AS Decimal(19, 2)), CAST(121.77 AS Decimal(19, 2)), N'Paid', CAST(N'2018-08-27' AS Date), N'not', 1)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (2, N'161508', CAST(145.00 AS Decimal(19, 2)), 2, CAST(2.90 AS Decimal(19, 2)), CAST(142.10 AS Decimal(19, 2)), N'Credit', CAST(N'2018-08-27' AS Date), N'yes no', 1)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (4, N'164825', CAST(299.00 AS Decimal(19, 2)), 3, CAST(8.97 AS Decimal(19, 2)), CAST(290.03 AS Decimal(19, 2)), N'Paid', CAST(N'2018-09-12' AS Date), N'f', 1)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (5, N'165005', CAST(500.00 AS Decimal(19, 2)), 10, CAST(50.00 AS Decimal(19, 2)), CAST(450.00 AS Decimal(19, 2)), N'Credit', CAST(N'2018-09-29' AS Date), N'test', 4)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (7, N'180928120110', CAST(24.00 AS Decimal(19, 2)), 2, CAST(0.48 AS Decimal(19, 2)), CAST(23.52 AS Decimal(19, 2)), N'Paid', CAST(N'2018-09-11' AS Date), N'no', 1)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (8, N'180928122313', CAST(36.00 AS Decimal(19, 2)), 4, CAST(1.44 AS Decimal(19, 2)), CAST(34.56 AS Decimal(19, 2)), N'Paid', CAST(N'2018-09-28' AS Date), N'no', 5)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (10, N'181004161245', CAST(6320.00 AS Decimal(19, 2)), 5, CAST(316.00 AS Decimal(19, 2)), CAST(6004.00 AS Decimal(19, 2)), N'Credit', CAST(N'2018-10-03' AS Date), N'-', 13)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (11, N'181004161608', CAST(3570.00 AS Decimal(19, 2)), 7, CAST(249.90 AS Decimal(19, 2)), CAST(3320.10 AS Decimal(19, 2)), N'Paid', CAST(N'2018-10-04' AS Date), N'-', 8)
INSERT [dbo].[Purchase] ([ID], [Purchase_ID], [Amount], [Discount], [Discount_Amount], [Grand_Total], [IsPaid], [Entry_Date], [Description], [Supplier_ID]) VALUES (12, N'181004162008', CAST(600.00 AS Decimal(19, 2)), 4, CAST(24.00 AS Decimal(19, 2)), CAST(576.00 AS Decimal(19, 2)), N'Paid', CAST(N'2018-10-05' AS Date), N'for friend', 8)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (1, 1, CAST(132.00 AS Decimal(19, 2)), CAST(132.00 AS Decimal(19, 2)), 1, N'103553')
INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (4, 3, CAST(1000.00 AS Decimal(19, 2)), CAST(1022.00 AS Decimal(19, 2)), 2, N'152922')
INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (5, 2, CAST(0.00 AS Decimal(19, 2)), CAST(330.00 AS Decimal(19, 2)), 4, N'162223')
INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (29, 2, CAST(0.00 AS Decimal(19, 2)), CAST(96.00 AS Decimal(19, 2)), 32, N'155842')
INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (30, 2, CAST(0.00 AS Decimal(19, 2)), CAST(52.00 AS Decimal(19, 2)), 27, N'155842')
INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (33, 2, CAST(0.00 AS Decimal(19, 2)), CAST(52.00 AS Decimal(19, 2)), 26, N'160133')
INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (34, 4, CAST(0.00 AS Decimal(19, 2)), CAST(56.00 AS Decimal(19, 2)), 33, N'160133')
INSERT [dbo].[Sales] ([ID], [Quantity], [Cost], [Amount], [Medicine_ID], [Bill_Invoice]) VALUES (43, 1, CAST(0.00 AS Decimal(19, 2)), CAST(28.00 AS Decimal(19, 2)), 22, N'162855')
SET IDENTITY_INSERT [dbo].[Sales] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (1, N'madhu', N'1234567835', N'no@no.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (2, N'madhukanth', N'dsfdsf', N'no1@no1.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (4, N'ayoni', N'drtgdr', N'ggf')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (5, N'mirshad', N'07796886786', N'no123@no.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (7, N'Tharuni', N'54325235', N'tharuni@now.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (8, N'karuni', N'46577868', N'madhu@gmail.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (9, N'catamal', N'1243434', N'cata@gmail.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (10, N'Thasni', N'56464657', N'said@yahoo.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (11, N'super', N'35432434', N'sup@hmail.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (12, N'hadhil', N'1256567', N'hadhil@yahoo.com')
INSERT [dbo].[Supplier] ([ID], [Supplier_Name], [Contact], [Email]) VALUES (13, N'fazil', N'65657866', N'faz@yahoo.com')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
INSERT [dbo].[Unit] ([unitID], [unitShortName], [unitName], [unitValue]) VALUES (1, N'Pc', N'Peace', NULL)
INSERT [dbo].[Unit] ([unitID], [unitShortName], [unitName], [unitValue]) VALUES (2, N'ml', N'MiliLeater', NULL)
INSERT [dbo].[User_Access] ([Username], [Password], [Usertype]) VALUES (N'Admin', N'Admin', N'Admin')
INSERT [dbo].[User_Access] ([Username], [Password], [Usertype]) VALUES (N'Mirshad', N'Mirshad', N'Admin')
INSERT [dbo].[User_Access] ([Username], [Password], [Usertype]) VALUES (N'Staff', N'Staff', N'Staff')
SET IDENTITY_INSERT [dbo].[User_Information] ON 

INSERT [dbo].[User_Information] ([ID], [Name], [Email], [Gender], [Date_of_Birth], [Age], [Address], [Contact], [Blood_Group], [Marital_Status], [Join_Date], [Salary], [Username]) VALUES (1000, N'Admin', N'Admin@admin.com', N'Male', CAST(N'1992-12-12' AS Date), 24, N'4, Galle Road, Kaluthara south', 771231232, N'B', N'Single', CAST(N'2016-10-12' AS Date), 25000, N'Admin')
INSERT [dbo].[User_Information] ([ID], [Name], [Email], [Gender], [Date_of_Birth], [Age], [Address], [Contact], [Blood_Group], [Marital_Status], [Join_Date], [Salary], [Username]) VALUES (1002, N'Staff', N'Staff@gmail.com', N'Male', CAST(N'1994-11-10' AS Date), 22, N'23, Kandy Road, Colombo 15', 751111111, N'O+', N'Unmarried', CAST(N'2015-12-11' AS Date), 21000, N'Staff')
SET IDENTITY_INSERT [dbo].[User_Information] OFF
/****** Object:  Index [UQ__Medicine__E0D0BDD967D6A765]    Script Date: 11-10-2018 18:35:51 ******/
ALTER TABLE [dbo].[Medicine_Information] ADD  CONSTRAINT [UQ__Medicine__E0D0BDD967D6A765] UNIQUE NONCLUSTERED 
(
	[Generic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Sales__5F01023476D4D43D]    Script Date: 11-10-2018 18:35:51 ******/
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [UQ__Sales__5F01023476D4D43D] UNIQUE NONCLUSTERED 
(
	[Medicine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__User_Inf__536C85E4FCADD1EE]    Script Date: 11-10-2018 18:35:51 ******/
ALTER TABLE [dbo].[User_Information] ADD  CONSTRAINT [UQ__User_Inf__536C85E4FCADD1EE] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK__Batch__Medicine___37A5467C] FOREIGN KEY([Medicine_ID])
REFERENCES [dbo].[Medicine_Information] ([ID])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK__Batch__Medicine___37A5467C]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK__Batch__Purchase___38996AB5] FOREIGN KEY([Purchase_ID])
REFERENCES [dbo].[Purchase] ([Purchase_ID])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK__Batch__Purchase___38996AB5]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Category_Information] FOREIGN KEY([category_Id])
REFERENCES [dbo].[Expense_Information] ([category_Id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Category_Information]
GO
ALTER TABLE [dbo].[Medicine_Information]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Information_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Medicine_Information] CHECK CONSTRAINT [FK_Medicine_Information_Category]
GO
ALTER TABLE [dbo].[Medicine_Information]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Information_Drug_Generic_name] FOREIGN KEY([Generic_ID])
REFERENCES [dbo].[Drug_Generic_name] ([ID])
GO
ALTER TABLE [dbo].[Medicine_Information] CHECK CONSTRAINT [FK_Medicine_Information_Drug_Generic_name]
GO
ALTER TABLE [dbo].[Medicine_Information]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Information_Manufacturer] FOREIGN KEY([Manufacturer_ID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Medicine_Information] CHECK CONSTRAINT [FK_Medicine_Information_Manufacturer]
GO
ALTER TABLE [dbo].[Medicine_Information]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Information_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([unitID])
GO
ALTER TABLE [dbo].[Medicine_Information] CHECK CONSTRAINT [FK_Medicine_Information_Unit]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK__Purchase__Suppli__3B75D760] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK__Purchase__Suppli__3B75D760]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK__Sales__Bill_Invo__3C69FB99] FOREIGN KEY([Bill_Invoice])
REFERENCES [dbo].[Bill_Information] ([Invoice_No])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK__Sales__Bill_Invo__3C69FB99]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK__Sales__Medicine___3D5E1FD2] FOREIGN KEY([Medicine_ID])
REFERENCES [dbo].[Medicine_Information] ([ID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK__Sales__Medicine___3D5E1FD2]
GO
ALTER TABLE [dbo].[User_Information]  WITH CHECK ADD  CONSTRAINT [FK__User_Info__Usern__3E52440B] FOREIGN KEY([Username])
REFERENCES [dbo].[User_Access] ([Username])
GO
ALTER TABLE [dbo].[User_Information] CHECK CONSTRAINT [FK__User_Info__Usern__3E52440B]
GO
USE [master]
GO
ALTER DATABASE [pharm] SET  READ_WRITE 
GO
