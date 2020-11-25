/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2019 (15.0.2000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2019
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/
create database FarmerSchemeDB
go

USE [FarmerSchemeDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/19/2020 4:08:41 PM ******/
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
/****** Object:  Table [dbo].[BankDetails]    Script Date: 11/19/2020 4:08:41 PM ******/
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
/****** Object:  Table [dbo].[BiddingTable]    Script Date: 11/19/2020 4:08:41 PM ******/
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
 CONSTRAINT [PK_bid] PRIMARY KEY CLUSTERED 
(
	[BidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimForm]    Script Date: 11/19/2020 4:08:41 PM ******/
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
/****** Object:  Table [dbo].[Cropprice]    Script Date: 11/19/2020 4:08:41 PM ******/
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
/****** Object:  Table [dbo].[FarmerCropdetils]    Script Date: 11/19/2020 4:08:41 PM ******/
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
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[FarmerSellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmerLand]    Script Date: 11/19/2020 4:08:41 PM ******/
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
/****** Object:  Table [dbo].[InsuranceApplication]    Script Date: 11/19/2020 4:08:41 PM ******/
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
/****** Object:  Table [dbo].[RollType]    Script Date: 11/19/2020 4:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RollType](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RollType] [nvarchar](10) NULL,
	[certificate] [nvarchar](50) NULL,
	[ApprovedStatus] [bit] NULL,
	[UserEmailId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegister]    Script Date: 11/19/2020 4:08:41 PM ******/
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
	[pancardDocument] [nvarchar](50) NULL,
	[aadharCardDocument] [nvarchar](50) NULL,
 CONSTRAINT [PK_rolltype] PRIMARY KEY CLUSTERED 
(
	[UserEmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BiddingTable] ON 
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID]) VALUES (1, 1200, 1001, 0, CAST(N'2020-11-23' AS Date), 2)
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID]) VALUES (2, 700, 1006, 1, CAST(N'2020-11-12' AS Date), 3)
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID]) VALUES (3, 900, 1011, 1, CAST(N'2020-11-13' AS Date), 1)
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID]) VALUES (4, 800, 1012, 0, CAST(N'2020-12-14' AS Date), 7)
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID]) VALUES (5, 1500, 1013, 1, CAST(N'2020-10-24' AS Date), 10)
GO
INSERT [dbo].[BiddingTable] ([BidID], [bidAmount], [FarmerSellID], [ApprovedBid], [date], [UserID]) VALUES (6, 1600, 1013, 0, CAST(N'2020-10-10' AS Date), 10)
GO
SET IDENTITY_INSERT [dbo].[BiddingTable] OFF
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (1, N'pumpkin', 1200)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (2, N'cucumber', 1100)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (3, N'bitter groud', 800)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (4, N'Rice', 400)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (5, N'groundnut', 300)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (6, N'ragi', 450)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (7, N'bajra soybean', 700)
GO
INSERT [dbo].[Cropprice] ([CropId], [cropname], [MSP]) VALUES (8, N'maize', 800)
GO
SET IDENTITY_INSERT [dbo].[FarmerCropdetils] ON 
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1000, N'kharif', 1, N'Natural', 20, N'PH certificate', 1, 1)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1001, N'zaid', 2, N'Chemicl', 15, N'PH certificate2', 0, 2)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1006, N'ravi', 3, N'Chemical', 10, N'PH certificate3', 0, 3)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1011, N'kharif', 5, N'Natural', 17, N'PH certificate4', 1, 6)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1012, N'ravi', 8, N'Chemical', 10, N'PH certificate5', 0, 7)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1013, N'zaid', 7, N'Chemical', 7, N'PH certificate6', 1, 10)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1014, N'Ravi', 1, N'Natural', 40, N'Gare rahi gyu che', NULL, NULL)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1015, N'kharif', 1, N'kuchbhi use karte hai', 200, N'D:\desktop\dotnet training\Final Project\FarmerSchemeSellAndBiddingSolution\FarmerSchemeSellAndBidding\Image\slide_27201223267.jpg', NULL, NULL)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1016, N'kharif', 1, N'kuchbhi use karte hai', 200, N'D:\desktop\dotnet training\Final Project\FarmerSchemeSellAndBiddingSolution\FarmerSchemeSellAndBidding\Image\slide_27201302909.jpg', NULL, NULL)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1017, N'ravi', 1, N'natural', 1000, N'D:\desktop\dotnet training\Final Project\FarmerSchemeSellAndBiddingSolution\FarmerSchemeSellAndBidding\Image\pigs2200208645.jpg', NULL, NULL)
GO
INSERT [dbo].[FarmerCropdetils] ([FarmerSellID], [cropType], [CropId], [fertilizerType], [quantity], [SoilPHCertificate], [AproovedFarmersell], [UserID]) VALUES (1018, N'zaid', 1, N'chemical', 100, N'D:\desktop\dotnet training\Final Project\FarmerSchemeSellAndBiddingSolution\FarmerSchemeSellAndBidding\Image\IMG-201705204802803.jpg', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FarmerCropdetils] OFF
GO
SET IDENTITY_INSERT [dbo].[RollType] ON 
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (1, N'Farmer', N'Certificate', 0, N'ghanshyam@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (2, N'bidder', N'Certificate2', 1, N'ghanshyam@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (3, N'bidder', N'Certificate3', 0, N'ghanshyambhai@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (6, N'Farmer', N'certificate4', 1, N'ghanshyambhai@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (7, N'bidder', N'certificate5', 0, N'ghanshyampatel@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (9, N'Farmer', N'certificate6', 0, N'Shyam@gmail.com')
GO
INSERT [dbo].[RollType] ([UserID], [RollType], [certificate], [ApprovedStatus], [UserEmailId]) VALUES (10, N'Farmer', N'Certificate7', 1, N'ghanshyampatel@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[RollType] OFF
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyam@gmail.com', N'1234567', N'4578595626', N'Ghanshyam', N'home', NULL, N'''Ahmedabad''', N'Gujarat', 487859, N'''Pancard''', N'''Adharcard2''')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyambhai@gmail.com', N'123456789', N'4859784725', N'ramesh', N'home4', NULL, N'''Ahmedabad''', N'Gujarat', 487859, N'''Pancard''', N'''Adharcard2''')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'ghanshyampatel@gmail.com', N'123456', N'7956124859', N'ghashyam patel', N'home2', NULL, N'''gujarat''', N'gujarat', 264859, N'''Desktop''', N'''Aadharcard''')
GO
INSERT [dbo].[UserRegister] ([UserEmailId], [password], [ContactNo.], [fullname], [address1], [address2], [city], [state], [pincode], [pancardDocument], [aadharCardDocument]) VALUES (N'Shyam@gmail.com', N'12345678', N'4878895625', N'Mukesh', N'home3', N'mdfvkjknkjn', N'Navi Mumbai', N'Mumbai', 485926, N'''Pancard2''', N'''Adharcard3''')
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Basic information 
about Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FarmerCropdetils'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order information
like Date, Amount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RollType'
GO
