USE [master]
GO
/****** Object:  Database [CarInsurance]    Script Date: 16.05.2023 21:44:33 ******/
CREATE DATABASE [CarInsurance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarInsurance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\CarInsurance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarInsurance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\CarInsurance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CarInsurance] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarInsurance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarInsurance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarInsurance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarInsurance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarInsurance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarInsurance] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarInsurance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarInsurance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarInsurance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarInsurance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarInsurance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarInsurance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarInsurance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarInsurance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarInsurance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarInsurance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarInsurance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarInsurance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarInsurance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarInsurance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarInsurance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarInsurance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarInsurance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarInsurance] SET RECOVERY FULL 
GO
ALTER DATABASE [CarInsurance] SET  MULTI_USER 
GO
ALTER DATABASE [CarInsurance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarInsurance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarInsurance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarInsurance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarInsurance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarInsurance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarInsurance', N'ON'
GO
ALTER DATABASE [CarInsurance] SET QUERY_STORE = OFF
GO
USE [CarInsurance]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](10) NOT NULL,
	[Horsepower] [float] NOT NULL,
	[VIN] [nvarchar](100) NOT NULL,
	[DriverId] [int] NOT NULL,
	[Passport] [nvarchar](150) NOT NULL,
	[DateOfPurchase] [date] NOT NULL,
	[ModelsId] [int] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casco]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casco](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [int] NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
	[CarId] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Casco] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Surname] [nvarchar](150) NOT NULL,
	[Patronic] [nvarchar](150) NOT NULL,
	[PassportData] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DriverLicense] [nvarchar](10) NOT NULL,
	[Experience] [date] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Make] [nvarchar](150) NOT NULL,
	[ModelName] [nvarchar](150) NOT NULL,
	[Category] [nvarchar](150) NOT NULL,
	[Year] [nvarchar](50) NOT NULL,
	[ModelYear] [nvarchar](200) NULL,
	[Price] [nvarchar](20) NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Osago]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Osago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
	[CarId] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Osago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CoefficientForOsago] [float] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Surename] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.05.2023 21:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name]) VALUES (1, N'BMW')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (2, N'Audi')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (3, N'FIAT')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (4, N'Ram')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (5, N'GMC')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (6, N'Chevrolet')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (7, N'Chrysler')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (8, N'Nissan')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (9, N'MAZDA')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (10, N'Mercedes-Benz')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (11, N'Ferrari')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (12, N'Maybach')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (13, N'McLaren')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (14, N'Porsche')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (15, N'Hyundai')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (16, N'Suzuki')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (17, N'Ford')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (18, N'Toyota')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (19, N'Dodge')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (20, N'Lamborghini')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (21, N'Volvo')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (22, N'Honda')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (23, N'Cadillac')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (24, N'MINI')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (25, N'Lexsus')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([Id], [Number], [Horsepower], [VIN], [DriverId], [Passport], [DateOfPurchase], [ModelsId]) VALUES (3, N'T074MM16', 276, N'ADFSDFAOK345325', 1, N'78TO1234NASDF', CAST(N'2010-01-28' AS Date), 325)
INSERT [dbo].[Car] ([Id], [Number], [Horsepower], [VIN], [DriverId], [Passport], [DateOfPurchase], [ModelsId]) VALUES (5, N'T074MM116', 270, N'asdfqwer1234', 1, N'qwerasdf12341324', CAST(N'2007-01-01' AS Date), 146)
INSERT [dbo].[Car] ([Id], [Number], [Horsepower], [VIN], [DriverId], [Passport], [DateOfPurchase], [ModelsId]) VALUES (7, N'T056MM116', 234, N'asdfasdfaqwer', 1, N'25TX205766', CAST(N'0001-01-01' AS Date), 155)
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Casco] ON 

INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (1, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 59825.349597000008)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (2, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 119650.69919400002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (3, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 59825.349597000008)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (4, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 5, 43926.999690000004)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (5, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 119650.69919400002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (6, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 3, 13540.800000000001)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (7, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 3, 27081.600000000002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (8, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 59825.349597000008)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (9, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 119650.69919400002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (10, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 59825.349597000008)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (11, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 5, 43926.999690000004)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (12, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 119650.69919400002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (13, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 3, 13540.800000000001)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (14, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 3, 27081.600000000002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (15, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 59825.349597000008)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (16, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 119650.69919400002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (17, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 59825.349597000008)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (18, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 5, 43926.999690000004)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (19, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 119650.69919400002)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (20, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 3, 13540.800000000001)
INSERT [dbo].[Casco] ([Id], [DriverId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (21, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 3, 27081.600000000002)
SET IDENTITY_INSERT [dbo].[Casco] OFF
GO
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([Id], [UserId], [Name], [Surname], [Patronic], [PassportData], [Phone], [Email], [DriverLicense], [Experience], [DateOfBirth]) VALUES (1, 8, N'Arthur', N'Aipov', N'Timurovich', N'1234990011', N'9870084416', N'aipov2@gmail.com', N'1234567891', CAST(N'2003-08-23' AS Date), CAST(N'1985-07-18' AS Date))
INSERT [dbo].[Driver] ([Id], [UserId], [Name], [Surname], [Patronic], [PassportData], [Phone], [Email], [DriverLicense], [Experience], [DateOfBirth]) VALUES (2, 1, N'Arthur', N'Aipov', N'Timurovich', N'1234990013', N'9870084416', N'aipov2@gmail.com', N'1234567890', CAST(N'2003-08-23' AS Date), CAST(N'1999-01-20' AS Date))
INSERT [dbo].[Driver] ([Id], [UserId], [Name], [Surname], [Patronic], [PassportData], [Phone], [Email], [DriverLicense], [Experience], [DateOfBirth]) VALUES (3, 7, N'Arthur', N'Aipov', N'Timurovich', N'1234123412', N'1111222333', N'aipov2@gmail.com', N'1234657892', CAST(N'2023-05-15' AS Date), CAST(N'2005-01-19' AS Date))
INSERT [dbo].[Driver] ([Id], [UserId], [Name], [Surname], [Patronic], [PassportData], [Phone], [Email], [DriverLicense], [Experience], [DateOfBirth]) VALUES (4, 6, N'Arthur', N'Aipov', N'Aleksandrovich', N'1234123456', N'1234567890', N'aipov2@gmail.com', N'1234123412', CAST(N'2023-05-15' AS Date), CAST(N'2005-04-27' AS Date))
INSERT [dbo].[Driver] ([Id], [UserId], [Name], [Surname], [Patronic], [PassportData], [Phone], [Email], [DriverLicense], [Experience], [DateOfBirth]) VALUES (5, 6, N'Arthur', N'Aipov', N'Aleksandrovich', N'1234123456', N'1234567890', N'aipov2@gmail.com', N'1234123412', CAST(N'2023-05-15' AS Date), CAST(N'2005-04-06' AS Date))
SET IDENTITY_INSERT [dbo].[Driver] OFF
GO
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (1, N'BMW', N'1 Series', N'Coupe, Convertible', N'2013', N'1 Series 2013', N'1000000')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (2, N'BMW', N'1 Series', N'Convertible, Coupe', N'2012', N'1 Series 2012', N'1200000')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (3, N'BMW', N'1 Series', N'Coupe, Convertible', N'2011', N'1 Series 2011', N'1500000')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (4, N'BMW', N'1 Series', N'Coupe, Convertible', N'2010', N'1 Series 2010', N'1733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (5, N'BMW', N'1 Series', N'Coupe, Convertible', N'2009', N'1 Series 2009', N'1983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (6, N'BMW', N'1 Series', N'Coupe, Convertible', N'2008', N'1 Series 2008', N'2233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (7, N'Audi', N'100', N'Wagon, Sedan', N'1994', N'100 1994', N'2483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (8, N'Audi', N'100', N'Sedan, Wagon', N'1993', N'100 1993', N'2733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (9, N'Audi', N'100', N'Sedan, Wagon', N'1992', N'100 1992', N'2983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (10, N'FIAT', N'124 Spider', N'Convertible', N'2019', N'124 Spider 2019', N'3233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (11, N'FIAT', N'124 Spider', N'Convertible', N'2018', N'124 Spider 2018', N'3483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (12, N'FIAT', N'124 Spider', N'Convertible', N'2017', N'124 Spider 2017', N'3733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (13, N'Ram', N'1500 Classic Crew Cab', N'Pickup', N'2019', N'1500 Classic Crew Cab 2019', N'3983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (14, N'Ram', N'1500 Classic Quad Cab', N'Pickup', N'2019', N'1500 Classic Quad Cab 2019', N'4233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (15, N'Ram', N'1500 Classic Regular Cab', N'Pickup', N'2019', N'1500 Classic Regular Cab 2019', N'4483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (16, N'GMC', N'1500 Club Coupe', N'Pickup', N'1999', N'1500 Club Coupe 1999', N'4733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (17, N'GMC', N'1500 Club Coupe', N'Pickup', N'1998', N'1500 Club Coupe 1998', N'4983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (18, N'GMC', N'1500 Club Coupe', N'Pickup', N'1997', N'1500 Club Coupe 1997', N'5233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (19, N'GMC', N'1500 Club Coupe', N'Pickup', N'1996', N'1500 Club Coupe 1996', N'5483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (20, N'GMC', N'1500 Club Coupe', N'Pickup', N'1995', N'1500 Club Coupe 1995', N'5733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (21, N'GMC', N'1500 Club Coupe', N'Pickup', N'1994', N'1500 Club Coupe 1994', N'5983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (22, N'GMC', N'1500 Club Coupe', N'Pickup', N'1993', N'1500 Club Coupe 1993', N'6233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (23, N'GMC', N'1500 Club Coupe', N'Pickup', N'1992', N'1500 Club Coupe 1992', N'6483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (24, N'Ram', N'1500 Crew Cab', N'Pickup', N'2020', N'1500 Crew Cab 2020', N'6733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (25, N'Ram', N'1500 Crew Cab', N'Pickup', N'2019', N'1500 Crew Cab 2019', N'6983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (26, N'Ram', N'1500 Crew Cab', N'Pickup', N'2018', N'1500 Crew Cab 2018', N'7233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (27, N'Ram', N'1500 Crew Cab', N'Pickup', N'2017', N'1500 Crew Cab 2017', N'7483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (28, N'Ram', N'1500 Crew Cab', N'Pickup', N'2016', N'1500 Crew Cab 2016', N'7733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (29, N'Ram', N'1500 Crew Cab', N'Pickup', N'2015', N'1500 Crew Cab 2015', N'7983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (30, N'Ram', N'1500 Crew Cab', N'Pickup', N'2014', N'1500 Crew Cab 2014', N'8233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (31, N'Ram', N'1500 Crew Cab', N'Pickup', N'2013', N'1500 Crew Cab 2013', N'8483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (32, N'Ram', N'1500 Crew Cab', N'Pickup', N'2012', N'1500 Crew Cab 2012', N'8733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (33, N'Ram', N'1500 Crew Cab', N'Pickup', N'2011', N'1500 Crew Cab 2011', N'8983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (34, N'Ram', N'1500 Crew Cab', N'Pickup', N'2021', N'1500 Crew Cab 2021', N'9233333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (35, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1999', N'1500 Extended Cab 1999', N'9483333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (36, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1998', N'1500 Extended Cab 1998', N'9733333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (37, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1997', N'1500 Extended Cab 1997', N'9983333,333')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (38, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1996', N'1500 Extended Cab 1996', N'10233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (39, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1995', N'1500 Extended Cab 1995', N'10483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (40, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1994', N'1500 Extended Cab 1994', N'10733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (41, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1993', N'1500 Extended Cab 1993', N'10983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (42, N'Chevrolet', N'1500 Extended Cab', N'Pickup', N'1992', N'1500 Extended Cab 1992', N'11233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (43, N'Ram', N'1500 Quad Cab', N'Pickup', N'2019', N'1500 Quad Cab 2019', N'11483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (44, N'Ram', N'1500 Quad Cab', N'Pickup', N'2018', N'1500 Quad Cab 2018', N'11733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (45, N'Ram', N'1500 Quad Cab', N'Pickup', N'2017', N'1500 Quad Cab 2017', N'11983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (46, N'Ram', N'1500 Quad Cab', N'Pickup', N'2016', N'1500 Quad Cab 2016', N'12233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (47, N'Ram', N'1500 Quad Cab', N'Pickup', N'2015', N'1500 Quad Cab 2015', N'12483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (48, N'Ram', N'1500 Quad Cab', N'Pickup', N'2014', N'1500 Quad Cab 2014', N'12733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (49, N'Ram', N'1500 Quad Cab', N'Pickup', N'2013', N'1500 Quad Cab 2013', N'12983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (50, N'Ram', N'1500 Quad Cab', N'Pickup', N'2012', N'1500 Quad Cab 2012', N'13233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (51, N'Ram', N'1500 Quad Cab', N'Pickup', N'2011', N'1500 Quad Cab 2011', N'13483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (52, N'Ram', N'1500 Regular Cab', N'Pickup', N'2018', N'1500 Regular Cab 2018', N'13733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (53, N'Ram', N'1500 Regular Cab', N'Pickup', N'2017', N'1500 Regular Cab 2017', N'13983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (54, N'Ram', N'1500 Regular Cab', N'Pickup', N'2016', N'1500 Regular Cab 2016', N'14233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (55, N'Ram', N'1500 Regular Cab', N'Pickup', N'2015', N'1500 Regular Cab 2015', N'14483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (56, N'Ram', N'1500 Regular Cab', N'Pickup', N'2014', N'1500 Regular Cab 2014', N'14733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (57, N'Ram', N'1500 Regular Cab', N'Pickup', N'2013', N'1500 Regular Cab 2013', N'14983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (58, N'Ram', N'1500 Regular Cab', N'Pickup', N'2012', N'1500 Regular Cab 2012', N'15233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (59, N'Ram', N'1500 Regular Cab', N'Pickup', N'2011', N'1500 Regular Cab 2011', N'15483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (60, N'Chevrolet', N'1500 Regular Cab', N'Pickup', N'1998', N'1500 Regular Cab 1998', N'15733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (61, N'Chrysler', N'300M', N'Sedan', N'2004', N'300M 2004', N'15983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (62, N'Chrysler', N'300M', N'Sedan', N'2003', N'300M 2003', N'16233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (63, N'Chrysler', N'300M', N'Sedan', N'2002', N'300M 2002', N'16483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (64, N'Chrysler', N'300M', N'Sedan', N'2001', N'300M 2001', N'16733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (65, N'Chrysler', N'300M', N'Sedan', N'2000', N'300M 2000', N'16983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (66, N'Nissan', N'300ZX', N'Hatchback, Convertible', N'1996', N'300ZX 1996', N'17233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (67, N'Nissan', N'300ZX', N'Hatchback, Convertible', N'1995', N'300ZX 1995', N'17483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (68, N'Nissan', N'300ZX', N'Hatchback, Convertible', N'1994', N'300ZX 1994', N'17733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (69, N'Nissan', N'300ZX', N'Hatchback, Convertible', N'1993', N'300ZX 1993', N'17983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (70, N'Nissan', N'300ZX', N'Hatchback', N'1992', N'300ZX 1992', N'18233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (71, N'MAZDA', N'323', N'Hatchback', N'1994', N'323 1994', N'18483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (72, N'MAZDA', N'323', N'Hatchback', N'1993', N'323 1993', N'18733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (73, N'MAZDA', N'323', N'Hatchback', N'1992', N'323 1992', N'18983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (74, N'GMC', N'3500 Club Coupe', N'Pickup', N'1998', N'3500 Club Coupe 1998', N'19233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (75, N'GMC', N'3500 Club Coupe', N'Pickup', N'1997', N'3500 Club Coupe 1997', N'19483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (76, N'GMC', N'3500 Club Coupe', N'Pickup', N'1996', N'3500 Club Coupe 1996', N'19733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (77, N'GMC', N'3500 Club Coupe', N'Pickup', N'1995', N'3500 Club Coupe 1995', N'19983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (78, N'GMC', N'3500 Club Coupe', N'Pickup', N'1994', N'3500 Club Coupe 1994', N'20233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (79, N'GMC', N'3500 Club Coupe', N'Pickup', N'1993', N'3500 Club Coupe 1993', N'20483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (80, N'GMC', N'3500 Club Coupe', N'Pickup', N'1992', N'3500 Club Coupe 1992', N'20733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (81, N'Nissan', N'370Z', N'Coupe, Convertible', N'2019', N'370Z 2019', N'20983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (82, N'Nissan', N'370Z', N'Coupe, Convertible', N'2018', N'370Z 2018', N'21233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (83, N'Nissan', N'370Z', N'Coupe, Convertible', N'2017', N'370Z 2017', N'21483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (84, N'Nissan', N'370Z', N'Coupe, Convertible', N'2016', N'370Z 2016', N'21733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (85, N'Nissan', N'370Z', N'Coupe, Convertible', N'2015', N'370Z 2015', N'21983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (86, N'Nissan', N'370Z', N'Coupe, Convertible', N'2014', N'370Z 2014', N'22233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (87, N'Nissan', N'370Z', N'Coupe, Convertible', N'2013', N'370Z 2013', N'22483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (88, N'Nissan', N'370Z', N'Convertible, Coupe', N'2012', N'370Z 2012', N'22733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (89, N'Nissan', N'370Z', N'Coupe, Convertible', N'2011', N'370Z 2011', N'22983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (90, N'Nissan', N'370Z', N'Convertible, Coupe', N'2010', N'370Z 2010', N'23233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (91, N'Nissan', N'370Z', N'Coupe', N'2009', N'370Z 2009', N'23483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (92, N'BMW', N'4 Series', N'Convertible, Sedan, Coupe', N'2019', N'4 Series 2019', N'23733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (93, N'BMW', N'4 Series', N'Coupe, Sedan, Convertible', N'2018', N'4 Series 2018', N'23983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (94, N'BMW', N'4 Series', N'Sedan, Coupe, Convertible', N'2017', N'4 Series 2017', N'24233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (95, N'BMW', N'4 Series', N'Coupe, Convertible', N'2016', N'4 Series 2016', N'24483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (96, N'BMW', N'4 Series', N'Coupe, Convertible', N'2015', N'4 Series 2015', N'24733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (97, N'BMW', N'4 Series', N'Coupe, Convertible', N'2014', N'4 Series 2014', N'24983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (98, N'Mercedes-Benz', N'400 E', N'Sedan', N'1993', N'400 E 1993', N'25233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (99, N'Mercedes-Benz', N'400 E', N'Sedan', N'1992', N'400 E 1992', N'25483333,33')
GO
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (100, N'Mercedes-Benz', N'400 SE', N'Sedan', N'1992', N'400 SE 1992', N'25733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (101, N'Mercedes-Benz', N'400 SEL', N'Sedan', N'1993', N'400 SEL 1993', N'25983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (102, N'Ferrari', N'430 Scuderia', N'Coupe, Convertible', N'2009', N'430 Scuderia 2009', N'26233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (103, N'Ferrari', N'430 Scuderia', N'Coupe', N'2008', N'430 Scuderia 2008', N'26483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (104, N'Ferrari', N'458 Italia', N'Coupe', N'2015', N'458 Italia 2015', N'26733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (105, N'Ferrari', N'458 Italia', N'Coupe', N'2014', N'458 Italia 2014', N'26983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (106, N'Ferrari', N'458 Italia', N'Coupe', N'2013', N'458 Italia 2013', N'27233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (107, N'Ferrari', N'458 Italia', N'Coupe', N'2012', N'458 Italia 2012', N'27483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (108, N'Ferrari', N'458 Italia', N'Coupe', N'2011', N'458 Italia 2011', N'27733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (109, N'Ferrari', N'458 Italia', N'Coupe', N'2010', N'458 Italia 2010', N'27983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (110, N'Ferrari', N'458 Speciale', N'Coupe', N'2015', N'458 Speciale 2015', N'28233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (111, N'Ferrari', N'458 Speciale', N'Coupe', N'2014', N'458 Speciale 2014', N'28483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (112, N'Ferrari', N'458 Spider', N'Convertible', N'2015', N'458 Spider 2015', N'28733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (113, N'Ferrari', N'458 Spider', N'Convertible', N'2014', N'458 Spider 2014', N'28983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (114, N'Ferrari', N'458 Spider', N'Convertible', N'2013', N'458 Spider 2013', N'29233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (115, N'Ferrari', N'488 GTB', N'Coupe', N'2018', N'488 GTB 2018', N'29483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (116, N'Ferrari', N'488 GTB', N'Coupe', N'2017', N'488 GTB 2017', N'29733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (117, N'Ferrari', N'488 GTB', N'Coupe', N'2016', N'488 GTB 2016', N'29983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (118, N'Ferrari', N'488 Spider', N'Convertible', N'2018', N'488 Spider 2018', N'30233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (119, N'Ferrari', N'488 Spider', N'Convertible', N'2017', N'488 Spider 2017', N'30483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (120, N'Ferrari', N'488 Spider', N'Convertible', N'2016', N'488 Spider 2016', N'30733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (121, N'BMW', N'5 Series', N'Sedan, Wagon', N'2009', N'5 Series 2009', N'30983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (122, N'BMW', N'5 Series', N'Sedan, Wagon', N'2008', N'5 Series 2008', N'31233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (123, N'BMW', N'5 Series', N'Sedan, Wagon', N'2007', N'5 Series 2007', N'31483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (124, N'BMW', N'5 Series', N'Sedan, Wagon', N'2006', N'5 Series 2006', N'31733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (125, N'BMW', N'5 Series', N'Sedan', N'2005', N'5 Series 2005', N'31983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (126, N'BMW', N'5 Series', N'Sedan', N'2004', N'5 Series 2004', N'32233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (127, N'BMW', N'5 Series', N'Sedan, Wagon', N'2003', N'5 Series 2003', N'32483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (128, N'BMW', N'5 Series', N'Sedan, Wagon', N'2002', N'5 Series 2002', N'32733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (129, N'BMW', N'5 Series', N'Wagon, Sedan', N'2001', N'5 Series 2001', N'32983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (130, N'BMW', N'5 Series', N'Sedan, Wagon', N'2000', N'5 Series 2000', N'33233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (131, N'BMW', N'5 Series', N'Wagon, Sedan', N'1999', N'5 Series 1999', N'33483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (132, N'BMW', N'5 Series', N'Sedan', N'1998', N'5 Series 1998', N'33733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (133, N'Mercedes-Benz', N'600 SEC', N'Coupe', N'1993', N'600 SEC 1993', N'33983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (134, N'Mercedes-Benz', N'600 SEL', N'Sedan', N'1993', N'600 SEL 1993', N'34233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (135, N'Mercedes-Benz', N'600 SEL', N'Sedan', N'1992', N'600 SEL 1992', N'34483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (136, N'Mercedes-Benz', N'600 SL', N'Convertible', N'1993', N'600 SL 1993', N'34733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (137, N'Ferrari', N'612 Scaglietti', N'Coupe', N'2011', N'612 Scaglietti 2011', N'34983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (138, N'Ferrari', N'612 Scaglietti', N'Coupe', N'2010', N'612 Scaglietti 2010', N'35233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (139, N'Ferrari', N'612 Scaglietti', N'Coupe', N'2009', N'612 Scaglietti 2009', N'35483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (140, N'Ferrari', N'612 Scaglietti', N'Coupe', N'2008', N'612 Scaglietti 2008', N'35733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (141, N'Ferrari', N'612 Scaglietti', N'Coupe', N'2007', N'612 Scaglietti 2007', N'35983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (142, N'Ferrari', N'612 Scaglietti', N'Coupe', N'2006', N'612 Scaglietti 2006', N'36233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (143, N'Maybach', N'62', N'Sedan', N'2012', N'62 2012', N'36483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (144, N'Maybach', N'62', N'Sedan', N'2011', N'62 2011', N'36733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (145, N'Maybach', N'62', N'Sedan', N'2010', N'62 2010', N'36983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (146, N'Maybach', N'62', N'Sedan', N'2009', N'62 2009', N'37233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (147, N'Maybach', N'62', N'Sedan', N'2008', N'62 2008', N'37483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (148, N'Maybach', N'62', N'Sedan', N'2007', N'62 2007', N'37733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (149, N'Maybach', N'62', N'Sedan', N'2006', N'62 2006', N'37983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (150, N'Maybach', N'62', N'Sedan', N'2005', N'62 2005', N'38233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (151, N'MAZDA', N'626', N'Sedan', N'2002', N'626 2002', N'38483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (152, N'MAZDA', N'626', N'Sedan', N'2001', N'626 2001', N'38733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (153, N'McLaren', N'650S', N'Convertible, Coupe', N'2016', N'650S 2016', N'38983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (154, N'McLaren', N'650S', N'Coupe, Convertible', N'2015', N'650S 2015', N'39233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (155, N'McLaren', N'675LT', N'Coupe', N'2016', N'675LT 2016', N'39483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (156, N'BMW', N'7 Series', N'Sedan', N'2020', N'7 Series 2020', N'39733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (157, N'Porsche', N'911', N'Convertible', N'2020', N'911 2020', N'39983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (158, N'Porsche', N'911', N'Coupe, Convertible', N'2019', N'911 2019', N'40233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (159, N'Porsche', N'911', N'Coupe, Convertible', N'2018', N'911 2018', N'40483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (160, N'Porsche', N'911', N'Coupe, Convertible', N'2017', N'911 2017', N'40733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (161, N'Porsche', N'911', N'Coupe, Convertible', N'2016', N'911 2016', N'40983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (162, N'Porsche', N'911', N'Coupe, Convertible', N'2015', N'911 2015', N'41233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (163, N'Porsche', N'911', N'Coupe, Convertible', N'2014', N'911 2014', N'41483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (164, N'Porsche', N'911', N'Coupe, Convertible', N'2013', N'911 2013', N'41733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (165, N'Porsche', N'911', N'Coupe, Convertible', N'2012', N'911 2012', N'41983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (166, N'Porsche', N'911', N'Convertible, Coupe', N'2011', N'911 2011', N'42233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (167, N'Porsche', N'911', N'Coupe, Convertible', N'2010', N'911 2010', N'42483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (168, N'Porsche', N'911', N'Coupe, Convertible', N'2009', N'911 2009', N'42733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (169, N'Porsche', N'911', N'Coupe, Convertible', N'2008', N'911 2008', N'42983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (170, N'Porsche', N'911', N'Coupe, Convertible', N'2007', N'911 2007', N'43233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (171, N'Porsche', N'911', N'Coupe, Convertible', N'2006', N'911 2006', N'43483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (172, N'Porsche', N'911', N'Coupe, Convertible', N'2005', N'911 2005', N'43733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (173, N'Porsche', N'911', N'Convertible, Coupe', N'2004', N'911 2004', N'43983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (174, N'Audi', N'A4', N'Sedan', N'1996', N'A4 1996', N'44233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (175, N'Audi', N'A4 (2005.5)', N'Sedan, Wagon', N'2005', N'A4 (2005.5) 2005', N'44483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (176, N'Audi', N'A4 allroad', N'Wagon', N'2019', N'A4 allroad 2019', N'44733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (177, N'Audi', N'A4 allroad', N'Wagon', N'2018', N'A4 allroad 2018', N'44983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (178, N'Audi', N'A4 allroad', N'Wagon', N'2017', N'A4 allroad 2017', N'45233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (179, N'Audi', N'A5', N'Coupe, Sedan, Convertible', N'2019', N'A5 2019', N'45483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (180, N'Audi', N'A5', N'Coupe, Convertible, Sedan', N'2018', N'A5 2018', N'45733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (181, N'Audi', N'A5', N'Coupe, Convertible', N'2016', N'A5 2016', N'45983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (182, N'Audi', N'A5', N'Coupe, Convertible', N'2015', N'A5 2015', N'46233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (183, N'Audi', N'A5', N'Coupe, Convertible', N'2014', N'A5 2014', N'46483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (184, N'Audi', N'A5', N'Convertible, Coupe', N'2013', N'A5 2013', N'46733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (185, N'Audi', N'A5', N'Convertible, Coupe', N'2012', N'A5 2012', N'46983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (186, N'Audi', N'A5', N'Coupe, Convertible', N'2011', N'A5 2011', N'47233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (187, N'Audi', N'A5', N'Coupe, Convertible', N'2010', N'A5 2010', N'47483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (188, N'Audi', N'A5', N'Coupe', N'2009', N'A5 2009', N'47733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (189, N'Audi', N'A5', N'Coupe', N'2008', N'A5 2008', N'47983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (190, N'Audi', N'A5 Sport', N'Convertible, Coupe', N'2017', N'A5 Sport 2017', N'48233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (191, N'Audi', N'A6', N'Sedan', N'2019', N'A6 2019', N'48483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (192, N'Audi', N'A6', N'Sedan', N'2018', N'A6 2018', N'48733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (193, N'Audi', N'A6', N'Sedan', N'2017', N'A6 2017', N'48983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (194, N'Hyundai', N'Accent', N'Sedan', N'2020', N'Accent 2020', N'49233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (195, N'Hyundai', N'Accent', N'Sedan', N'2019', N'Accent 2019', N'49483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (196, N'Hyundai', N'Accent', N'Sedan', N'2018', N'Accent 2018', N'49733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (197, N'Hyundai', N'Accent', N'Sedan, Hatchback', N'2017', N'Accent 2017', N'49983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (198, N'Hyundai', N'Accent', N'Hatchback, Sedan', N'2016', N'Accent 2016', N'50233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (199, N'Hyundai', N'Accent', N'Sedan, Hatchback', N'2015', N'Accent 2015', N'50483333,33')
GO
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (200, N'Hyundai', N'Accent', N'Hatchback, Sedan', N'2014', N'Accent 2014', N'50733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (201, N'Hyundai', N'Accent', N'Sedan, Hatchback', N'2013', N'Accent 2013', N'50983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (202, N'Hyundai', N'Accent', N'Sedan, Hatchback', N'2012', N'Accent 2012', N'51233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (203, N'Hyundai', N'Accent', N'Sedan, Hatchback', N'2011', N'Accent 2011', N'51483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (204, N'Hyundai', N'Accent', N'Hatchback, Sedan', N'2010', N'Accent 2010', N'51733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (205, N'Hyundai', N'Accent', N'Hatchback, Sedan', N'2009', N'Accent 2009', N'51983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (206, N'Hyundai', N'Accent', N'Hatchback, Sedan', N'2008', N'Accent 2008', N'52233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (207, N'Hyundai', N'Accent', N'Hatchback, Sedan', N'2007', N'Accent 2007', N'52483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (208, N'Hyundai', N'Accent', N'Sedan', N'2006', N'Accent 2006', N'52733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (209, N'Suzuki', N'Aerio', N'Sedan', N'2007', N'Aerio 2007', N'52983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (210, N'Suzuki', N'Aerio', N'Sedan, Wagon', N'2006', N'Aerio 2006', N'53233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (211, N'Suzuki', N'Aerio', N'Sedan, Wagon', N'2005', N'Aerio 2005', N'53483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (212, N'Suzuki', N'Aerio', N'Sedan, Wagon', N'2004', N'Aerio 2004', N'53733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (213, N'Suzuki', N'Aerio', N'Sedan, Wagon', N'2003', N'Aerio 2003', N'53983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (214, N'Suzuki', N'Aerio', N'Wagon, Sedan', N'2002', N'Aerio 2002', N'54233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (215, N'Ford', N'Aerostar Cargo', N'Van/Minivan', N'1997', N'Aerostar Cargo 1997', N'54483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (216, N'Ford', N'Aerostar Cargo', N'Van/Minivan', N'1996', N'Aerostar Cargo 1996', N'54733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (217, N'Ford', N'Aerostar Cargo', N'Van/Minivan', N'1995', N'Aerostar Cargo 1995', N'54983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (218, N'Ford', N'Aerostar Cargo', N'Van/Minivan', N'1994', N'Aerostar Cargo 1994', N'55233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (219, N'Ford', N'Aerostar Cargo', N'Van/Minivan', N'1993', N'Aerostar Cargo 1993', N'55483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (220, N'Ford', N'Aerostar Cargo', N'Van/Minivan', N'1992', N'Aerostar Cargo 1992', N'55733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (221, N'Ford', N'Aerostar Passenger', N'Van/Minivan', N'1997', N'Aerostar Passenger 1997', N'55983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (222, N'Ford', N'Aerostar Passenger', N'Van/Minivan', N'1996', N'Aerostar Passenger 1996', N'56233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (223, N'Ford', N'Aerostar Passenger', N'Van/Minivan', N'1995', N'Aerostar Passenger 1995', N'56483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (224, N'Ford', N'Aerostar Passenger', N'Van/Minivan', N'1994', N'Aerostar Passenger 1994', N'56733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (225, N'Ford', N'Aerostar Passenger', N'Van/Minivan', N'1993', N'Aerostar Passenger 1993', N'56983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (226, N'Ford', N'Aerostar Passenger', N'Van/Minivan', N'1992', N'Aerostar Passenger 1992', N'57233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (227, N'Toyota', N'Avalon Hybrid', N'Sedan', N'2021', N'Avalon Hybrid 2021', N'57483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (228, N'Dodge', N'Avenger', N'Sedan', N'2014', N'Avenger 2014', N'57733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (229, N'Dodge', N'Avenger', N'Sedan', N'2013', N'Avenger 2013', N'57983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (230, N'Dodge', N'Avenger', N'Sedan', N'2012', N'Avenger 2012', N'58233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (231, N'Dodge', N'Avenger', N'Sedan', N'2011', N'Avenger 2011', N'58483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (232, N'Dodge', N'Avenger', N'Sedan', N'2010', N'Avenger 2010', N'58733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (233, N'Dodge', N'Avenger', N'Sedan', N'2009', N'Avenger 2009', N'58983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (234, N'Dodge', N'Avenger', N'Sedan', N'2008', N'Avenger 2008', N'59233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (235, N'Dodge', N'Avenger', N'Coupe', N'2000', N'Avenger 2000', N'59483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (236, N'Dodge', N'Avenger', N'Coupe', N'1999', N'Avenger 1999', N'59733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (237, N'Dodge', N'Avenger', N'Coupe', N'1998', N'Avenger 1998', N'59983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (238, N'Dodge', N'Avenger', N'Coupe', N'1997', N'Avenger 1997', N'60233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (239, N'Dodge', N'Avenger', N'Coupe', N'1996', N'Avenger 1996', N'60483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (240, N'Dodge', N'Avenger', N'Coupe', N'1995', N'Avenger 1995', N'60733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (241, N'Lamborghini', N'Aventador', N'Convertible, Coupe', N'2018', N'Aventador 2018', N'60983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (242, N'Lamborghini', N'Aventador', N'Coupe, Convertible', N'2017', N'Aventador 2017', N'61233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (243, N'Lamborghini', N'Aventador', N'Convertible, Coupe', N'2016', N'Aventador 2016', N'61483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (244, N'Lamborghini', N'Aventador', N'Coupe, Convertible', N'2015', N'Aventador 2015', N'61733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (245, N'Lamborghini', N'Aventador', N'Coupe, Convertible', N'2014', N'Aventador 2014', N'61983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (246, N'Lamborghini', N'Aventador', N'Coupe, Convertible', N'2013', N'Aventador 2013', N'62233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (247, N'Volvo', N'C30', N'Hatchback', N'2013', N'C30 2013', N'62483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (248, N'Volvo', N'C30', N'Hatchback', N'2012', N'C30 2012', N'62733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (249, N'Volvo', N'C30', N'Hatchback', N'2011', N'C30 2011', N'62983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (250, N'Volvo', N'C30', N'Hatchback', N'2010', N'C30 2010', N'63233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (251, N'Volvo', N'C30', N'Hatchback', N'2009', N'C30 2009', N'63483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (252, N'Volvo', N'C30', N'Hatchback', N'2008', N'C30 2008', N'63733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (253, N'Volvo', N'C70', N'Convertible', N'2013', N'C70 2013', N'63983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (254, N'Volvo', N'C70', N'Convertible', N'2012', N'C70 2012', N'64233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (255, N'Volvo', N'C70', N'Convertible', N'2011', N'C70 2011', N'64483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (256, N'Volvo', N'C70', N'Convertible', N'2010', N'C70 2010', N'64733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (257, N'Volvo', N'C70', N'Convertible', N'2009', N'C70 2009', N'64983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (258, N'Honda', N'CR-V', N'SUV', N'2020', N'CR-V 2020', N'65233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (259, N'Honda', N'CR-V', N'SUV', N'2019', N'CR-V 2019', N'65483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (260, N'Honda', N'CR-V', N'SUV', N'2018', N'CR-V 2018', N'65733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (261, N'Honda', N'CR-V', N'SUV', N'2017', N'CR-V 2017', N'65983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (262, N'Honda', N'CR-V', N'SUV', N'2016', N'CR-V 2016', N'66233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (263, N'Honda', N'CR-V', N'SUV', N'2015', N'CR-V 2015', N'66483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (264, N'Honda', N'CR-V', N'SUV', N'2014', N'CR-V 2014', N'66733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (265, N'Honda', N'CR-V', N'SUV', N'2013', N'CR-V 2013', N'66983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (266, N'Honda', N'CR-V', N'SUV', N'2012', N'CR-V 2012', N'67233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (267, N'Honda', N'CR-V', N'SUV', N'2011', N'CR-V 2011', N'67483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (268, N'Honda', N'CR-V', N'SUV', N'2010', N'CR-V 2010', N'67733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (269, N'Honda', N'CR-V', N'SUV', N'2009', N'CR-V 2009', N'67983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (270, N'Cadillac', N'CTS', N'Sedan, Coupe, Wagon', N'2014', N'CTS 2014', N'68233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (271, N'Cadillac', N'CTS', N'Sedan, Coupe, Wagon', N'2013', N'CTS 2013', N'68483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (272, N'Cadillac', N'CTS', N'Sedan, Coupe, Wagon', N'2012', N'CTS 2012', N'68733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (273, N'Cadillac', N'CTS', N'Sedan, Wagon, Coupe', N'2011', N'CTS 2011', N'68983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (274, N'Cadillac', N'CTS', N'Sedan, Wagon', N'2010', N'CTS 2010', N'69233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (275, N'Cadillac', N'CTS', N'Sedan', N'2009', N'CTS 2009', N'69483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (276, N'Cadillac', N'CTS', N'Sedan', N'2008', N'CTS 2008', N'69733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (277, N'Cadillac', N'CTS', N'Sedan', N'2007', N'CTS 2007', N'69983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (278, N'Cadillac', N'CTS', N'Sedan', N'2006', N'CTS 2006', N'70233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (279, N'Cadillac', N'CTS', N'Sedan', N'2005', N'CTS 2005', N'70483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (280, N'Cadillac', N'CTS', N'Sedan', N'2004', N'CTS 2004', N'70733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (281, N'Cadillac', N'CTS', N'Sedan', N'2003', N'CTS 2003', N'70983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (282, N'Cadillac', N'CTS-V', N'Sedan', N'2019', N'CTS-V 2019', N'71233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (283, N'Cadillac', N'CTS-V', N'Sedan', N'2018', N'CTS-V 2018', N'71483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (284, N'Cadillac', N'CTS-V', N'Sedan', N'2017', N'CTS-V 2017', N'71733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (285, N'Cadillac', N'CTS-V', N'Sedan', N'2016', N'CTS-V 2016', N'71983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (286, N'MAZDA', N'CX-3', N'SUV', N'2019', N'CX-3 2019', N'72233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (287, N'MAZDA', N'CX-3', N'SUV', N'2018', N'CX-3 2018', N'72483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (288, N'MAZDA', N'CX-3', N'SUV', N'2017', N'CX-3 2017', N'72733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (289, N'MAZDA', N'CX-3', N'SUV', N'2016', N'CX-3 2016', N'72983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (290, N'Toyota', N'Camry', N'Sedan', N'2020', N'Camry 2020', N'73233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (291, N'Toyota', N'Camry', N'Sedan', N'2019', N'Camry 2019', N'73483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (292, N'Toyota', N'Camry', N'Sedan', N'2018', N'Camry 2018', N'73733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (293, N'Toyota', N'Camry', N'Sedan', N'2017', N'Camry 2017', N'73983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (294, N'Toyota', N'Camry', N'Sedan', N'2016', N'Camry 2016', N'74233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (295, N'Toyota', N'Camry', N'Sedan', N'2015', N'Camry 2015', N'74483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (296, N'Toyota', N'Camry', N'Sedan', N'2014', N'Camry 2014', N'74733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (297, N'Porsche', N'Cayenne', N'SUV', N'2020', N'Cayenne 2020', N'74983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (298, N'Porsche', N'Cayenne', N'SUV', N'2019', N'Cayenne 2019', N'75233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (299, N'Porsche', N'Cayenne', N'SUV', N'2018', N'Cayenne 2018', N'75483333,33')
GO
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (300, N'Porsche', N'Cayenne', N'SUV', N'2017', N'Cayenne 2017', N'75733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (301, N'Porsche', N'Cayenne', N'SUV', N'2016', N'Cayenne 2016', N'75983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (302, N'Porsche', N'Cayenne', N'SUV', N'2015', N'Cayenne 2015', N'76233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (303, N'Porsche', N'Cayenne', N'SUV', N'2014', N'Cayenne 2014', N'76483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (304, N'Porsche', N'Cayenne', N'SUV', N'2013', N'Cayenne 2013', N'76733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (305, N'MINI', N'Convertible', N'Convertible', N'2008', N'Convertible 2008', N'76983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (306, N'MINI', N'Convertible', N'Convertible', N'2007', N'Convertible 2007', N'77233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (307, N'MINI', N'Convertible', N'Convertible', N'2006', N'Convertible 2006', N'77483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (308, N'MINI', N'Convertible', N'Convertible', N'2005', N'Convertible 2005', N'77733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (309, N'MINI', N'Cooper', N'Hatchback', N'2008', N'Cooper 2008', N'77983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (310, N'MINI', N'Cooper', N'Hatchback', N'2007', N'Cooper 2007', N'78233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (311, N'MINI', N'Cooper', N'Hatchback', N'2006', N'Cooper 2006', N'78483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (312, N'MINI', N'Cooper', N'Hatchback', N'2005', N'Cooper 2005', N'78733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (313, N'MINI', N'Cooper', N'Hatchback', N'2004', N'Cooper 2004', N'78983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (314, N'MINI', N'Cooper', N'Hatchback', N'2003', N'Cooper 2003', N'79233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (315, N'MINI', N'Cooper', N'Hatchback', N'2002', N'Cooper 2002', N'79483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (316, N'Toyota', N'Corolla', N'Sedan', N'2020', N'Corolla 2020', N'79733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (317, N'Toyota', N'Corolla', N'Sedan', N'2019', N'Corolla 2019', N'79983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (318, N'Toyota', N'Corolla', N'Sedan', N'2018', N'Corolla 2018', N'80233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (319, N'Toyota', N'Corolla', N'Sedan', N'2017', N'Corolla 2017', N'80483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (320, N'Toyota', N'Corolla', N'Sedan', N'2016', N'Corolla 2016', N'80733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (321, N'Toyota', N'Corolla', N'Sedan', N'2015', N'Corolla 2015', N'80983333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (322, N'Toyota', N'Corolla', N'Sedan', N'2014', N'Corolla 2014', N'81233333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (323, N'Toyota', N'Corolla', N'Sedan', N'2013', N'Corolla 2013', N'81483333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (324, N'Toyota', N'Corolla', N'Sedan', N'2012', N'Corolla 2012', N'81733333,33')
INSERT [dbo].[Model] ([Id], [Make], [ModelName], [Category], [Year], [ModelYear], [Price]) VALUES (325, N'Lexsus', N'RX', N'Sedan, Wagon', N'2007', N'RX 2007', N'1200000')
SET IDENTITY_INSERT [dbo].[Model] OFF
GO
SET IDENTITY_INSERT [dbo].[Osago] ON 

INSERT [dbo].[Osago] ([Id], [DriverId], [RegionId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (4, 1, 1, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 7, 14991.6)
INSERT [dbo].[Osago] ([Id], [DriverId], [RegionId], [DateStart], [DateEnd], [CarId], [Price]) VALUES (5, 1, 10, CAST(N'2023-05-16' AS Date), CAST(N'2024-05-16' AS Date), 3, 3534)
SET IDENTITY_INSERT [dbo].[Osago] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (1, N'Республика Адыгея', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (2, N'Горно-Алтайск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (3, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (4, N'Благовещенск, Октябрьский', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (5, N'Ишимбай, Кумертау, Салават', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (6, N'Стерлитамак, Туймазы', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (7, N'Уфа', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (8, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (9, N'Улан-Удэ', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (10, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (11, N'Буйнакск, Дербент, Каспийск, Махачкала, Хасавюрт', 0.96)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (12, N'Прочие города', 0.9)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (13, N'Малгобек', 0.94)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (14, N'Назрань', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (15, N'Прочие города', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (16, N'Нальчик, Прохладный', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (17, N'Прочие города', 0.88)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (18, N'Элиста', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (19, N'Прочие города', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (20, N'Карачаево-Черкесская Республика', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (21, N'Петрозаводск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (22, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (23, N'Сыктывкар', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (24, N'Ухта', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (25, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (26, N'Симферополь', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (27, N'Прочие города', 0.68)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (28, N'Волжск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (29, N'Йошкар-Ола', 1.32)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (30, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (31, N'Рузаевка', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (32, N'Саранск', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (33, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (34, N'Нерюнгри', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (35, N'Якутск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (36, N'Прочие города', 0.68)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (37, N'Владикавказ', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (38, N'Прочие города', 0.94)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (39, N'Альметьевск, Зеленодольск, Нижнекамск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (40, N'Бугульма, Лениногорск, Чистополь', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (41, N'Елабуга', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (42, N'Казань', 1.8)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (43, N'Набережные Челны', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (44, N'Прочие города', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (45, N'Кызыл', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (46, N'Прочие города', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (47, N'Воткинск', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (48, N'Глазов, Сарапул', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (49, N'Ижевск', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (50, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (51, N'Абакан, Саяногорск, Черногорск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (52, N'Прочие города', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (53, N'Чеченская Республика', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (54, N'Канаш', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (55, N'Новочебоксарск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (56, N'Чебоксары', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (57, N'Прочие города', 0.88)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (58, N'Барнаул', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (59, N'Бийск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (60, N'Заринск, Новоалтайск, Рубцовск', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (61, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (62, N'Краснокаменск', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (63, N'Чита', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (64, N'Прочие города', 0.68)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (65, N'Петропавловск-Камчатский', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (66, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (67, N'Анапа, Геленджик', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (68, N'Армавир, Сочи, Туапсе', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (69, N'Белореченск, Ейск, Кропоткин, Крымск, Курганинск, Лабинск, Славянск-на-Кубани, Тимашевск, Тихорецк', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (70, N'Краснодар, Новороссийск', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (71, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (72, N'Ачинск, Зеленогорск', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (73, N'Железногорск, Норильск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (74, N'Канск, Лесосибирск, Минусинск, Назарово', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (75, N'Красноярск', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (76, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (77, N'Березники, Краснокамск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (78, N'Лысьва, Чайковский', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (79, N'Пермь', 1.8)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (80, N'Соликамск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (81, N'Прочие города', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (82, N'Арсеньев, Артем, Находка, Спасск-Дальний, Уссурийск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (83, N'Владивосток', 1.36)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (84, N'Прочие города', 0.96)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (85, N'Буденновск, Георгиевск, Ессентуки, Минеральные Воды, Невинномысск, Пятигорск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (86, N'Кисловодск, Михайловск, Ставрополь', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (87, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (88, N'Амурск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (89, N'Комсомольск-на-Амуре', 1.27)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (90, N'Хабаровск', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (91, N'Прочие города', 0.88)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (92, N'Белогорск, Свободный', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (93, N'Благовещенск', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (94, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (95, N'Архангельск', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (96, N'Котлас', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (97, N'Северодвинск', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (98, N'Прочие города', 0.88)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (99, N'Астрахань', 1.32)
GO
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (100, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (101, N'Белгород', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (102, N'Губкин, Старый Оскол', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (103, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (104, N'Брянск', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (105, N'Клинцы', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (106, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (107, N'Владимир', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (108, N'Гусь-Хрустальный', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (109, N'Муром', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (110, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (111, N'Волгоград', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (112, N'Волжский', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (113, N'Камышин, Михайловка', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (114, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (115, N'Вологда', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (116, N'Череповец', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (117, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (118, N'Борисоглебск, Лиски, Россошь', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (119, N'Воронеж', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (120, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (121, N'Иваново', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (122, N'Кинешма', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (123, N'Шуя', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (124, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (125, N'Ангарск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (126, N'Братск, Тулун, Усть-Илимск, Усть-Кут, Черемхово', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (127, N'Иркутск', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (128, N'Усолье-Сибирское', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (129, N'Шелехов', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (130, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (131, N'Калининград', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (132, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (133, N'Калуга', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (134, N'Обнинск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (135, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (136, N'Анжеро-Судженск, Киселевск, Юрга', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (137, N'Белово, Березовский, Междуреченск, Осинники, Прокопьевск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (138, N'Кемерово', 1.72)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (139, N'Новокузнецк', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (140, N'Прочие города', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (141, N'Киров', 1.32)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (142, N'Кирово-Чепецк', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (143, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (144, N'Кострома', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (145, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (146, N'Курган', 1.32)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (147, N'Шадринск', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (148, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (149, N'Железногорск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (150, N'Курск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (151, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (152, N'Ленинградская область', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (153, N'Елец', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (154, N'Липецк', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (155, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (156, N'Магадан', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (157, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (158, N'Московская область', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (159, N'Апатиты, Мончегорск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (160, N'Мурманск', 1.88)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (161, N'Североморск', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (162, N'Прочие города', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (163, N'Арзамас, Выкса, Саров', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (164, N'Балахна, Бор, Дзержинск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (165, N'Кстово', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (166, N'Нижний Новгород', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (167, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (168, N'Боровичи', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (169, N'Великий Новгород', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (170, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (171, N'Бердск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (172, N'Искитим', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (173, N'Куйбышев', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (174, N'Новосибирск', 1.63)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (175, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (176, N'Омск', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (177, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (178, N'Бугуруслан, Бузулук, Новотроицк', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (179, N'Оренбург', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (180, N'Орск', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (181, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (182, N'Ливны, Мценск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (183, N'Орел', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (184, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (185, N'Заречный', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (186, N'Кузнецк', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (187, N'Пенза', 1.32)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (188, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (189, N'Великие Луки', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (190, N'Псков', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (191, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (192, N'Азов', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (193, N'Батайск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (194, N'Волгодонск, Гуково, Каменск-Шахтинский, Новочеркасск, Новошахтинск, Сальск, Таганрог', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (195, N'Ростов-на-Дону', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (196, N'Шахты', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (197, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (198, N'Рязань', 1.32)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (199, N'Прочие города', 0.92)
GO
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (200, N'Новокуйбышевск, Сызрань', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (201, N'Самара', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (202, N'Тольятти', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (203, N'Чапаевск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (204, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (205, N'Балаково, Балашов, Вольск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (206, N'Саратов', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (207, N'Энгельс', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (208, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (209, N'Южно-Сахалинск', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (210, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (211, N'Асбест, Ревда', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (212, N'Березовский, Верхняя Пышма, Новоуральск, Первоуральск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (213, N'Верхняя Салда, Полевской', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (214, N'Екатеринбург', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (215, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (216, N'Вязьма, Рославль, Сафоново, Ярцево', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (217, N'Смоленск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (218, N'Прочие города', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (219, N'Мичуринск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (220, N'Тамбов', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (221, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (222, N'Вышний Волочек, Кимры, Ржев', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (223, N'Тверь', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (224, N'Прочие города', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (225, N'Северск', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (226, N'Томск', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (227, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (228, N'Алексин, Ефремов, Новомосковск', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (229, N'Тула', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (230, N'Узловая, Щекино', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (231, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (232, N'Тобольск', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (233, N'Тюмень', 1.8)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (234, N'Прочие города', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (235, N'Димитровград', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (236, N'Ульяновск', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (237, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (238, N'Златоуст, Миасс', 1.32)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (239, N'Копейск', 1.48)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (240, N'Магнитогорск', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (241, N'Сатка, Чебаркуль', 1.16)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (242, N'Челябинск', 1.88)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (243, N'Прочие города', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (244, N'Ярославль', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (245, N'Прочие города', 0.92)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (246, N'Москва', 1.8)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (247, N'Санкт-Петербург', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (248, N'Севастополь', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (249, N'Биробиджан', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (250, N'Прочие города', 0.82)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (251, N'Ненецкий автономный округ', 0.84)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (252, N'Когалым', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (253, N'Нефтеюганск, Нягань', 1.24)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (254, N'Сургут', 1.8)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (255, N'Нижневартовск', 1.64)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (256, N'Ханты-Мансийск', 1.4)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (257, N'Прочие города', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (258, N'Чукотский автономный округ', 0.76)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (259, N'Новый Уренгой', 1)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (260, N'Ноябрьск', 1.56)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (261, N'Прочие города', 1.08)
INSERT [dbo].[Region] ([Id], [Name], [CoefficientForOsago]) VALUES (262, N'Байконур', 0.82)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Бухгалтер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Клиент')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (4, N'Оценщик')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([Id], [UserId], [Name], [Surename], [Phone], [Email]) VALUES (1, 2, N'Arthur', N'Aipov', N'9870084416', N'aipov2@gmail.com')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (1, N'1', N'1', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (2, N'2', N'2', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (3, N'3', N'3', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (4, N'4', N'4', 4)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (5, N'6', N'1', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (6, N'8', N'1', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (7, N'9', N'1', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (8, N'ArthurAipov', N'1', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (9, N'asdf', N'asdf', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (10, N'qwer', N'qwer', 4)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (11, N'zxcv', N'zxcv', 4)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Driver]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Model] FOREIGN KEY([ModelsId])
REFERENCES [dbo].[Model] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Model]
GO
ALTER TABLE [dbo].[Casco]  WITH CHECK ADD  CONSTRAINT [FK_Casco_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[Casco] CHECK CONSTRAINT [FK_Casco_Car]
GO
ALTER TABLE [dbo].[Casco]  WITH CHECK ADD  CONSTRAINT [FK_Casco_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[Casco] CHECK CONSTRAINT [FK_Casco_Driver]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_User]
GO
ALTER TABLE [dbo].[Osago]  WITH CHECK ADD  CONSTRAINT [FK_Osago_Car] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
GO
ALTER TABLE [dbo].[Osago] CHECK CONSTRAINT [FK_Osago_Car]
GO
ALTER TABLE [dbo].[Osago]  WITH CHECK ADD  CONSTRAINT [FK_Osago_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[Osago] CHECK CONSTRAINT [FK_Osago_Driver]
GO
ALTER TABLE [dbo].[Osago]  WITH CHECK ADD  CONSTRAINT [FK_Osago_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Osago] CHECK CONSTRAINT [FK_Osago_Region]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [CarInsurance] SET  READ_WRITE 
GO
