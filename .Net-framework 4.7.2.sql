USE [master]
GO
/****** Object:  Database [D134_GolopapaDU]    Script Date: 02.12.2022 2:29:35 ******/
CREATE DATABASE [D134_GolopapaDU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'D134_GolopapaDU', FILENAME = N'D:\UserDataBases\D134_GolopapaDU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'D134_GolopapaDU_log', FILENAME = N'D:\UserDataBases\D134_GolopapaDU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [D134_GolopapaDU] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [D134_GolopapaDU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [D134_GolopapaDU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET ARITHABORT OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [D134_GolopapaDU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [D134_GolopapaDU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET  ENABLE_BROKER 
GO
ALTER DATABASE [D134_GolopapaDU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [D134_GolopapaDU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET RECOVERY FULL 
GO
ALTER DATABASE [D134_GolopapaDU] SET  MULTI_USER 
GO
ALTER DATABASE [D134_GolopapaDU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [D134_GolopapaDU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [D134_GolopapaDU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [D134_GolopapaDU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [D134_GolopapaDU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [D134_GolopapaDU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'D134_GolopapaDU', N'ON'
GO
ALTER DATABASE [D134_GolopapaDU] SET QUERY_STORE = OFF
GO
USE [D134_GolopapaDU]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 02.12.2022 2:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NULL,
	[OrderClientID] [int] NULL,
	[OrderRecieveCode] [int] NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 02.12.2022 2:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoints]    Script Date: 02.12.2022 2:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoints](
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointAddress] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.12.2022 2:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductUnit] [nvarchar](max) NOT NULL,
	[ProductCost] [float] NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductSupplier] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductCurrentDiscount] [int] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD56024AA2D] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 02.12.2022 2:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02.12.2022 2:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserRole] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NULL,
	[UserPassword] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PickupPoints] ON 

INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (1, N'344288, г. Талнах, ул. Чехова, 1')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (2, N'614164, г. Талнах, ул. Степная, 30')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (3, N'394242, г. Талнах, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (4, N'660540, г. Талнах, ул. Солнечная, 25')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (5, N'125837, г. Талнах, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (6, N'125703, г. Талнах, ул. Партизанская, 49')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (7, N'625283, г. Талнах, ул. Победы, 46')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (8, N'614611, г. Талнах, ул. Молодежная, 50')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (9, N'454311, г. Талнах, ул. Новая, 19')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (10, N'660007, г. Талнах, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (11, N'603036, г. Талнах, ул. Садовая, 4')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (12, N'450983, г. Талнах, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (13, N'394782, г. Талнах, ул. Чехова, 3')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (14, N'603002, г. Талнах, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (15, N'450558, г. Талнах, ул. Набережная, 30')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (16, N'394060, г. Талнах, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (17, N'410661, г. Талнах, ул. Школьная, 50')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (18, N'625590, г. Талнах, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (19, N'625683, г. Талнах, ул. 8 Марта')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (20, N'400562, г. Талнах, ул. Зеленая, 32')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (21, N'614510, г. Талнах, ул. Маяковского, 47')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (22, N'410542, г. Талнах, ул. Светлая, 46')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (23, N'620839, г. Талнах, ул. Цветочная, 8')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (24, N'443890, г. Талнах, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (25, N'603379, г. Талнах, ул. Спортивная, 46')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (26, N'603721, г. Талнах, ул. Гоголя, 41')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (27, N'410172, г. Талнах, ул. Северная, 13')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (28, N'420151, г. Талнах, ул. Вишневая, 32')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (29, N'125061, г. Талнах, ул. Подгорная, 8')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (30, N'630370, г. Талнах, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (31, N'614753, г. Талнах, ул. Полевая, 35')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (32, N'426030, г. Талнах, ул. Маяковского, 44')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (33, N'450375, г. Талнах, ул. Клубная, 44')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (34, N'625560, г. Талнах, ул. Некрасова, 12')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (35, N'630201, г. Талнах, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoints] ([PointID], [PointAddress]) VALUES (36, N'190949, г. Талнах, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickupPoints] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B736H6', N'Вилка столовая', N'шт.', 600, 5, N'Alaska', N'LeroiMerlin', N'Вилки', 3, 4, N'Вилка столовая 21,2 см «Аляска бэйсик» сталь KunstWerk', N'B736H6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B963H5', N'Ложка', N'шт.', 2550, 5, N'Smart Home', N'LeroiMerlin', N'Ложки', 3, 8, N'Ложка 21 мм металлическая (медная) (Упаковка 10 шт)', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C430T4', N'Набор на одну персону', N'шт.', 300, 30, N'Attribute', N'LeroiMerlin', N'Наборы', 3, 16, N'Набор на одну персону (4 предмета) серия "Bistro", нерж. сталь, Was, Германия.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C635Y6', N'Детский столовый набор', N'шт.', 1300, 15, N'Apollo', N'Максидом', N'Наборы', 4, 25, N'Детский столовый набор Fissman «Зебра»', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C730R7', N'Ложка детская', N'шт.', 400, 5, N'Smart Home', N'LeroiMerlin', N'Ложки', 3, 17, N'Ложка детская столовая', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C943G5', N'Набор чайных ложек', N'шт.', 170, 5, N'Attribute', N'Максидом', N'Наборы', 4, 12, N'Attribute Набор чайных ложек Baguette 3 предмета серебристый', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C946Y6', N'Вилка столовая', N'шт.', 200, 15, N'Apollo', N'LeroiMerlin', N'Вилки', 2, 16, N'Вилка детская столовая', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D735T5', N'Ложка чайная', N'шт.', 220, 5, N'Alaska', N'LeroiMerlin', N'Ложки', 2, 13, N'Ложка чайная ALASKA Eternum', N'D735T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'E732R7', N'Набор столовых приборов', N'шт.', 250, 15, N'Smart Home', N'Максидом', N'Наборы', 5, 6, N'Набор столовых приборов Smart Home20 Black в подарочной коробке, 4 шт', N'E732R7.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F392G6', N'Набор столовых приборов', N'шт.', 300, 10, N'Apollo', N'LeroiMerlin', N'Наборы', 4, 9, N'Apollo Набор столовых приборов Chicago 4 предмета серебристый', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F573T5', N'Вилки столовые', N'шт.', 650, 15, N'Davinci', N'Максидом', N'Вилки', 3, 4, N'Вилки столовые на блистере / 6 шт.', N'F573T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F745K4', N'Столовые приборы для салата', N'шт.', 1000, 10, N'Mayer & Boch', N'LeroiMerlin', N'Наборы', 3, 2, N'Столовые приборы для салата Orskov Lava, 2шт', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F839R6', N'Ложка чайная', N'шт.', 500, 15, N'Doria', N'Максидом', N'Ложки', 2, 6, N'Ложка чайная DORIA Eternum', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'G304H6', N'Набор ложек', N'шт.', 1600, 5, N'Apollo', N'Максидом', N'Ложки', 4, 12, N'Набор ложек столовых APOLLO "Bohemica" 3 пр.', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'G387Y6', N'Ложка столовая', N'шт.', 441, 5, N'Doria', N'Максидом', N'Ложки', 4, 23, N'Ложка столовая DORIA L=195/60 мм Eternum', N'G387Y6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H384H3', N'Набор столовых приборов', N'шт.', 530, 15, N'Apollo', N'Максидом', N'Наборы', 2, 9, N'Набор столовых приборов для торта Palette 7 предметов серебристый', N'H384H3.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H495H6', N'Набор стейковых ножей', N'шт.', 2000, 15, N'Mayer & Boch', N'LeroiMerlin', N'Ножи', 2, 15, N'Набор стейковых ножей 4 пр. в деревянной коробке', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K437E6', N'Набор вилок', N'шт.', 990, 5, N'Apollo', N'Максидом', N'Наборы', 3, 16, N'Набор вилок столовых APOLLO "Aurora" 3шт.', N'K437E6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'L593H5', N'Набор ножей', N'шт.', 700, 25, N'Mayer & Boch', N'Максидом', N'Наборы', 5, 14, N'Набор ножей Mayer & Boch, 4 шт', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'N493G6', N'Набор для серверовки', N'шт.', 1300, 15, N'Smart Home', N'LeroiMerlin', N'Наборы', 4, 6, N'Набор для сервировки сыра Select', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R836H6', N'Набор  столовых ножей', N'шт.', 490, 5, N'Attribute', N'LeroiMerlin', N'Ножи', 3, 16, N'Attribute Набор столовых ножей Baguette 2 предмета серебристый', N'R836H6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S394J5', N'Набор чайных ложек', N'шт.', 600, 5, N'Attribute', N'LeroiMerlin', N'Наборы', 3, 4, N'Attribute Набор чайных ложек Chaplet 3 предмета серебристый', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S395B5', N'Нож для стейка', N'шт.', 600, 10, N'Apollo', N'LeroiMerlin', N'Ножи', 4, 15, N'Нож для стейка 11,5 см серебристый/черный', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'T793T4', N'Набор ложек', N'шт.', 250, 10, N'Attribute', N'LeroiMerlin', N'Ложки', 3, 16, N'Набор столовых ложек Baguette 3 предмета серебристый', N'T793T4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V026J4', N'Набор ножей', N'шт.', 3000, 15, N'Apollo', N'Максидом', N'Наборы', 3, 9, N'Набор ножей для стейка и пиццы Swiss classic 2 шт. желтый', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V403G6', N'Ложка чайная', N'шт.', 800, 15, N'Doria', N'Максидом', N'Ложки', 5, 24, N'Ложка чайная DORIA Eternum', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V727Y6', N'Набор десертных ложек', N'шт.', 7000, 10, N'Mayer & Boch', N'LeroiMerlin', N'Ложки', 4, 8, N'Набор десертных ложек на подставке Размер: 7*7*15 см', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'W295Y5', N'Сервировочный набор для торта', N'шт.', 5000, 15, N'Attribute', N'Максидом', N'Наборы', 2, 16, N'Набор сервировочный для торта "Розанна"', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'W405G6', N'Набор столовых приборов', N'шт.', 1100, 25, N'Attribute', N'LeroiMerlin', N'Наборы', 3, 4, N'Набор сервировочных столовых вилок Цветы', N'')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (1, 1, N'Савицкая Арина Саввична', N'1y3lj8w0viop@outlook.com', N'2L6KZG')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (2, 1, N'Мартынов Максим Михайлович', N'3o698uk5c0rw@tutanota.com', N'uzWC67')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (3, 1, N'Зубов Александр Дамирович', N'lx24fvrt1aip@yahoo.com', N'8ntwUp')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (4, 2, N'Попов Даниил Олегович', N's8z076vku95j@gmail.com', N'YOyhfR')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (5, 2, N'Семенов Михаил Никитич', N'n3bxm7f2q5i4@outlook.com', N'RSbvHv')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (6, 2, N'Дмитриева Надежда Вячеславовна', N'r7dztn8a5ihq@mail.com', N'rwVDh9')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (7, 3, N'Воронцова Виктория Саввична', N'vofgck2m39hq@gmail.com', N'LdNyos')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (8, 3, N'Софронов Ярослав Игоревич', N's6q9tevybado@yahoo.com', N'gynQMT')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (9, 3, N'Егоров Артём Евгеньевич', N'p7wuls3dtq9v@yahoo.com', N'AtnDjr')
INSERT [dbo].[User] ([UserID], [UserRole], [UserName], [UserLogin], [UserPassword]) VALUES (10, 3, N'Ситникова Эмилия Степановна', N'rdn04s1u2ckb@mail.com', N'JlFRCZ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([OrderClientID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoints] ([PointID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__31EC6D26] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__31EC6D26]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [D134_GolopapaDU] SET  READ_WRITE 
GO
