USE [master]
GO
/****** Object:  Database [ASPNET]    Script Date: 1/15/2025 1:45:42 PM ******/
CREATE DATABASE [ASPNET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASPNET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLTANDUNG\MSSQL\DATA\ASPNET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASPNET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLTANDUNG\MSSQL\DATA\ASPNET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASPNET] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASPNET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASPNET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASPNET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASPNET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASPNET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASPNET] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASPNET] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASPNET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASPNET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASPNET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASPNET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASPNET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASPNET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASPNET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASPNET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASPNET] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASPNET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASPNET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASPNET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASPNET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASPNET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASPNET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASPNET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASPNET] SET RECOVERY FULL 
GO
ALTER DATABASE [ASPNET] SET  MULTI_USER 
GO
ALTER DATABASE [ASPNET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASPNET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASPNET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASPNET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASPNET] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASPNET] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASPNET', N'ON'
GO
ALTER DATABASE [ASPNET] SET QUERY_STORE = OFF
GO
USE [ASPNET]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/15/2025 1:45:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
	[IsPopular] [bit] NULL,
	[BrandImage] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/15/2025 1:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
	[CategoryImage] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/15/2025 1:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/15/2025 1:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/15/2025 1:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[ProductImage] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[BrandID] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [nvarchar](100) NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[ShockSale] [tinyint] NULL,
	[IsRecommended] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/15/2025 1:45:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [IsPopular], [BrandImage]) VALUES (1, N'Apple', N'
Apple là thương hiệu công nghệ nổi tiếng với sản phẩm chất lượng cao như iPhone và MacBook. Họ nổi bật với thiết kế tinh tế và hiệu suất mạnh mẽ.', CAST(N'2024-12-18T13:57:12.167' AS DateTime), N'Admin', CAST(N'2024-12-18T13:57:12.167' AS DateTime), N'Admin', 1, NULL)
INSERT [dbo].[Brand] ([BrandID], [BrandName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [IsPopular], [BrandImage]) VALUES (2, N'Samsung', N'Samsung là một tập đoàn công nghệ toàn cầu, nổi bật với các sản phẩm điện tử như smartphone, TV, và thiết bị gia dụng. Họ nổi bật nhờ vào công nghệ tiên tiến và đổi mới trong thiết kế.', CAST(N'2024-12-18T13:57:12.167' AS DateTime), N'Admin', CAST(N'2024-12-18T13:57:12.167' AS DateTime), N'Admin', 1, NULL)
INSERT [dbo].[Brand] ([BrandID], [BrandName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [IsPopular], [BrandImage]) VALUES (6, N'Dúnggssss', N'Dungnguyen', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [CategoryImage]) VALUES (1, N'Điện Thoại', N'Danh mục điện thoại', CAST(N'2024-12-18T13:56:37.047' AS DateTime), N'Admin', CAST(N'2024-12-18T13:56:37.047' AS DateTime), N'Admin', N'ctid2.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [CategoryImage]) VALUES (2, N'Laptop', N'Danh mục máy tính', CAST(N'2024-12-18T13:56:37.047' AS DateTime), N'Admin', CAST(N'2024-12-18T13:56:37.047' AS DateTime), N'Admin', N'ctid1.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [CategoryImage]) VALUES (3, N'Phụ Kiện', N'Danh mục phụ kiên', CAST(N'2024-12-18T13:56:37.047' AS DateTime), N'Admin', CAST(N'2024-12-18T13:56:37.047' AS DateTime), N'Admin', N'25.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20241225143323', 1, 17, CAST(N'2024-12-25T14:33:23.043' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (14, N'DonHang-20241230142141', 1, 17, CAST(N'2024-12-30T14:21:41.350' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (15, N'DonHang-20241230142427', 1, 17, CAST(N'2024-12-30T14:24:27.287' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'DonHang-20241230142822', 1, 17, CAST(N'2024-12-30T14:28:22.333' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (17, N'DonHang-20241230142945', 1, 17, CAST(N'2024-12-30T14:29:45.803' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (18, N'DonHang-20241230143117', 1, 17, CAST(N'2024-12-30T14:31:17.523' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (19, N'DonHang-20241230143356', 1, 17, CAST(N'2024-12-30T14:33:56.260' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (20, N'DonHang-20241230143440', 1, 17, CAST(N'2024-12-30T14:34:40.817' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (21, N'DonHang-20241230143622', 1, 17, CAST(N'2024-12-30T14:36:22.070' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (22, N'DonHang-20241230155318', 1, 17, CAST(N'2024-12-30T15:53:18.180' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (23, N'DonHang-20241230155506', 1, 17, CAST(N'2024-12-30T15:55:06.740' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (24, N'DonHang-20241230155557', 1, 17, CAST(N'2024-12-30T15:55:57.487' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (25, N'DonHang-20241230155725', 1, 17, CAST(N'2024-12-30T15:57:25.997' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (26, N'DonHang-20241230155904', 3, 17, CAST(N'2024-12-30T15:59:04.673' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (27, N'DonHang-20250115134103', 1, 17, CAST(N'2025-01-15T13:41:04.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 2, 11, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 14, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 15, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 16, 7, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (16, 17, 6, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 18, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (18, 19, 7, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (19, 20, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (20, 21, 7, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (21, 22, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (22, 23, 6, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (23, 24, 7, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (24, 25, 6, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (25, 26, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (26, 27, 5, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (2, N'iPhone 16 Pro Max 256GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam.CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt NamiPhone sử dụng iOS 18, Cáp Sạc USB‑C (1m), Tài liệu1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple: ', N'Máy mới 100% , chính hãng Apple Việt Nam.CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt NamiPhone sử dụng iOS 18, Cáp Sạc USB‑C (1m), Tài liệu1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple: ', N'10.jpg', CAST(33890000.00 AS Decimal(18, 2)), 1, 1, CAST(N'2024-12-18T13:45:43.000' AS DateTime), N'Admin', CAST(N'2024-12-18T13:45:43.000' AS DateTime), N'Admin', 1, 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (3, N'Samsung Galaxy S24 Ultra 12GB 256GB', N'Trải nghiệm đỉnh cao với hiệu năng mạnh mẽ từ vi xử lý tân tiến, kết hợp cùng RAM 12GB cho khả năng đa nhiệm mượt mà.
Lưu trữ thoải mái mọi ứng dụng, hình ảnh và video với bộ nhớ trong 256GB.
Nâng tầm nhiếp ảnh di động với hệ thống camera tiên tiến, cho ra đời những bức ảnh và video chất lượng chuyên nghiệp.
Thiết kế sang trọng, đẳng cấp, khẳng định phong cách thời thượng.', N'Trải nghiệm đỉnh cao với hiệu năng mạnh mẽ từ vi xử lý tân tiến, kết hợp cùng RAM 12GB cho khả năng đa nhiệm mượt mà.
Lưu trữ thoải mái mọi ứng dụng, hình ảnh và video với bộ nhớ trong 256GB.
Nâng tầm nhiếp ảnh di động với hệ thống camera tiên tiến, cho ra đời những bức ảnh và video chất lượng chuyên nghiệp.
Thiết kế sang trọng, đẳng cấp, khẳng định phong cách thời thượng.', N'11.jpg', CAST(29990000.00 AS Decimal(18, 2)), 1, 2, CAST(N'2024-12-18T13:45:43.007' AS DateTime), N'Admin', CAST(N'2024-12-18T13:45:43.007' AS DateTime), N'Admin', 1, 1, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (4, N'OPPO Find X8 12GB 128GB', N'OPPO Find X8 hữu chip Dimensity 9400 3nm với lõi Cortex-X925 sẽ đảm bảo xử lý mọi tác vụ một cách nhanh chóng.
Find X8 sẽ được trang bị cụm 3 camera sau 50MP đảm bảo được sự đồng đều về chất lượng hình ảnh giữa các chế độ chụp.
Viên Pin 5630 mAh sẽ giúp dòng bạn kéo dài ra đáng kể thời gian dùng điện thoại, đáp ứng nhu cầu sử dụng hỗn hợp suốt cả ngày của người dùng.', N'OPPO Find X8 hữu chip Dimensity 9400 3nm với lõi Cortex-X925 sẽ đảm bảo xử lý mọi tác vụ một cách nhanh chóng.
Find X8 sẽ được trang bị cụm 3 camera sau 50MP đảm bảo được sự đồng đều về chất lượng hình ảnh giữa các chế độ chụp.
Viên Pin 5630 mAh sẽ giúp dòng bạn kéo dài ra đáng kể thời gian dùng điện thoại, đáp ứng nhu cầu sử dụng hỗn hợp suốt cả ngày của người dùng.', N'12.jpg', CAST(22990000.00 AS Decimal(18, 2)), 1, 2, CAST(N'2024-12-18T13:58:05.290' AS DateTime), N'Admin', CAST(N'2024-12-18T13:58:05.290' AS DateTime), N'Admin', 1, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (5, N'Samsung Galaxy Z Fold6 12GB 256GB', N'Màn hình chính Dynamic AMOLED 2X 7.6 inch cho trải nghiệm giải trí, làm việc đỉnh cao.
Chip Snapdragon 8 Gen 3 cho tốc độ xử lý siêu nhanh, đáp ứng tốt mọi nhu cầu sử dụng.
Camera chính 50.0 MP ghi lại những khoảnh khắc đẹp với độ chi tiết, màu sắc ấn tượng.
Pin 4400mAh cho phép bạn sử dụng điện thoại cả ngày dài mà không cần lo lắng về việc hết pin.', N'Màn hình chính Dynamic AMOLED 2X 7.6 inch cho trải nghiệm giải trí, làm việc đỉnh cao.
Chip Snapdragon 8 Gen 3 cho tốc độ xử lý siêu nhanh, đáp ứng tốt mọi nhu cầu sử dụng.
Camera chính 50.0 MP ghi lại những khoảnh khắc đẹp với độ chi tiết, màu sắc ấn tượng.
Pin 4400mAh cho phép bạn sử dụng điện thoại cả ngày dài mà không cần lo lắng về việc hết pin.', N'13.jpg', CAST(41990000.00 AS Decimal(18, 2)), 1, 2, CAST(N'2024-12-18T13:58:05.290' AS DateTime), N'Admin', CAST(N'2024-12-18T13:58:05.290' AS DateTime), N'Admin', 1, 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (6, N'Laptop ASUS Vivobook 15 X1504ZA-NJ517W', N'Trang bị vi xử lý Intel Core i5-1235U, cùng với card đồ họa tích hợp Intel Iris Xe Graphics, mang lại hiệu suất mạnh mẽ cho mọi nhu cầu từ công việc đến giải trí
Màn hình FHD 15.6 inch với độ sáng 250 nits và độ phủ màu 45% NTSC, mang lại hình ảnh sắc nét và sống động
Công nghệ âm thanh SonicMaster, cùng với loa tích hợp và micrô mảng, tạo ra trải nghiệm âm thanh vượt trội
Bảo mật với cảm biến vân tay tích hợp', N'Trang bị vi xử lý Intel Core i5-1235U, cùng với card đồ họa tích hợp Intel Iris Xe Graphics, mang lại hiệu suất mạnh mẽ cho mọi nhu cầu từ công việc đến giải trí
Màn hình FHD 15.6 inch với độ sáng 250 nits và độ phủ màu 45% NTSC, mang lại hình ảnh sắc nét và sống động
Công nghệ âm thanh SonicMaster, cùng với loa tích hợp và micrô mảng, tạo ra trải nghiệm âm thanh vượt trội
Bảo mật với cảm biến vân tay tích hợp vào touchpad', N'20.jpg', CAST(13490000.00 AS Decimal(18, 2)), 2, 2, CAST(N'2024-12-18T13:58:05.290' AS DateTime), N'Admin', CAST(N'2024-12-18T13:58:05.290' AS DateTime), N'Admin', 1, 1, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (7, N'Apple MacBook Air M2 2024 8CPU 8GPU 16GB 256GB I Chính hãng Apple Việt Nam', N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg
Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier
Đa nhiệm mượt mà - Ram 16GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc
Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits', N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg
Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier
Đa nhiệm mượt mà - Ram 16GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc
Màn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits', N'21.jpg', CAST(24290000.00 AS Decimal(18, 2)), 2, 1, CAST(N'2024-12-18T13:58:06.937' AS DateTime), N'Admin', CAST(N'2024-12-18T13:58:06.937' AS DateTime), N'Admin', 1, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (8, N'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', N'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng
Hiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS
Đa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm
Trang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng', N'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng
Hiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS
Đa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm
Trang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng', N'22.jpg', CAST(17990000.00 AS Decimal(18, 2)), 2, 1, CAST(N'2024-12-18T13:58:06.937' AS DateTime), N'Admin', CAST(N'2024-12-18T13:58:06.937' AS DateTime), N'Admin', 1, 0, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (9, N'Laptop Acer Aspire 3 Spin A3SP14-31PT-387Z', N'Thiết kế 2-trong-1 linh hoạt, kết hợp giữa laptop và máy tính bảng với màn hình cảm ứng xoay 360 độ.
Màn hình 14 inch Full HD+ cung cấp hình ảnh sắc nét và góc nhìn rộng, phù hợp cho cả công việc và giải trí.
Bộ vi xử lý Intel Core i3-N305 thế hệ mới đảm bảo hiệu suất ổn định cho các tác vụ hàng ngày và đa nhiệm nhẹ.', N'Thiết kế 2-trong-1 linh hoạt, kết hợp giữa laptop và máy tính bảng với màn hình cảm ứng xoay 360 độ.
Màn hình 14 inch Full HD+ cung cấp hình ảnh sắc nét và góc nhìn rộng, phù hợp cho cả công việc và giải trí.
Bộ vi xử lý Intel Core i3-N305 thế hệ mới đảm bảo hiệu suất ổn định cho các tác vụ hàng ngày và đa nhiệm nhẹ.', N'23.jpg', CAST(9490000.00 AS Decimal(18, 2)), 2, 2, CAST(N'2024-12-18T13:58:06.937' AS DateTime), N'Admin', CAST(N'2024-12-18T13:58:06.937' AS DateTime), N'Admin', 1, 1, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (10, N'Tai nghe Bluetooth Apple AirPods 4', N'Chip H2 nổi bật, mạnh mẽ được tích hợp trong Airpod 4 giúp trải nghiệm âm thanh của bạn mượt mà hơn.
Công nghệ Bluetooth 5.3 mang đến kết nối ổn định, mượt mà, tiêu thụ năng lượng thấp, giúp bạn tiết kiệm pin đáng kể.
Khả năng chống nước đạt chuẩn IP54 mang lại cảm giác thoải mái khi sử dụng tai nghe ngoài trời mà không lo bụi bẩn, hoặc mồ hôi.', N'Chip H2 nổi bật, mạnh mẽ được tích hợp trong Airpod 4 giúp trải nghiệm âm thanh của bạn mượt mà hơn.
Công nghệ Bluetooth 5.3 mang đến kết nối ổn định, mượt mà, tiêu thụ năng lượng thấp, giúp bạn tiết kiệm pin đáng kể.
Khả năng chống nước đạt chuẩn IP54 mang lại cảm giác thoải mái khi sử dụng tai nghe ngoài trời mà không lo bụi bẩn, hoặc mồ hôi.', N'25.jpg', CAST(329000.00 AS Decimal(18, 2)), 3, 1, NULL, N'Admin', NULL, NULL, 1, 1, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (11, N'Tai nghe Bluetooth chụp tai Sony WH-1000XM5', N'Công nghệ Auto NC Optimizer tự động khử tiếng ồn dựa theo môi trường
Trải nghiệm nghe chân thật, sống động nhờ tính năng 360 Reality Audio
Thiết kế sang trọng, trọng lượng nhẹ với phần da mềm mại, ôm khít đầu
Năng lượng cho cả ngày dài với thời lượng sử dụng pin lên đến 40 giờ', N'Công nghệ Auto NC Optimizer tự động khử tiếng ồn dựa theo môi trường
Trải nghiệm nghe chân thật, sống động nhờ tính năng 360 Reality Audio
Thiết kế sang trọng, trọng lượng nhẹ với phần da mềm mại, ôm khít đầu
Năng lượng cho cả ngày dài với thời lượng sử dụng pin lên đến 40 giờ', N'26.jpg', CAST(619000.00 AS Decimal(18, 2)), 3, 1, NULL, N'Admin', NULL, NULL, 1, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDescription], [FullDescription], [ProductImage], [Price], [CategoryID], [BrandID], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy], [Status], [ShockSale], [IsRecommended]) VALUES (12, N'Tai nghe Bluetooth True Wireless Baseus Bowie E11', N'Màng loa kích thước 12mm cho âm thanh sống động, phù hợp với nhiều nhu cầu nghe
Chơi game không lo gián đoạn với khả năng đồng bộ hoá tốt nhờ độ trễ thấp chỉ 0.06s
Công nghệ chống ồn đàm thoại ENC mang đến chất lượng cuộc gọi trong trẻo, rõ ràng
Thời lượng sử dụng đến 30 giờ khi dùng kèm hộp sạc, sẵn sàng phục vụ bạn ở mọi nơi', N'Màng loa kích thước 12mm cho âm thanh sống động, phù hợp với nhiều nhu cầu nghe
Chơi game không lo gián đoạn với khả năng đồng bộ hoá tốt nhờ độ trễ thấp chỉ 0.06s
Công nghệ chống ồn đàm thoại ENC mang đến chất lượng cuộc gọi trong trẻo, rõ ràng
Thời lượng sử dụng đến 30 giờ khi dùng kèm hộp sạc, sẵn sàng phục vụ bạn ở mọi nơi', N'27.jpg', CAST(245000.00 AS Decimal(18, 2)), 3, 1, NULL, N'Admin', NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Nguy?n', N'Dung', N'nguyenvotandung@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Nguy?n', N'Dung', N'nguyenvotandung11@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 0)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'Nguy?n', N'Dung', N'nguyenvotandungcoi@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 0)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (5, N'Nguy?n', N'Dung', N'nguyenvotandung1000@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT ((0)) FOR [IsPopular]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [ShockSale]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsRecommended]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [ASPNET] SET  READ_WRITE 
GO
