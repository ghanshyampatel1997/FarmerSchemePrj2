USE [master]
GO
/****** Object:  Database [FarmerSchemeDB]    Script Date: 12/2/2020 9:32:39 AM ******/
CREATE DATABASE [FarmerSchemeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmerSchemeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FarmerSchemeDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FarmerSchemeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FarmerSchemeDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FarmerSchemeDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmerSchemeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmerSchemeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FarmerSchemeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmerSchemeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmerSchemeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FarmerSchemeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmerSchemeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmerSchemeDB] SET  MULTI_USER 
GO
ALTER DATABASE [FarmerSchemeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmerSchemeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmerSchemeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmerSchemeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FarmerSchemeDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FarmerSchemeDB] SET QUERY_STORE = OFF
GO
USE [FarmerSchemeDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankDetails]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankDetails](
	[BankId] [int] IDENTITY(1000,1) NOT NULL,
	[IFSCCode] [nvarchar](50) NULL,
	[BankAccountNo] [bigint] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_bankdetails] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BiddingTable]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiddingTable](
	[BidID] [int] IDENTITY(1,1) NOT NULL,
	[bidAmount] [int] NULL,
	[FarmerSellID] [int] NULL,
	[ApprovedBid] [bit] NULL,
	[date] [date] NULL,
	[UserID] [int] NOT NULL,
	[Biddingdate] [date] NULL,
 CONSTRAINT [PK_bid] PRIMARY KEY CLUSTERED 
(
	[BidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimForm]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimForm](
	[PolicyNo] [int] NULL,
	[ClaimNo] [bigint] IDENTITY(5000000,1) NOT NULL,
	[dateOfLoss] [date] NULL,
	[CauseOfLoss] [nvarchar](50) NULL,
	[ClaimApprove] [bit] NULL,
 CONSTRAINT [PK_claimform] PRIMARY KEY CLUSTERED 
(
	[ClaimNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cropprice]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cropprice](
	[CropId] [int] NOT NULL,
	[cropname] [nvarchar](50) NULL,
	[MSP] [int] NULL,
 CONSTRAINT [PK_croptable] PRIMARY KEY CLUSTERED 
(
	[CropId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmerCropdetils]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmerCropdetils](
	[FarmerSellID] [int] IDENTITY(1000,1) NOT NULL,
	[cropType] [nvarchar](40) NULL,
	[CropId] [int] NULL,
	[fertilizerType] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[SoilPHCertificate] [nvarchar](300) NULL,
	[AproovedFarmersell] [bit] NULL,
	[UserID] [int] NULL,
	[AddedDate] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[FarmerSellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmerLand]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmerLand](
	[FarmId] [int] IDENTITY(1,1) NOT NULL,
	[landArea] [nvarchar](50) NULL,
	[landAddress] [nvarchar](100) NULL,
	[landPinCode] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_farmerland] PRIMARY KEY CLUSTERED 
(
	[FarmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranceApplication]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceApplication](
	[PolicyNo] [int] IDENTITY(1000000,1) NOT NULL,
	[season] [nchar](30) NULL,
	[year] [int] NOT NULL,
	[cropname] [nvarchar](50) NULL,
	[SumInsured] [int] NULL,
	[FarmId] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_insuranceapplication] PRIMARY KEY CLUSTERED 
(
	[PolicyNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RollType]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RollType](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RollType] [nvarchar](10) NULL,
	[certificate] [nvarchar](300) NULL,
	[ApprovedStatus] [bit] NULL,
	[UserEmailId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegister]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegister](
	[UserEmailId] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[ContactNo.] [nvarchar](20) NULL,
	[fullname] [nvarchar](50) NULL,
	[address1] [nvarchar](100) NULL,
	[address2] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[pincode] [int] NULL,
	[pancardDocument] [nvarchar](300) NULL,
	[aadharCardDocument] [nvarchar](300) NULL,
 CONSTRAINT [PK_rolltype] PRIMARY KEY CLUSTERED 
(
	[UserEmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([AdminID], [Password]) VALUES (N'admin123', N'YWRtaW4xMjM0NQ==')
GO
SET IDENTITY_INSERT [dbo].[BankDetails] ON 
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1000, N'nvgvvhvxbchjbj', 814422010, 12)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1003, N'SBIN0005678', 1812700162, 15)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1004, N'SBIN0004556', 123456789, 16)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1005, N'SBIN0005645', 1234564646, 1)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1006, N'SBIN0004656', 1419104202, 17)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1007, N'SBIN0007865', 3250004474, 19)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1008, N'SBIN0005678', 1824642207, 20)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1009, N'SBIN0008945', 564879452612, 23)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1010, N'HDFC0001534', 32567852637, 24)
GO
INSERT [dbo].[BankDetails] ([BankId], [IFSCCode], [BankAccountNo], [UserID]) VALUES (1012, N'HDFC0004563', -1742030851, 26)
GO
SET IDENTITY_INSERT [dbo].[BankDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[BiddingTable] ON 
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (1, 1200, 1001, NULL, NULL, 2, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (2, 700, 1006, 1, CAST(N'2020-11-12' AS Date), 3, CAST(N'2020-11-11' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (3, 900, 1011, 1, CAST(N'2020-11-13' AS Date), 1, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (4, 800, 1012, NULL, NULL, 7, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (5, 1500, 1013, 1, CAST(N'2020-10-24' AS Date), 10, CAST(N'2020-10-12' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (6, 1600, 1013, NULL, NULL, 10, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (7, 1200, 1011, 1, CAST(N'2020-10-10' AS Date), 1, CAST(N'2020-09-12' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (8, 1700, 1011, NULL, NULL, 1, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (9, 2000, 1000, 1, CAST(N'2020-10-24' AS Date), 1, CAST(N'2020-10-11' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (10, 2000, 1013, 1, CAST(N'2020-10-24' AS Date), 1, CAST(N'2020-10-11' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (11, 1800, 1011, NULL, NULL, 1, CAST(N'2020-10-11' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (16, 1300, 1001, NULL, NULL, 2, CAST(N'2020-11-27' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (17, 1750, 1021, NULL, NULL, 2, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (18, 900, 1006, NULL, NULL, 19, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (19, 500, 1029, 1, CAST(N'2020-01-12' AS Date), 19, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (20, 815, 1030, 1, CAST(N'2020-12-01' AS Date), 19, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (21, 1396, 1031, 1, CAST(N'2020-12-01' AS Date), 19, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (22, 450, 1029, NULL, NULL, 19, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID], [Biddingdate]) VALUES (23, 550, 1032, 1, CAST(N'2020-12-01' AS Date), 19, CAST(N'2020-12-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[BiddingTable] OFF
GO
SET IDENTITY_INSERT [dbo].[ClaimForm] ON 
GO
INSERT [dbo].[ClaimForm] ([PolicyNo], [ClaimNo], [dateOfLoss], [CauseOfLoss], [ClaimApprove]) VALUES (1000000, 5000004, CAST(N'2020-11-24' AS Date), N'Natural Calamities', NULL)
GO
INSERT [dbo].[ClaimForm] ([PolicyNo], [ClaimNo], [dateOfLoss], [CauseOfLoss], [ClaimApprove]) VALUES (1000001, 5000006, CAST(N'2020-11-24' AS Date), N'Insects/Pests', NULL)
GO
SET IDENTITY_INSERT [dbo].[ClaimForm] OFF
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (1, N'Pumpkin', 1200)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (2, N'Cucumber', 1100)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (3, N'Bitter gourd', 800)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (4, N'Rice', 400)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (5, N'Groundnut', 300)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (6, N'Ragi', 450)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (7, N'Bajra ', 700)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (8, N'Maize', 800)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (9, N'Sitafal', 2000)
GO
SET IDENTITY_INSERT [dbo].[FarmerCropdetils] ON 
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1000, N'kharif', 1, N'Natural', 20, N'/assets/img/certificat205554178.jpg', 1, 1, CAST(N'2012-12-24' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1001, N'zaid', 2, N'Chemicl', 15, N'/assets/img/certificat205554178.jpg', 1, 2, CAST(N'2020-11-25' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1006, N'ravi', 3, N'Chemical', 10, N'/assets/img/certificat205554178.jpg', 1, 3, CAST(N'2020-10-10' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1011, N'kharif', 5, N'Natural', 17, N'/assets/img/certificat205554178.jpg', NULL, 6, CAST(N'2019-09-08' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1012, N'ravi', 8, N'Chemical', 10, N'/assets/img/certificat205554178.jpg', 1, 7, CAST(N'2019-08-27' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1013, N'zaid', 7, N'Chemical', 7, N'/assets/img/certificat205554178.jpg', 1, 10, CAST(N'2018-07-07' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1014, N'Ravi', 1, N'Natural', 40, N'/assets/img/certificat205554178.jpg', NULL, 11, CAST(N'2020-11-11' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1015, N'kharif', 1, N'Natural', 200, N'/assets/img/certificat205554178.jpg', NULL, 1, CAST(N'2020-11-12' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1016, N'kharif', 1, N'Chemical', 200, N'/aࣘsets/img/certificat205554178.jpg', NULL, 2, CAST(N'2020-11-10' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1017, N'ravi', 1, N'natural', 1000, N'/assets/img/certificat205554178.jpg', 1, 3, CAST(N'2020-11-11' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1018, N'zaid', 1, N'chemical', 100, N'/assets/img/certificat205554178.jpg', 1, 6, CAST(N'2020-11-11' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1021, N'kharif', 1, N'natural', 21, N'/assets/img/certificat205554178.jpg', 1, 7, CAST(N'2020-11-20' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1022, N'Zaid', 1, N'Natural', 56, N'/assets/img/certificat200931773.jpg', NULL, 16, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1023, N'zaid', 1, N'natural', 56, N'/assets/img/certificat201136541.jpg', NULL, 16, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1024, N'zaid', 1, N'natural', 56, N'/assets/img/Aadhar-Car201218705.jpg', NULL, 16, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1025, N'Zaid', 5, N'Natural', 56, N'/assets/img/certificat201739430.jpg', NULL, 16, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1026, N'Zaid', 3, N'Natural', 45, N'/assets/img/certificat202227260.jpg', NULL, 16, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1027, N'Zaid', 3, N'natural', 20, N'/assets/img/certificat202341938.jpg', NULL, 16, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1028, N'Rabi', 1, N'Natural', 78, N'/assets/img/certificat203300315.jpg', NULL, 16, CAST(N'2020-11-30' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1029, N'Zaid', 4, N'Natural', 67, N'/assets/img/certificat205121305.jpg', 1, 16, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1030, N'Zaid', 6, N'Natural', 50, N'/assets/img/certificat204239318.jpg', 1, 16, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1031, N'Kharif', 7, N'Chemical', 50, N'/assets/img/certificat200735899.jpg', 1, 26, CAST(N'2020-12-01' AS Date))
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID], [AddedDate]) VALUES (1032, N'kharif', 4, N'Natural', 20, N'/assets/img/certificat200116695.jpg', 1, 16, CAST(N'2020-12-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[FarmerCropdetils] OFF
GO
SET IDENTITY_INSERT [dbo].[FarmerLand] ON 
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (1, N'khcjbb', N'bmzmxcmmzx', 61112121, 11)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (2, N'jbmxmnmcx', N'mbcbmcxm', 551313, 12)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (3, N'vadali', N'vadali', 353234, 13)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (4, N'vadali', N'vadali', 353234, 14)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (5, N'vadali', N'vadali', 353234, 15)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (6, N'Vadali', N'vadali,kesharganj', 683532, 16)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (7, N'Girnar', N'Jamnagar', 323532, 1)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (8, N'Bihar', N'Chandpudi', 363545, 2)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (9, N'Vadali', N'Jamnagar', 653234, 17)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (10, N'Tamilnadu', N'Tamilnadu', 455678, 23)
GO
INSERT [dbo].[FarmerLand] ([FarmId], [landArea], [landAddress], [landPinCode], [UserID]) VALUES (11, N'Sabarkantha', N'Chulla, Kadiyadara', 353632, 26)
GO
SET IDENTITY_INSERT [dbo].[FarmerLand] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuranceApplication] ON 
GO
INSERT [dbo].[InsuranceApplication] ([PolicyNo], [season], [year], [cropname], [SumInsured], [FarmId], [UserID]) VALUES (1000000, N'Kharif                        ', 2020, N'Pumpkin', 300000, 7, 1)
GO
INSERT [dbo].[InsuranceApplication] ([PolicyNo], [season], [year], [cropname], [SumInsured], [FarmId], [UserID]) VALUES (1000001, N'Kharif                        ', 2020, N'pumpkin', 300000, 8, 2)
GO
SET IDENTITY_INSERT [dbo].[InsuranceApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[RollType] ON 
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (1, N'Farmer', N'/assets/img/pigs2205242481.jpg', 1, N'ghanshyam@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (2, N'bidder', N'/assets/img/certificat205554178.jpg', 1, N'ghanshyam@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (3, N'bidder', N'/assets/img/pigs2205242481.jpg', 1, N'ghanshyambhai@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (6, N'Farmer', N'/assets/img/certificat205554178.jpg', 1, N'ghanshyambhai@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (7, N'bidder', N'/assets/img/slide_27205430142.jpg', 1, N'ghanshyampatel@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (9, N'Farmer', N'/assets/img/slide_27201619497.jpg', 1, N'Shyam@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (10, N'Farmer', N'/assets/img/slide_27205430142.jpg', 1, N'ghanshyampatel@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (11, N'Farmer', N'/assets/img/pigs2205242481.jpg', NULL, N'jickcn,z,,nzkckkchk')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (12, N'Farmer', N'/assets/img/pigs2200025671.jpg', 1, N'njnkvjxknvkndskvk')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (13, N'FARMER', N'/assets/img/slide_27205430142.jpg', NULL, N'jickcn,z,,nzkckkch')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (14, N'FARMER', N'/assets/img/slide_27200018371.jpg', NULL, N'jickcn,z,,nzkckkc')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (15, N'FARMER', N'/assets/img/slide_27201619497.jpg', NULL, N'jickcn,z,,nzkckk')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (16, N'FARMER', N'/assets/img/certificat203149610.jpg', 1, N'ghanshyampatel123@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (17, N'FARMER', N'/assets/img/certificat205554178.jpg', 1, N'ramesh@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (18, N'FARMER', N'/assets/img/certificat205554178.jpg', 1, N'ramesh@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (19, N'BIDDER', N'/assets/img/certificat202720344.jpg', 1, N'jayantibhai.batli@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (20, N'BIDDER', N'/assets/img/certificat204510657.jpg', NULL, N'ravikumar123@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (21, N'FARMER', N'/assets/img/certificat204510657.jpg', NULL, N'ghanshyampatel199789@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (22, N'BIDDER', N'/assets/img/certificat204510657.jpg', 1, N'ghanshyampatel199789@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (23, N'FARMER', N'/assets/img/certificat204510657.jpg', 1, N'tejeshedunoori@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (24, N'BIDDER', N'/assets/img/certificat204455120.jpg', NULL, N'dharmendrak@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (26, N'FARMER', N'/assets/img/certificat205637462.jpg', 1, N'sk.imthiyaz4@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[RollType] OFF
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'dharmendrak@gmail.com', N'ZGhhcmFt', N'789-567-3456', N'Dharmendra Kumar Pandya', N'Bundi Nagar,Jammu', N'Jammu kashmir', N'Jammu', N'Jammu kashmir', 568924, N'/assets/img/Pan-Card204455120.jpg', N'/assets/img/Aadhar-Car204455118.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyam@gmail.com', N'1234567', N'4578595626', N'Ghanshyam', N'home', NULL, N'''Ahmedabad''', N'Gujarat', 487859, N'/assets/img/Pan-Card205543208.jpg', N'/assets/img/Aadhar-Car205512368.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyambhai@gmail.com', N'123456789', N'4859784725', N'ramesh', N'home4', NULL, N'''Ahmedabad''', N'Gujarat', 487859, N'/assets/img/Pan-Card205543208.jpg', N'/assets/img/Aadhar-Car205512368.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyampatel@gmail.com', N'123456', N'7956124859', N'Manasvini', N'home2', NULL, N'''gujarat''', N'gujarat', 264859, N'/assets/img/Pan-Card205543208.jpg', N'/assets/img/Aadhar-Car205512368.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyampatel123@gmail.com', N'c2h5YW0=', N'777-765-4278', N'Tejesh', N'Rampur,Vadali', N'Gujarat', N'Vadli', N'Gujarat', 353236, N'/assets/img/Pan-Card203149610.jpg', N'/assets/img/adhar-Car203149609.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyampatel199789@gmail.com', N'ZGhhcmFt', N'7777906453', N'Ghanshyam Patel', N'Vadali,Sabarkantha,Gujarat', N'Guajarat', N'vadali', N'Gujarat', 383235, N'/assets/img/Pan-Card205543208.jpg', N'/assets/img/Aadhar-Car205512368.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'jayantibhai.batli@gmail.com', N'SmF5YW50aQ==', N'777-092-6789', N'JayntiBhai Batlivada', N'SundarNagar', N'Jamnagar', N'Valsad', N'Gujarat', 363738, N'/assets/img/Pan-Card202720344.jpg', N'/assets/img/Aadhar-Car202720344.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'jickcn,z,,nzkckk', N'shyam', N'7622827845', N'Imthiyaz', N'vadali', N'gujarat', N'vadali', N'gujarat', 567845, N'/assets/img/pigs2201618505.jpg', N'/assets/img/oil-india-201617549.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'jickcn,z,,nzkckkc', N'shyam', N'7622827845', N'Jay', N'vadali', N'gujarat', N'vadali', N'gujarat', 567845, N'/assets/img/pigs2200017396.jpg', N'/assets/img/oil-india-200016355.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'jickcn,z,,nzkckkch', N'shyam', N'7622827845', N'Vijay', N'vadali', N'gujarat', N'vadali', N'gujarat', 567845, N'/assets/img/pigs2205430096.jpg', N'/assets/img/oil-india-205430083.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'jickcn,z,,nzkckkchk', N'shyam', N'khsjcn', N'Sundar', N'Bihari chock', N'KhauGali', N'Pune', N'Maharastra', 13145646, N'/assets/img/slide_27205242466.jpg', N'/assets/img/espectro-N205242445.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'njnkvjxknvkndskvk', N'shyam', N'1122313131', N'Kamlesh', N'Ghansoli', N'Mahape', N'Navi mumbai', N'Maharastra', 113121, N'/assets/img/slide_27200025657.jpg', N'/assets/img/espectro-N200025636.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ramesh@gmail.com', N'Ramesh', N'894-656-6554', N'Patel Rameshbhai', N'Khedbhrahma,Sabarkantha', N'Gujarat', N'vadali', N'Gujarat', 353231, N'/assets/img/Pan-Card205543208.jpg', N'/assets/img/Aadhar-Car205512368.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ravikumar123@gmail.com', N'Ravik', N'790-789-5645', N'Ravikumar', N'Jamnagar,Junagath', N'Delvada', N'Junagath', N'Gujarat', 789056, N'/assets/img/Pan-Card204510657.jpg', N'/assets/img/Aadhar-Car204510656.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'Shyam@gmail.com', N'12345678', N'4878895625', N'Mukesh', N'Udaygath', N'Chopal fali', N'Navi Mumbai', N'Mumbai', 485926, N'/assets/img/Pan-Card205543208.jpg', N'/assets/img/Aadhar-Car205512368.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'sk.imthiyaz4@gmail.com', N'c2hlaWs=', N'532-890-6543', N'Ravi Teja', N'Chulla, Kadiyadara', N'Sabarkantha', N'Kadiyadara', N'Gujarat', 353632, N'/assets/img/Pan-Card205637462.jpg', N'/assets/img/Aadhar-Car205637452.jpg')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'tejeshedunoori@gmail.com', N'123456789', N'1234567890', N'Tejesh Reddi', N'Tamilnadu', NULL, N'tamilnadu', N'tamilnadu', 652145, N'/assets/img/Pan-Card205543208.jpg', N'/assets/img/Aadhar-Car205512368.jpg')
GO
ALTER TABLE [dbo].[UserRegister] ADD  CONSTRAINT [DF_UserRegister_address1]  DEFAULT (getdate()) FOR [address1]
GO
ALTER TABLE [dbo].[BankDetails]  WITH CHECK ADD  CONSTRAINT [FK_266] FOREIGN KEY([UserID])
REFERENCES [dbo].[RollType] ([UserID])
GO
ALTER TABLE [dbo].[BankDetails] CHECK CONSTRAINT [FK_266]
GO
ALTER TABLE [dbo].[BiddingTable]  WITH CHECK ADD  CONSTRAINT [FK_235] FOREIGN KEY([FarmerSellID])
REFERENCES [dbo].[FarmerCropdetils] ([FarmerSellID])
GO
ALTER TABLE [dbo].[BiddingTable] CHECK CONSTRAINT [FK_235]
GO
ALTER TABLE [dbo].[BiddingTable]  WITH CHECK ADD  CONSTRAINT [FK_272] FOREIGN KEY([UserID])
REFERENCES [dbo].[RollType] ([UserID])
GO
ALTER TABLE [dbo].[BiddingTable] CHECK CONSTRAINT [FK_272]
GO
ALTER TABLE [dbo].[ClaimForm]  WITH CHECK ADD  CONSTRAINT [FK_185] FOREIGN KEY([PolicyNo])
REFERENCES [dbo].[InsuranceApplication] ([PolicyNo])
GO
ALTER TABLE [dbo].[ClaimForm] CHECK CONSTRAINT [FK_185]
GO
ALTER TABLE [dbo].[FarmerCropdetils]  WITH CHECK ADD  CONSTRAINT [FK_144] FOREIGN KEY([UserID])
REFERENCES [dbo].[RollType] ([UserID])
GO
ALTER TABLE [dbo].[FarmerCropdetils] CHECK CONSTRAINT [FK_144]
GO
ALTER TABLE [dbo].[FarmerCropdetils]  WITH CHECK ADD  CONSTRAINT [FK_228] FOREIGN KEY([CropId])
REFERENCES [dbo].[Cropprice] ([CropId])
GO
ALTER TABLE [dbo].[FarmerCropdetils] CHECK CONSTRAINT [FK_228]
GO
ALTER TABLE [dbo].[FarmerLand]  WITH CHECK ADD  CONSTRAINT [FK_258] FOREIGN KEY([UserID])
REFERENCES [dbo].[RollType] ([UserID])
GO
ALTER TABLE [dbo].[FarmerLand] CHECK CONSTRAINT [FK_258]
GO
ALTER TABLE [dbo].[InsuranceApplication]  WITH CHECK ADD  CONSTRAINT [FK_173] FOREIGN KEY([UserID])
REFERENCES [dbo].[RollType] ([UserID])
GO
ALTER TABLE [dbo].[InsuranceApplication] CHECK CONSTRAINT [FK_173]
GO
ALTER TABLE [dbo].[InsuranceApplication]  WITH CHECK ADD  CONSTRAINT [FK_276] FOREIGN KEY([FarmId])
REFERENCES [dbo].[FarmerLand] ([FarmId])
GO
ALTER TABLE [dbo].[InsuranceApplication] CHECK CONSTRAINT [FK_276]
GO
ALTER TABLE [dbo].[RollType]  WITH CHECK ADD  CONSTRAINT [FK_301] FOREIGN KEY([UserEmailId])
REFERENCES [dbo].[UserRegister] ([UserEmailId])
GO
ALTER TABLE [dbo].[RollType] CHECK CONSTRAINT [FK_301]
GO
/****** Object:  StoredProcedure [dbo].[MarketViewForBidder]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MarketViewForBidder]
as
begin
select f.FarmerSellID,f.cropType,c.cropname,c.MSP,b.bidAmount
from Cropprice c
Join FarmerCropdetils f
on c.CropId=f.CropId
Full outer Join BiddingTable b
on b.FarmerSellID=f.FarmerSellID
where f.AproovedFarmersell=1
order by f.AddedDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[MarketViewForBidderwithMaxBidAmount]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[MarketViewForBidderwithMaxBidAmount]
as
begin
select f.FarmerSellID,f.cropType,c.cropname,c.MSP,max(b.bidAmount) as 'bidAmount'
from Cropprice c
Join FarmerCropdetils f
on c.CropId=f.CropId
Full outer Join BiddingTable b
on b.FarmerSellID=f.FarmerSellID
where f.AproovedFarmersell=1
group by f.FarmerSellID,f.cropType,c.cropname,c.MSP,f.AddedDate
order by f.AddedDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[Soldhistory]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[Soldhistory]
as
begin
select b.date,c.cropname,c.MSP,f.quantity,b.bidAmount,(f.quantity*b.bidAmount)as'Totalprice' 
from BiddingTable as b join FarmerCropdetils as f on b.FarmerSellID=f.FarmerSellID
join Cropprice as c on c.CropId=f.CropId 
where b.ApprovedBid=1 
order by b.date desc
end
GO
/****** Object:  StoredProcedure [dbo].[ViewMarketplace]    Script Date: 12/2/2020 9:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ViewMarketplace]
as
begin
select f.cropType,c.cropname,c.MSP,b.bidAmount from FarmerCropdetils as f inner join Cropprice as c 
on  f.CropId=c.CropId inner join BiddingTable as b on b.FarmerSellID=f.FarmerSellID
order by b.Biddingdate desc;
end;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Basic information 
about Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FarmerCropdetils'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order information
like Date, Amount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RollType'
GO
USE [master]
GO
ALTER DATABASE [FarmerSchemeDB] SET  READ_WRITE 
GO
