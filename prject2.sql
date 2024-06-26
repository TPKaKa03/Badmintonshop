USE [master]
GO
/****** Object:  Database [Project2]    Script Date: 14/03/2024 7:29:02 CH ******/
CREATE DATABASE [Project2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Project2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Project2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Project2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project2] SET  MULTI_USER 
GO
ALTER DATABASE [Project2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 14/03/2024 7:29:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nchar](10) NULL,
	[pass] [nchar](10) NULL,
	[isSell] [int] NOT NULL,
	[isAdmin] [int] NOT NULL,
	[email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nchar](10) NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[IDCart] [int] IDENTITY(1,1) NOT NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumberSP]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberSP](
	[SLDaBan] [int] NOT NULL,
	[ProductID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NOT NULL,
	[cid] [int] NOT NULL,
	[ total_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickSize]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickSize](
	[pi_id] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[id_s] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[image] [nvarchar](500) NULL,
	[title] [nvarchar](500) NULL,
	[price] [float] NULL,
	[sellID] [int] NOT NULL,
	[cateID] [int] NOT NULL,
	[amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [varchar](100) NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id_s] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_s] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14/03/2024 7:29:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (1, N'sa        ', N'999       ', 1, 0, N'thangpvhe171431@fpt.edu.vn')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (2, N'thangkaka ', N'999       ', 0, 1, N'thangpvhe171431@fpt.edu.vn')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (3, N'kaka      ', N'666       ', 1, 0, N'thangpvhe171431@fpt.edu.vn')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (5, N'khach2    ', N'666       ', 0, 0, N'thangpvhe171431@fpt.edu.vn')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (6, N'kaka01    ', N'123       ', 1, 0, N'thangpvhe171431@fpt.edu.vn')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (9, N'adasdasdsa', N'1232323   ', 1, 0, N'thangpvhe171431@fpt.edu.vn')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [email]) VALUES (11, N'cus1      ', N'666       ', 0, 0, N'thangpvhe171431@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (45, 5, 648000.0000, N'MOMO', N'Hà Đông, Hà Nội', CAST(N'2021-11-04' AS Date), 919208356)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (46, 5, 298000.0000, N'MOMO', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (47, 5, 378000.0000, N'VNPAY', N'Ninh Bình', CAST(N'2021-11-03' AS Date), 88195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (48, 5, 270000.0000, N'Chua thanh toán (VNPAY)', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 383298183)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (49, 5, 417000.0000, N'Chua thanh toán (VNPAY)', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (50, 5, 567000.0000, N'COD', N'Ninh Bình', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (51, 5, 278000.0000, N'COD', N'test', CAST(N'2021-11-04' AS Date), 123)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (52, 5, 189000.0000, N'COD', N'è', CAST(N'2021-11-04' AS Date), 2)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (53, 5, 259000.0000, N'MOMO', N'Check', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (54, 5, 270000.0000, N'VNPAY', N'Check', CAST(N'2021-11-04' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (55, 5, 259000.0000, N'MOMO', N'jrtn', CAST(N'2021-11-06' AS Date), 2)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (56, 5, 810000.0000, N'VNPAY', N'df', CAST(N'2021-11-06' AS Date), 3)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (57, 5, 149000.0000, N'MOMO', N'Ninh Binh', CAST(N'2021-11-08' AS Date), 383298183)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (58, 5, 417000.0000, N'VNPAY', N'bf', CAST(N'2021-11-08' AS Date), 4)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (59, 5, 149000.0000, N'COD', N'rshfxb12414', CAST(N'2021-11-08' AS Date), 23544353)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (60, 5, 517000.0000, N'MOMO', N'Ninh Bình', CAST(N'2021-11-09' AS Date), 888195313)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (61, 5, 139000.0000, N'VNPAY', N'ưgrs', CAST(N'2021-11-09' AS Date), 32)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[bill_detail] ON 

INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (40, 45, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (41, 45, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (42, 46, N'AT533', 2, N'S         ', N'White', 298000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (43, 47, N'T2099', 2, N'L         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (44, 48, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (45, 49, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (46, 50, N'T2099', 3, N'S         ', N'Purple', 567000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (47, 51, N'AT536', 2, N'S         ', N'Red', 278000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (48, 52, N'T2099', 1, N'S         ', N'Purple', 189000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (49, 53, N'T2127', 1, N'L         ', N'Black', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (50, 54, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (51, 55, N'T2128', 1, N'XS        ', N'White', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (52, 56, N'T2129', 3, N'XS        ', N'White', 810000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (53, 57, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (54, 58, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (55, 59, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (56, 60, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (57, 60, N'AT536', 1, N'L         ', N'Red', 139000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (58, 61, N'AT536', 1, N'S         ', N'Red', 139000.0000)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([accountID], [productID], [IDCart], [amount]) VALUES (1, 3, 6, 2)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Yonex')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Victor')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Lining')
GO
INSERT [dbo].[NumberSP] ([SLDaBan], [ProductID]) VALUES (1, 12)
INSERT [dbo].[NumberSP] ([SLDaBan], [ProductID]) VALUES (3, 12)
INSERT [dbo].[NumberSP] ([SLDaBan], [ProductID]) VALUES (1, 38)
INSERT [dbo].[NumberSP] ([SLDaBan], [ProductID]) VALUES (1, 3)
INSERT [dbo].[NumberSP] ([SLDaBan], [ProductID]) VALUES (2, 19)
INSERT [dbo].[NumberSP] ([SLDaBan], [ProductID]) VALUES (2, 3)
INSERT [dbo].[NumberSP] ([SLDaBan], [ProductID]) VALUES (3, 19)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (1, 750, 1, 3, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (2, 750, 2, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (3, 850, 3, 8, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (4, 750, 4, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (5, 750, 5, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (6, 750, 6, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (7, 750, 7, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (8, 750, 8, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (9, 750, 9, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (10, 750, 10, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (11, 750, 11, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (12, 5000, 12, 38, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (13, 750, 12, 3, 4)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (14, 5000, 13, 38, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (15, 5000, 14, 38, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (16, 850, 15, 19, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (17, 250, 15, 11, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (18, 850, 16, 19, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (19, 250, 16, 11, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (20, 850, 16, 13, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (21, 750, 17, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (22, 750, 18, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (23, 750, 19, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (24, 750, 20, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (25, 750, 21, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (26, 750, 23, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (27, 750, 24, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (28, 750, 25, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (29, 750, 26, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (30, 350, 26, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (31, 750, 27, 3, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (32, 750, 29, 3, 8)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (33, 750, 30, 3, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [price], [order_id], [product_id], [amount]) VALUES (34, 750, 31, 3, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (1, CAST(N'2023-10-28' AS Date), 1, 753)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (2, CAST(N'2023-10-28' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (3, CAST(N'2023-10-29' AS Date), 1, 851)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (4, CAST(N'2023-10-30' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (5, CAST(N'2023-10-30' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (6, CAST(N'2023-10-30' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (7, CAST(N'2023-10-30' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (8, CAST(N'2023-10-30' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (9, CAST(N'2023-10-31' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (10, CAST(N'2023-10-31' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (11, CAST(N'2023-10-31' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (12, CAST(N'2023-10-31' AS Date), 5, 5757)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (13, CAST(N'2023-10-31' AS Date), 5, 5003)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (14, CAST(N'2023-10-31' AS Date), 5, 5003)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (15, CAST(N'2023-10-31' AS Date), 5, 1103)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (16, CAST(N'2023-10-31' AS Date), 5, 1956)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (17, CAST(N'2023-10-31' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (18, CAST(N'2023-11-01' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (19, CAST(N'2023-11-01' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (20, CAST(N'2023-11-01' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (21, CAST(N'2023-11-01' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (22, CAST(N'2023-11-02' AS Date), 3, 0)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (23, CAST(N'2023-11-02' AS Date), 1, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (24, CAST(N'2023-11-02' AS Date), 6, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (25, CAST(N'2023-11-02' AS Date), 6, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (26, CAST(N'2023-11-02' AS Date), 6, 1105)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (27, CAST(N'2023-11-06' AS Date), 1, 751)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (28, CAST(N'2023-11-06' AS Date), 1, 0)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (29, CAST(N'2023-11-06' AS Date), 1, 758)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (30, CAST(N'2023-11-07' AS Date), 2, 752)
INSERT [dbo].[Orders] ([order_id], [order_date], [cid], [ total_price]) VALUES (31, CAST(N'2023-11-07' AS Date), 2, 752)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (3, N'Yonix Volic Lite 35i)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-yonex-voltric-lite-35i-chinh-hang_1695752798.webp', N'Voltric Lite 35i có trọng lượng nhẹ (5U) rất dễ chơi và thuần thục. Vợt nhẹ giúp người chơi không mỏi
		   và có thể tập luyện hay thi đấu trong thời gian dài. Với những người bước đầu chơi cầu lông muốn rèn luyện lối đánh tấn công, Voltric Lite 35i là một sự lựa chọn tuyệt vời.', 750, 1, 1, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (6, N'SET Yonex AT700 - Nội Địa Trung)', N'https://cdn2.shopvnb.com/uploads/gallery/set-vot-cau-long-yonex-at700-noi-dia-trung.webp', N'Vợt cầu lông Yonex AT700 - Nội Địa Trung là siêu phẩm siêu cao cấp vừa được Yonex tung ra vào giữa năm 2023 để kỷ niệm nhà vô địch cầu lông thế giới một thời Lindan. 
		   Chắc chắn đây sẽ là cây vợt đáng mơ ước của những người chơi có trình độ cao, đặc biệt là các VĐV thi đấu chuyên nghiệp.', 1.05, 6, 1, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (7, N'Yonex Astrox 100zz - Nội Địa Trung)', N'https://cdn2.shopvnb.com/uploads/gallery/set-vot-cau-long-yonex-astrox-100zz-noi-dia-trung-6.webp', N'SET vợt cầu lông Yonex Astrox 100zz - Nội Địa Trung là series nguyên bộ được mong chờ đợi nhất hiện nay dành cho những ai yêu thích đánh đơn với những cải tiến xung quanh những ưu điểm vốn có 
		    của dòng 100zz ở các phiên bản trước đó.', 950, 3, 1, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (8, N'Yonex Nanoflare X7 (Mã KR))', N'https://cdn2.shopvnb.com/uploads/gallery/set-vot-cau-long-yonex-astrox-100zz-noi-dia-trung-6.webp', N'SET vợt cầu lông Yonex Astrox 100zz - Nội Địa Trung là series nguyên bộ được mong chờ đợi nhất hiện nay dành cho những ai yêu thích đánh đơn với những cải tiến xung quanh những ưu điểm vốn có 
		    của dòng 100zz ở các phiên bản trước đó.', 850, 6, 1, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (9, N'Yonex Nanoflare 300 - Đỏ (Mã JP))', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-yonex-nanoflare-300-do-ma-jp-8.webp', N'Vợt cầu lông Yonex Nanoflare 300 - Đỏ (Mã JP) là mẫu vợt cao cấp của hãng Yonex trong dòng Nanoflare với khả năng kiểm soát và điều cầu phản tạt cực kỳ khó chịu. Bên cạnh đó, 
		   sự linh hoạt cũng là ưu điểm bởi trọng lượng nhẹ.', 450, 1, 1, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (11, N' Victor TK-Rabbit (Nội Địa Trung))', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-victor-tk-rabbit-noi-dia-trung-1_1695953940.webp', N'Vợt Cầu Lông Victor TK-Rabbit (Nội Địa Trung) là một cây vợt giá rẻ, trọng lượng nhẹ, dễ chơi với phối màu trang nhã, rất phù hợp với những người mới làm quen và tập luyện cầu lông.
           Khung vợt được cải thiện sự cứng cáp, có khả năng chịu cân cao và chống vặn xoắn tốt hơn. Vành vát hình hộp giúp khung vợt chắc chắn hơn, mang lại sự ổn định cho từng cú đánh.', 250, 1, 2, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (12, N'Victor MX80 (Nội Địa Trung)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-victor-mx80-noi-dia-trung_1694825189.webp', N'Đây là cây vợt được ưa chuộng gần như nhất nhì của Victor, chỉ sau Victor BS12 đôi chút. Vẻ ngoài của vợt được phối những gam màu lạnh và màu tối cùng nhau tạo nên một sự hài hòa trong màu sắc.
		   Điều này làm nên điểm đặc biệt cho Victor MX 80 khi màu vợt có hơi hướng "nhẹ nhàng" còn công dụng chính của vợt lại là thiên công.', 150, 3, 2, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (13, N'Victor ARS 90K II (Nội Địa Trung))', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-victor-ars-90k-ii-noi-dia-trung_1694824293.webp', N'Vợt cầu lông VICTOR Badminton Auraspeed 90K II (Nội địa Trung) là một trong những sản phẩm mới nhất của thương hiệu VICTOR - đến từ Singapore. Đây là một cây vợt cầu lông cao cấp được thiết
		   kế để đem lại sự linh hoạt, chính xác và tốc độ cho người chơi. ', 850, 6, 2, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (14, N'Victor Thruster TTY – Tai Tzu Ying Chính Hãng)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-victor-thruster-tty-ndash-tai-tzu-ying-chinh-hang_1693533205.webp', N'Trong năm 2023, hãng Victor đã kết hợp với tay vợt đơn nữ hàng đầu Thế Giới Tai Tzu Ying cho ra bộ sưu tập Tai Tzu Ying gồm rất nhiều sản phẩm, trong đó nổi bật nhất là mẫu Vợt cầu lông Victor Thruster TTY - Tai Tzu Ying Chính Hãng.
		   Được thiết kế với tone màu Trắng chủ đạo, điểm các họa tiết màu Tím và Vàng Gold tạo nên ngoại hình thanh thoát không kém phần cá tính, thể hiện rõ lối chơi tốc độ và mạnh mẽ của "Nữ hoàng Trickshot" Tai Tzu Ying.', 750, 1, 2, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (15, N'Victor ARS 90K II (Nội Địa Trung))', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-victor-ars-90k-ii-noi-dia-trung_1694824293.webp', N'Vợt cầu lông VICTOR Badminton Auraspeed 90K II (Nội địa Trung) là một trong những sản phẩm mới nhất của thương hiệu VICTOR - đến từ Singapore. Đây là một cây vợt cầu lông cao cấp được thiết
		   kế để đem lại sự linh hoạt, chính xác và tốc độ cho người chơi. ', 350, 3, 2, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (16, N'Victor Chulian - Xanh (Nội Địa Trung)', N'https://cdn2.shopvnb.com/uploads/gallery/set-vot-cau-long-victor-chulian-xanh-noi-dia-trung_1693854773.webp', N'Vợt Cầu Lông Victor Chulian - Xanh (Nội Địa Trung) là mẫu vợt tầm trung của hãng Victor được ra mắt năm 2023 thuộc dòng Jetspeed, đây là cây vợt thiên về lối đánh tốc độ, phản tạt, điều cầu nhanh và linh hoạt với những pha vung vợt chớp nhoáng.
         Họa tiết trên Victor Chulian - Xanh (Nội Địa Trung) được trang trí bằng các đường lượn sóng đơn giản, bắt mắt, màu xanh được phối với màu trắng tinh tế tạo nên nét lôi cuốn cho cây vợt ngay từ cái nhìn đầu tiên. ', 550, 6, 2, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (17, N'Victor TK-FH Trắng Xanh (Nội Địa Trung)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-victor-tk-fh-trang-xanh-noi-dia-trung.webp', N'Vợt cầu lông TK-FH Trắng Xanh (Nội địa Trung) là sự kết hợp hoàn hảo giữa chất lượng, độ bền và giá trị vượt trội, hướng đến mọi đối tượng người chơi đang tìm kiếm một cây vợt chất lượng trong
		   phân khúc giá rẻ. Với sự ra mắt 2 phiên bản 4U và 5U, vợt này mang đến sự lựa chọn linh hoạt cho người chơi.', 950, 1, 2, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (18, N'Lining Turbo Charging 10B (Nội Địa Trung)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-lining-turbo-charging-10b-noi-dia-trung-1_1696476502.webp', N'Vợt Cầu Lông Lining Turbo Charging 10B (Nội Địa Trung) được thương hiệu Lining ra mắt vào năm 2020, thừa hưởng các công nghệ nổi trội của những dòng vợt đàn anh hàng đầu thế giới như Aeronaut 9000C, Calibar 900B, Turbo Charging 75.
 Kết hợp cùng với chất liệu Carbon Fiber có độ dẻo dai khá chắc chắn cùng trọng lượng nhẹ, cấu trúc khung vợt có hệ số cản không khí cực thấp và ở cường độ cao, tạo nên những pha cầu toàn diện cho các lông thủ.', 350, 3, 3, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (19, N'Lining Axforce 9 Purple Chính Hãng)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-lining-axforce-9-purple-chinh-hang_1694229489.webp', N'Vợt cầu lông Lining Axforce 9 Purple Chính Hãng là mẫu vợt cầu lông giá rẻ vừa được Lining cho ra mắt trong thời gian gần đây với phiên bản màu tím đầy lôi cuốn. Vợt chủ yếu hướng đến các đối tượng người mới tập chơi.
 Đũa vợt Lining Axforce 9 Purple Chính Hãng được thiết kế ngắn hơn 10mm so với chiều dài thông thường, kết hợp với đầu vợt hơi nặng giúp những pha đánh lưới, chụp cầu vừa đảm bảo sự linh hoạt vừa giúp cầu đi cắm hơn bên phần sân đối phương.', 850, 1, 3, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (20, N'Lining HC1200 Pink Chính Hãng)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-lining-hc1200-pink-chinh-hang_1693014367.webp', N'- Thương hiệu vợt cầu lông Lining của Trung Quốc đã quá nổi tiếng trên thị trường Quốc Tế nổi trội về ngoại hình thiết kế tuyệt mỹ cùng phối màu bắt mắt nhưng hơn hết chính là sự bền bỉ, cứng cáp, yên tâm bung hết khả năng của mình trên 
		   sân đấu so với các dòng vợt khác trên thị trường hiện nay. Và vừa được cho ra mắt trong năm 2021 chính là cây vợt cầu lông Lining HC1200 Pink chính hãng - siêu phẩm chất lượng trong phân khúc tầm 1 triệu.', 450, 6, 3, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (21, N'Lining Windstorm 72 Blue Chính Hãng)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-lining-windstorm-72-blue-chinh-hang.webp', N' Vợt Cầu Lông Lining Windstorm 72 Blue Chính Hãng là cây vợt mới được hãng cầu lông lining cho ra mắt vào thời điểm gần đây sản phẩm được thiết kế dạng thiên về thủ phản tạt cầu nhanh 
		   trên lưới. Vợt có trọng lượng nhẹ. Sử dụng tốt với những người đánh trên lưới phản tạt lực cổ tay chỉ cần ở mức trung bình.', 650, 3, 3, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (36, N'Vợt Cầu Lông NanoFlare 700 BP (Mã JP)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-nanoflare-700-bp-ma-jp-1_1697400493.webp', N'Vợt cầu lông NanoFlare 700 BP (Mã JP) là phiên bản đặc biệt, chỉ sản xuất với số lượng rất ít và được bán riêng ở thị trường Nhật Bản. Dòng vợt Nanoflare (NNF) nói chung và cây NNF 700 BP nói riêng hướng đến lối chơi nhanh, phòng thủ phản tạt và điều cầu tốc độ. Phiên bản NNF 700 BP được tích hợp thêm một số tính năng mới hỗ trợ những cú đánh duy trì ở tốc độ cao và hiệu quả hơn.', 500, 1, 1, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (38, N'Vợt Cầu Lông NanoFlare 700 BP (Mã JP)', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-nanoflare-700-bp-ma-jp-1_1697400493.webp', N'Vợt cầu lông NanoFlare 700 BP (Mã JP) là phiên bản đặc biệt, chỉ sản xuất với số lượng rất ít và được bán riêng ở thị trường Nhật Bản. Dòng vợt Nanoflare (NNF) nói chung và cây NNF 700 BP nói riêng hướng đến lối chơi nhanh, phòng thủ phản tạt và điều cầu tốc độ. Phiên bản NNF 700 BP được tích hợp thêm một số tính năng mới hỗ trợ những cú đánh duy trì ở tốc độ cao và hiệu quả hơn.', 5000, 3, 1, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (42, N'Vợt cầu lông', N'https://cdn2.shopvnb.com/uploads/gallery/set-vot-cau-long-vs-jinhong-noi-dia-trung_1697677771.webp', N'Set Vợt Cầu Lông VS JinHong (Nội Địa Trung)', 999, 1, 3, 100)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (43, N'Vợt Cầu Lông Apacs Z-Power 900 RP+ Chính Hãng', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-nanoflare-700-bp-ma-jp-1_1697400493.webp', N'', 500, 3, 2, 99)
INSERT [dbo].[Product] ([id], [name], [image], [title], [price], [sellID], [cateID], [amount]) VALUES (45, N'aaaa', N'https://cdn2.shopvnb.com/uploads/gallery/vot-cau-long-nanoflare-700-bp-ma-jp-1_1697400493.webp', N'', 500, 1, 2, 99)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Grey')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2130', N'Grey')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'Pink')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT533', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT533', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD481', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2109', N'Orange')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2127', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2099', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2129', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2106', N'Yellow')
GO
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2127', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'3XL')
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id_s], [name]) VALUES (1, N'3U')
INSERT [dbo].[Size] ([id_s], [name]) VALUES (2, N'4U')
INSERT [dbo].[Size] ([id_s], [name]) VALUES (3, N'5U')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (1, N'Admin', N'khuonghung1423@gmail.com', N'khuonghung1423', N'TRUE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (2, N'Hùng', N'khuonghung', N'123456', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (3, N'Hương', N'thuyhuong1423@gmail.com', N'123456', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (4, N'Khuong Hung', N'khuonghung2408@gmail.com', N'1423', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (5, N'Mai Phạm', N'maipham11@gmail.com', N'123', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin]) VALUES (6, N'Arya', N'hre@yahoo.com', N'1245', N'FALSE')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((100)) FOR [amount]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[NumberSP]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[PickSize]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[PickSize]  WITH CHECK ADD FOREIGN KEY([id_s])
REFERENCES [dbo].[Size] ([id_s])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([sellID])
REFERENCES [dbo].[Account] ([uID])
GO
USE [master]
GO
ALTER DATABASE [Project2] SET  READ_WRITE 
GO
