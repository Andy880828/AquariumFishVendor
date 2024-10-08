USE [master]
GO
/****** Object:  Database [fish]    Script Date: 2024/8/18 下午 12:28:21 ******/
CREATE DATABASE [fish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\fish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\fish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [fish] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fish] SET ARITHABORT OFF 
GO
ALTER DATABASE [fish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [fish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fish] SET RECOVERY FULL 
GO
ALTER DATABASE [fish] SET  MULTI_USER 
GO
ALTER DATABASE [fish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [fish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'fish', N'ON'
GO
ALTER DATABASE [fish] SET QUERY_STORE = ON
GO
ALTER DATABASE [fish] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [fish]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 2024/8/18 下午 12:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[會員編號] [int] NOT NULL,
	[帳號] [varchar](50) NULL,
	[密碼] [varchar](30) NULL,
	[姓名] [nvarchar](50) NULL,
	[電話] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[地址] [nvarchar](50) NULL,
	[身分] [nvarchar](10) NULL,
	[會員階級] [nvarchar](10) NULL,
	[狀態] [nvarchar](10) NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[會員編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 2024/8/18 下午 12:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[員工編號] [int] NOT NULL,
	[姓名] [nvarchar](20) NULL,
	[帳號] [varchar](50) NULL,
	[入職日] [date] NULL,
	[離職日] [date] NULL,
	[薪水] [int] NULL,
	[狀態] [nvarchar](10) NULL,
	[員工階級] [nvarchar](10) NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[員工編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderitems]    Script Date: 2024/8/18 下午 12:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderitems](
	[訂單編號] [int] NOT NULL,
	[訂單項目編號] [int] NOT NULL,
	[產品編號] [int] NULL,
	[產品數量] [int] NULL,
	[產品金額] [decimal](10, 0) NULL,
	[項目金額] [decimal](10, 0) NULL,
 CONSTRAINT [PK_orderitems] PRIMARY KEY CLUSTERED 
(
	[訂單編號] ASC,
	[訂單項目編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2024/8/18 下午 12:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[訂單編號] [int] NOT NULL,
	[會員編號] [int] NULL,
	[員工編號] [int] NULL,
	[成立時間] [datetime2](7) NULL,
	[總金額] [decimal](8, 0) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[訂單編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2024/8/18 下午 12:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[產品編號] [int] NOT NULL,
	[產品名稱] [nvarchar](50) NULL,
	[學名] [varchar](50) NULL,
	[俗名] [nvarchar](300) NULL,
	[英文名] [nvarchar](50) NULL,
	[命名者] [nvarchar](50) NULL,
	[科別] [nvarchar](10) NULL,
	[淡鹹水] [nvarchar](10) NULL,
	[簡介] [nvarchar](300) NULL,
	[體長] [nchar](10) NULL,
	[原產地] [nvarchar](50) NULL,
	[飼養難度] [nvarchar](20) NULL,
	[可混養] [bit] NULL,
	[產品金額] [decimal](10, 0) NULL,
	[進貨價格] [decimal](10, 0) NULL,
	[庫存量] [int] NULL,
	[供貨] [bit] NULL,
	[圖片] [nvarchar](50) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[產品編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[punch]    Script Date: 2024/8/18 下午 12:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[punch](
	[打卡編號] [int] NOT NULL,
	[員工編號] [int] NULL,
	[日期] [date] NULL,
	[上班時間] [datetime2](7) NULL,
	[下班時間] [datetime2](7) NULL,
 CONSTRAINT [PK_punch] PRIMARY KEY CLUSTERED 
(
	[打卡編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (1, N'user001', N'password1', N'陳君曄', N'0912345678', N'user001@gmail.com', N'台北市大安區和平東路10號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (2, N'user002', N'password2', N'林雅婷', N'0922334455', N'user002@gmail.com', N'台中市西屯區台灣大道三段', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (3, N'user003', N'password3', N'王大明', N'0933445566', N'user003@gmail.com', N'高雄市苓雅區五福路30號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (4, N'user004', N'password4', N'李小美', N'0944556677', N'user004@gmail.com', N'新北市板橋區中山路一段', N'顧客', N'一般會員', N'停權')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (5, N'user005', N'password5', N'黃志明', N'0955667788', N'user005@gmail.com', N'新竹市東區光復路100號', N'員工', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (6, N'user006', N'password6', N'張雅涵', N'0966778899', N'user006@gmail.com', N'台南市東區崇德路50號', N'顧客', N'VIP會員', N'黑名單')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (7, N'user007', N'password7', N'蔡依林', N'0977889900', N'user007@gmail.com', N'台北市信義區忠孝東路五段', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (8, N'user008', N'password8', N'賴冠霖', N'0988990011', N'user008@gmail.com', N'台中市北屯區北屯路123號', N'員工', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (9, N'user009', N'password9', N'劉德華', N'0999001122', N'user009@gmail.com', N'高雄市三民區建國路50號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (10, N'user010', N'password10', N'王心凌', N'0911223344', N'user010@gmail.com', N'台北市士林區中山北路六段', N'顧客', N'一般會員', N'停權')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (11, N'user011', N'password11', N'陳奕迅', N'0922334455', N'user011@gmail.com', N'台南市中西區中正路75號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (12, N'user012', N'password12', N'張信哲', N'0933445566', N'user012@gmail.com', N'台中市南屯區向上路一段', N'顧客', N'VIP會員', N'黑名單')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (13, N'user013', N'password13', N'周杰倫', N'0944556677', N'user013@gmail.com', N'台北市內湖區文德路15號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (14, N'user014', N'password14', N'張惠妹', N'0955667788', N'user014@gmail.com', N'高雄市左營區博愛路75號', N'員工', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (15, N'user015', N'password15', N'孫燕姿', N'0966778899', N'user015@gmail.com', N'新北市永和區永和路二段', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (16, N'user016', N'password16', N'鄭伊健', N'0977889900', N'user016@gmail.com', N'新竹市香山區中華路一段', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (17, N'user017', N'password17', N'楊丞琳', N'0988990011', N'user017@gmail.com', N'台北市松山區八德路四段', N'顧客', N'VIP會員', N'黑名單')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (18, N'user018', N'password18', N'許茹芸', N'0999001122', N'user018@gmail.com', N'台中市西屯區台灣大道二段', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (19, N'user019', N'password19', N'陳小春', N'0911223344', N'user019@gmail.com', N'台南市北區成功路88號', N'員工', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (20, N'user020', N'password20', N'林志玲', N'0922334455', N'user020@gmail.com', N'高雄市鳳山區鳳山路123號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (21, N'user021', N'password21', N'潘瑋柏', N'0933445566', N'user021@gmail.com', N'台北市萬華區萬大路20號', N'顧客', N'一般會員', N'停權')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (22, N'user022', N'password22', N'江美琪', N'0944556677', N'user022@gmail.com', N'新北市汐止區忠孝東路六段', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (23, N'user023', N'password23', N'梁靜茹', N'0955667788', N'user023@gmail.com', N'台中市北屯區松竹路50號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (24, N'user024', N'password24', N'陳喬恩', N'0966778877', N'user024@gmail.com', N'台南市南區大同路100號', N'員工', N'VIP會員', N'黑名單')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (25, N'user025', N'password25', N'范瑋琪', N'0977889900', N'user025@gmail.com', N'高雄市小港區沿海路17號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (26, N'user026', N'password26', N'彭佳慧', N'0988990011', N'user026@gmail.com', N'台北市中山區南京東路三段', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (27, N'user027', N'password27', N'徐若瑄', N'0999001122', N'user027@gmail.com', N'新竹市竹北市中正路123號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (28, N'user028', N'password28', N'周渝民', N'0911223344', N'user028@gmail.com', N'台中市北區中清路50號', N'顧客', N'VIP會員', N'停權')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (29, N'user029', N'password29', N'言承旭', N'0922334455', N'user029@gmail.com', N'台南市東區林森路75號', N'員工', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (30, N'user030', N'password30', N'徐熙媛', N'0933445566', N'user030@gmail.com', N'高雄市前鎮區前鎮路17號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (31, N'user031', N'password31', N'柯震東', N'0944556677', N'user031@gmail.com', N'新北市土城區學成路20號', N'顧客', N'一般會員', N'黑名單')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (32, N'user032', N'password32', N'王力宏', N'0955667788', N'user032@gmail.com', N'台中市南區建國路50號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (33, N'user033', N'password33', N'張柏芝', N'0966778899', N'user033@gmail.com', N'台北市文山區木柵路一段', N'員工', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (34, N'user034', N'password34', N'謝霆鋒', N'0977889900', N'user034@gmail.com', N'新竹市北區中山路10號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (35, N'user035', N'password35', N'黃立行', N'0988990011', N'user035@gmail.com', N'台南市新營區中山路17號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (36, N'user036', N'password36', N'林俊傑', N'0999001122', N'user036@gmail.com', N'台北市士林區士東路10號', N'顧客', N'VIP會員', N'停權')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (37, N'user037', N'password37', N'楊宗緯', N'0911223344', N'user037@gmail.com', N'台中市東區東光路30號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (38, N'user038', N'password38', N'李榮浩', N'0922334455', N'user038@gmail.com', N'台南市永康區永大路50號', N'員工', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (39, N'user039', N'password39', N'周慧敏', N'0933445566', N'user039@gmail.com', N'高雄市楠梓區楠梓路75號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (40, N'user040', N'password40', N'劉若英', N'0944556677', N'user040@gmail.com', N'新北市三重區三和路一段', N'顧客', N'一般會員', N'黑名單')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (41, N'user041', N'password41', N'郭富城', N'0955667788', N'user041@gmail.com', N'台中市大甲區中山路75號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (42, N'user042', N'password42', N'陳冠希', N'0966778899', N'user042@gmail.com', N'台南市安南區安和路17號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (43, N'user043', N'password43', N'蔡健雅', N'0977889900', N'user043@gmail.com', N'台北市大同區太原路75號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (44, N'user044', N'password44', N'林宥嘉', N'0988990011', N'user044@gmail.com', N'高雄市鼓山區鼓山路10號', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (45, N'user045', N'password45', N'吳宗憲', N'0999001122', N'user045@gmail.com', N'台北市松山區南京東路四段', N'顧客', N'VIP會員', N'停權')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (46, N'user046', N'password46', N'周華健', N'0911223344', N'user046@gmail.com', N'台南市安平區安平路50號', N'員工', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (47, N'user047', N'password47', N'王菲', N'0922334455', N'user047@gmail.com', N'新竹市湖口鄉忠孝路20號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (48, N'user048', N'password48', N'謝金燕', N'0933445566', N'user048@gmail.com', N'台中市南屯區南屯路一段', N'顧客', N'一般會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (49, N'user049', N'password49', N'蔡淑臻', N'0944556677', N'user049@gmail.com', N'台北市北投區中和路50號', N'顧客', N'VIP會員', N'正常')
INSERT [dbo].[clients] ([會員編號], [帳號], [密碼], [姓名], [電話], [Email], [地址], [身分], [會員階級], [狀態]) VALUES (50, N'user050', N'password50', N'謝依霖', N'0955667788', N'user050@gmail.com', N'高雄市岡山區岡山路100號', N'顧客', N'一般會員', N'黑名單')
GO
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100001, N'黃志明', N'user005', CAST(N'2020-01-01' AS Date), NULL, 30000, N'正常', N'店員')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100002, N'賴冠霖', N'user008', CAST(N'2020-08-11' AS Date), NULL, 32000, N'正常', N'店員')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100003, N'張惠妹', N'user014', CAST(N'2021-04-21' AS Date), NULL, 28000, N'正常', N'店員')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100004, N'陳小春', N'user019', CAST(N'2021-05-29' AS Date), NULL, 30000, N'正常', N'店員')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100005, N'陳喬恩', N'user024', CAST(N'2020-07-19' AS Date), NULL, 35000, N'留職停薪', N'店員')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100006, N'言承旭', N'user029', CAST(N'2021-08-19' AS Date), NULL, 35000, N'正常', N'店員')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100007, N'張柏芝', N'user033', CAST(N'2019-06-28' AS Date), NULL, NULL, N'正常', N'老闆')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100008, N'李榮浩', N'user038', CAST(N'2022-03-11' AS Date), NULL, 25000, N'正常', N'店員')
INSERT [dbo].[employees] ([員工編號], [姓名], [帳號], [入職日], [離職日], [薪水], [狀態], [員工階級]) VALUES (100009, N'周華健', N'user046', CAST(N'2023-05-17' AS Date), NULL, 24000, N'正常', N'店員')
GO
INSERT [dbo].[orderitems] ([訂單編號], [訂單項目編號], [產品編號], [產品數量], [產品金額], [項目金額]) VALUES (1, 0, 101, 20, CAST(50 AS Decimal(10, 0)), CAST(1000 AS Decimal(10, 0)))
INSERT [dbo].[orderitems] ([訂單編號], [訂單項目編號], [產品編號], [產品數量], [產品金額], [項目金額]) VALUES (2, 0, 101, 2, CAST(50 AS Decimal(10, 0)), CAST(100 AS Decimal(10, 0)))
INSERT [dbo].[orderitems] ([訂單編號], [訂單項目編號], [產品編號], [產品數量], [產品金額], [項目金額]) VALUES (2, 1, 102, 3, CAST(150 AS Decimal(10, 0)), CAST(450 AS Decimal(10, 0)))
INSERT [dbo].[orderitems] ([訂單編號], [訂單項目編號], [產品編號], [產品數量], [產品金額], [項目金額]) VALUES (3, 0, 101, 2, CAST(50 AS Decimal(10, 0)), CAST(100 AS Decimal(10, 0)))
INSERT [dbo].[orderitems] ([訂單編號], [訂單項目編號], [產品編號], [產品數量], [產品金額], [項目金額]) VALUES (3, 1, 103, 3, CAST(100 AS Decimal(10, 0)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[orders] ([訂單編號], [會員編號], [員工編號], [成立時間], [總金額]) VALUES (1, 11, 100005, CAST(N'2024-08-13T01:18:46.2566667' AS DateTime2), CAST(1000 AS Decimal(8, 0)))
INSERT [dbo].[orders] ([訂單編號], [會員編號], [員工編號], [成立時間], [總金額]) VALUES (2, 11, 100001, CAST(N'2024-08-16T23:50:31.2300000' AS DateTime2), CAST(550 AS Decimal(8, 0)))
INSERT [dbo].[orders] ([訂單編號], [會員編號], [員工編號], [成立時間], [總金額]) VALUES (3, 3, 100001, CAST(N'2024-08-17T00:08:10.5533333' AS DateTime2), CAST(400 AS Decimal(8, 0)))
GO
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (101, N'後鰭魮脂鯉', N'Hyphessobrycon metae', N'紅尾黑霓虹', N'Purple Tetra', N'Eigenmann & Henn, 1914', N'脂鯉科', N'淡水', N'體側具有金色縱線，縱線下方為黑色；尾柄上下端具金色亮點，棲息於水層中底部。', N'3.5-4.0 cm', N'南美洲', N'低', 1, CAST(50 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), 498, 1, N'Hyphessobrycon_metae.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (102, N'布氏鱧', N'Channa bleheri', N'七彩雷龍', N'Rainbow snakehead', N'Vierke, 1991', N'鱧科', N'淡水', N'體呈圓筒狀，可利用迷器呼吸，棲息於相對低溶氧之止水環境，可耐短暫離水環境；體色鮮艷，尾部具有紅色斑點，臀鰭則為略帶金屬光澤的藍綠色。', N'12-18 cm  ', N'亞洲', N'低', 0, CAST(150 AS Decimal(10, 0)), CAST(100 AS Decimal(10, 0)), 300, 1, N'Channa_bleheri.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (103, N'環帶扁鱂', N'Epiplatys annulatus', N'斑節鱂', N'Clown Killifish', N'Boulenger, 1915', N'鰕鱂科', N'淡水', N'體型嬌小，體幹具鵝黃與黑色相間之寬帶或環紋；尾柄及尾鰭中央為紅色，上下緣則呈藍綠色。', N'3.0-4.0cm ', N'非洲', N'中', 1, CAST(100 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), 197, 1, N'Epiplatys_annulatus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (104, N'條紋無鬚魮', N'Puntius fasciatus', N'皇冠櫻桃鯽', N'Melon Barb', N'Jerdon, 1849', N'鯉科', N'淡水', N'體側具5-6道略部規則之橫向寬帶，但第一條皆位於眼後；成熟雄性體側、各鰭與吻端會出現桃紅色，且體側具陰影狀色塊。', N'5.0-7.0 cm', N'亞洲', N'低', 1, CAST(20 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), 500, 1, N'Puntius_fasciatus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (105, N'淺綠半鉤鯰', N'Hemiancistrus subviridis', N'金鑚異形', N'Green Phantom Pleco', N'Werneke, Sabaj Pérez, Lujan & Armbruster, 2005', N'異甲鯰科', N'淡水', N'全身為銘黃色至黃綠色，多在頭部與體幹前緣具有明亮醒目之黃色斑點分佈；腹部與各鰭顏色較淺。', N'20-25cm   ', N'南美洲', N'低', 1, CAST(150 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), 40, 1, N'Hemiancistrus_subviridis.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (106, N'鳳尾隱帶麗魚', N'Apistogramma cacatuoides', N'鳳尾短鯛', N'Cockatoo Cichlid', N'Hoedeman, 1951', N'慈鯛科', N'淡水', N'南美產小型慈鯛，口裂寬闊且唇部相對較厚；雄性尾鰭上緣多具醒目紅色斑點，雌性於繁殖期則為鮮黃體色。', N'3.0-6.0 cm', N'南美洲', N'低', 1, CAST(30 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)), 250, 1, N'Apistogramma_cacatuoides.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (107, N'格氏似鯔銀漢魚', N'Pseudomugil gertrudae', N'大帆珍珠燕子', N'Spotted blue-eye', N'Weber, 1911', N'鯔銀漢魚科', N'淡水', N'因為具有寬闊各鰭、多彩花色與細緻斑點，加上體型嬌小精緻，因此被稱為彩虹魚；主要搭配小型脂鯉混養，並多出現於水草造景缸。成熟雄性具體型、體色與誇張鰭式等相對優勢。', N'2.0-4.5 cm', N'澳洲、大洋洲', N'低', 1, CAST(35 AS Decimal(10, 0)), CAST(18 AS Decimal(10, 0)), 420, 1, N'Pseudomugil_gertrudae.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (108, N'非洲侏儒枯木塘鱧', N'kribia kribensis', N'非洲筍殼魚', N'Wood goby', N'Boulenger, 1907', N'塘鱧科', N'淡水', N'具有類似蝦虎的型態，多半以底棲或垂直姿態活動於緩流處，並以灰綠或棕褐色之體色於環境中擬態。具成對並各自獨立之腹鰭，非蝦虎之癒合吸盤狀。', N'5.0-7.0cm ', N'非洲', N'低', 1, CAST(55 AS Decimal(10, 0)), CAST(40 AS Decimal(10, 0)), 30, 1, N'kribia_kribensis.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (109, N'螢光綠鼠魚', N'Corydoras aeneus', N'螢光綠鼠', N'Green lacer Corys', N'Gill, 1858', N'美甲鯰科', N'淡水', N'分佈於祕魯境內的特殊鼠魚，隨分佈與採集水系及地點不同，多在背側縱線顏色上，出現古銅、赭紅或螢光綠等特殊色彩。', N'3.5-5.5 cm', N'南美洲', N'低', 1, CAST(80 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), 320, 1, N'Corydoras_aeneus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (110, N'無線棕鱸', N'Dario dario', N'火焰變色龍', N'Scarlet Badis', N'Hamilton, 1822', N'南鱸科', N'淡水', N'分佈於印度境內的小型南鱸，全身具鮮艷之殷紅色澤，成熟雄性尚在體側具金屬光澤之藍綠色橫帶；背鰭硬棘數12 - 14，軟條數6-8；臀鰭軟條數6-7；背鰭末端上緣呈圓形。', N'1.5-2.0 cm', N'亞洲', N'中', 1, CAST(120 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), 55, 1, N'Dario_dario.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (111, N'白星笛鯛', N'Lutjanus stellatus', N'白點仔', N'Star snapper', N'Akazaki, 1983', N'笛鯛科', N'鹹水', N'幼魚頭部有不規則縱紋，成魚則消失，惟成魚面頰部具細緻花紋；體色多以橘黃至褐紅為主，體背側線上方有一個明顯的小白點，吻端則具一藍色斜紋。', N'5-50 cm   ', N'西北太平洋', N'高', 0, CAST(35 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), 70, 1, N'Lutjanus_stellatus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (112, N'單線鉛筆魚', N'Nannostomus unifasciatus', N'鉛筆魚', N'Oneline pencilfish', N'Steindachner, 1876', N'鮰脂鯉科', N'淡水', N'南美產小型脂鯉，泳動行進間多保持挺直之體幹；吻端尖銳，體側具一由吻端延伸至尾柄處及尾鰭下緣的黑色縱帶，成熟雄性個體尾鰭部位偶有紅色斑點。', N'2.5-4.5 cm', N'南美洲', N'中', 1, CAST(80 AS Decimal(10, 0)), CAST(45 AS Decimal(10, 0)), 40, 1, N'Nannostomus_unifasciatus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (113, N'珍珠雷達蝦虎', N'Stigmatogobius sadanundio', N'花騎士', N'Knight Goby', N'Hamilton, 1822', N'鰕虎科', N'鹹水', N'體呈紡錘型，吻端圓鈍；具兩段式背鰭，腹鰭則癒合呈吸盤狀。體色灰白分佈稀疏之黑色圓點，第一背鰭末端具藍黑相間色塊。', N'6.0-9.0 cm', N'西南太平洋', N'中', 1, CAST(100 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), 20, 1, N'Stigmatogobius_sadanundio.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (114, N'弗氏兔脂鯉', N'Leporinus friderici', N'三點鉛筆', N'Threespot leporinus', N'Bloch, 1794', N'小口脂鯉科', N'淡水', N'南美產中型脂鯉，體幅略寬，但仍呈紡錘型；體側具不規則之橫向細紋，但隨成長體側之三個黑點愈加明顯。多以平直軀幹搭配略呈前傾姿態緩慢移動。背鰭軟條數12，臀鰭軟條數11。', N'8-15 cm   ', N'南美洲', N'低', 1, CAST(200 AS Decimal(10, 0)), CAST(140 AS Decimal(10, 0)), 50, 1, N'Leporinus_friderici.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (115, N'似鯖水狼牙魚', N'Hydrolycus scomberoides', N'大暴牙', N'Payara', N'Cuvier, 1819', N'犬齒脂鯉科', N'淡水', N'體呈修長流線之側扁形，體高最明顯處為肩帶位置；口裂明顯深凹且延伸於眼後，並具銳利延長且彎曲之牙齒。胸鰭修長略朝後上方擺動，具明顯掠食性且為典型食魚性之大型脂鯉。', N'6-110 cm  ', N'南美洲', N'高', 0, CAST(450 AS Decimal(10, 0)), CAST(300 AS Decimal(10, 0)), 10, 1, N'Hydrolycus_scomberoides.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (116, N'蘆鰻', N'Erpetoichthys calabaricus', N'草繩恐龍', N'Reedfish', N'Smith, 1865', N'多鰭魚科', N'淡水', N'體幹明顯延長呈繩狀，體表光滑且為灰綠至橄欖綠色，腹部則為褐黃或粉橘色；具鼻管，胸鰭基部具明顯黑斑。背鰭硬棘數7-13，棘間距離較一般多鰭魚明顯，臀鰭軟條數9-14; 脊椎骨數110-113。', N'20-35 cm  ', N'非洲', N'低', 1, CAST(150 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), 120, 1, N'Erpetoichthys_calabaricus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (117, N'泰國叉尾鯰', N'Wallago leerii', N'咖啡巨鯰', N'Striped Wallago Catfish', N'Bleeker, 1851', N'鯰科', N'淡水', N'大型淡水鯰魚，幼魚與亞成魚階段，體側具3-4條縱向深色線條，背部顏色暗沉，體色或有斑剝狀之深淺色塊分佈，呈魚則呈深灰色或墨綠色。背鰭硬棘數1，軟條數4；臀鰭不具硬棘，軟條數60-75。', N'8-150 cm  ', N'亞洲', N'中', 1, CAST(300 AS Decimal(10, 0)), CAST(250 AS Decimal(10, 0)), 75, 1, N'Wallago_leerii.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (118, N'尼羅異耳骨舌魚', N'Heterotis niloticus', N'非洲黑龍', N'African Arowana', N'Cuvier, 1829', N'骨舌魚科', N'淡水', N'體幹為略呈側扁的紡錘狀，吻端相對近似種類較為圓鈍，且不具唇鬚；體色多為灰黑或深褐，尾鰭比例比對較小。背鰭不具硬棘，軟條數32-37；臀鰭軟條數34-39，脊椎骨數60-69。', N'6-100 cm  ', N'亞洲', N'中', 0, CAST(1000 AS Decimal(10, 0)), CAST(750 AS Decimal(10, 0)), 35, 1, N'Heterotis_niloticus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (119, N'甲刺魚', N'Indostomus paradoxus', N'迷你棘龍', N'Pipe fish', N'Prashad & Mukerji, 1929', N'甲刺魚科', N'淡水', N'體型細小，具比例明顯之尾部；背鰭前端為棘刺狀，後端與臀鰭則相對寬闊。多以靜止停佇或緩慢游動，棲息於具隱蔽性之水草、枯葉或樹枝旁，種內偶有競爭驅趕。', N'2.5-3.5 cm', N'亞洲', N'高', 0, CAST(180 AS Decimal(10, 0)), CAST(110 AS Decimal(10, 0)), 45, 1, N'Indostomus_paradoxus.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (120, N'壯象鼻魚', N'Brienomyrus brachyistius', N'小海豚', N'Baby whale', N'Gill, 1862', N'象鼻魚科', N'淡水', N'體呈紡錘狀但略顯側扁，吻端圓鈍不具明顯之上下頷；眼睛比例小，個體多以特殊脈衝之電流進行定位、定向與溝通；體色多為銀白、蒼灰至灰綠。背鰭與臀鰭皆不具硬棘，軟條數分別為14-19及25-31。', N'6-14.0 cm ', N'南美洲', N'高', 1, CAST(500 AS Decimal(10, 0)), CAST(380 AS Decimal(10, 0)), 50, 1, N'Brienomyrus_brachyistius.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (121, N'藍身絲鰭鸚鯛', N'Cirrhilabrus cyanopleura', N'柳冷仔', N'Coralline wrasse', N'Bleeker, 1851', N'隆頭魚科', N'鹹水', N'體延長而側扁。成魚鱗片後緣通常為深藍色；胸鰭基部有一暗褐斜斑；雄魚胸鰭後方有一橙黃色斑；背鰭、臀鰭與尾鰭基部紅褐色，末梢淺藍色具不規則波浪狀橙褐紋；腹鰭第一與第二軟條為褐色。息於近海珊瑚礁區，是很常見的珊瑚礁魚類。日行性，活動在深度約5-20公尺處，有時成群、有時單獨的游動在岩礁上方約1-2公尺水層，頂著水流覓食小型的浮游生物。 ', N'5-15 cm   ', N'西太平洋', N'中', 1, CAST(180 AS Decimal(10, 0)), CAST(110 AS Decimal(10, 0)), 40, 1, N'Cirrhilabrus_cyanopleura.png')
INSERT [dbo].[products] ([產品編號], [產品名稱], [學名], [俗名], [英文名], [命名者], [科別], [淡鹹水], [簡介], [體長], [原產地], [飼養難度], [可混養], [產品金額], [進貨價格], [庫存量], [供貨], [圖片]) VALUES (122, N'藍綠光鰓雀鯛', N'Chromis viridis	', N'水銀燈', N'Blue-green puller', N'Cuvier, 1830', N'雀鯛科', N'海水', N'體呈橢圓形而側扁。尾鰭叉形，上下葉末端呈尖形。體及各鰭一致為淡綠色至淡藍色，腹面略白；繁殖期時，雄魚體色逐漸偏黃色，體後半部漸偏黑色。主要棲息於亞潮帶的礁區或潟湖的珊瑚礁平台，棲息深度在10-12公尺左右。群居性，經常成一大群生活於枝狀珊瑚叢中的上方盤旋，遇危險則急速躲入珊瑚枝芽間。繁殖期時，雄魚會築巢供數尾雌魚使用，並由雄魚負責警戒的工作以及利用尾鰭擺動使受精卵獲得充足的氧氣。', N'3.0-7.0 cm', N'西太平洋', N'中', 1, CAST(120 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), 320, 1, N'Chromis_viridis.png')
GO
INSERT [dbo].[punch] ([打卡編號], [員工編號], [日期], [上班時間], [下班時間]) VALUES (1, 100005, CAST(N'2024-08-08' AS Date), CAST(N'2024-08-08T10:10:43.6166667' AS DateTime2), CAST(N'2024-08-08T23:10:56.1166667' AS DateTime2))
INSERT [dbo].[punch] ([打卡編號], [員工編號], [日期], [上班時間], [下班時間]) VALUES (2, 100005, CAST(N'2024-08-13' AS Date), CAST(N'2024-08-13T00:56:54.4733333' AS DateTime2), CAST(N'2024-08-13T01:20:07.0966667' AS DateTime2))
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD  CONSTRAINT [FK_orderitems_orders] FOREIGN KEY([訂單編號])
REFERENCES [dbo].[orders] ([訂單編號])
GO
ALTER TABLE [dbo].[orderitems] CHECK CONSTRAINT [FK_orderitems_orders]
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD  CONSTRAINT [FK_orderitems_products] FOREIGN KEY([產品編號])
REFERENCES [dbo].[products] ([產品編號])
GO
ALTER TABLE [dbo].[orderitems] CHECK CONSTRAINT [FK_orderitems_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_clients] FOREIGN KEY([會員編號])
REFERENCES [dbo].[clients] ([會員編號])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_clients]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_employees] FOREIGN KEY([員工編號])
REFERENCES [dbo].[employees] ([員工編號])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_employees]
GO
ALTER TABLE [dbo].[punch]  WITH CHECK ADD  CONSTRAINT [FK_punch_employees] FOREIGN KEY([員工編號])
REFERENCES [dbo].[employees] ([員工編號])
GO
ALTER TABLE [dbo].[punch] CHECK CONSTRAINT [FK_punch_employees]
GO
USE [master]
GO
ALTER DATABASE [fish] SET  READ_WRITE 
GO
