USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 5/16/2024 3:37:09 AM ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TEST_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLSV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLSV', N'ON'
GO
ALTER DATABASE [QLSV] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLSV] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLSV]
GO
USE [QLSV]
GO
/****** Object:  Sequence [dbo].[sinhvienSeq]    Script Date: 5/16/2024 3:37:09 AM ******/
CREATE SEQUENCE [dbo].[sinhvienSeq] 
 AS [bigint]
 START WITH 1100
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[tblDiem]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiem](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [nvarchar](30) NULL,
	[masinhvien] [varchar](50) NOT NULL,
	[malophoc] [bigint] NOT NULL,
	[lanhoc] [int] NOT NULL,
	[diemthilan1] [float] NULL,
	[diemthilan2] [float] NULL,
 CONSTRAINT [PK_tblDiem_1] PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC,
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGiaoVien]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiaoVien](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[magiaovien] [int] IDENTITY(1,1) NOT NULL,
	[ho] [nvarchar](10) NULL,
	[tendem] [nvarchar](20) NULL,
	[ten] [nvarchar](10) NOT NULL,
	[gioitinh] [tinyint] NULL,
	[ngaysinh] [date] NULL,
	[dienthoai] [varchar](30) NULL,
	[email] [varchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
	[matkhau] [varchar](50) NULL,
 CONSTRAINT [PK_tblGiaoVien] PRIMARY KEY CLUSTERED 
(
	[magiaovien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLopHoc](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[malophoc] [bigint] IDENTITY(1,1) NOT NULL,
	[mamonhoc] [int] NULL,
	[magiaovien] [int] NULL,
	[daketthuc] [tinyint] NULL,
 CONSTRAINT [PK_tblLopHoc] PRIMARY KEY CLUSTERED 
(
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMonHoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonHoc](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](30) NULL,
	[mamonhoc] [int] IDENTITY(1,1) NOT NULL,
	[tenmonhoc] [nvarchar](150) NULL,
	[sotinchi] [int] NULL,
 CONSTRAINT [PK_tblMonHoc] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](30) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [nchar](10) NULL,
	[masinhvien] [varchar](50) NOT NULL,
	[ho] [nvarchar](10) NOT NULL,
	[tendem] [nvarchar](20) NULL,
	[ten] [nvarchar](10) NOT NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [tinyint] NULL,
	[quequan] [nvarchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
	[dienthoai] [varchar](30) NULL,
	[email] [nvarchar](150) NULL,
	[lopsinhhoat] [nvarchar](50) NULL,
	[matkhau] [varchar](50) NULL,
 CONSTRAINT [PK_tblSinhVien] PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[tentaikhoan] [varchar](50) NOT NULL,
	[matkhau] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[tentaikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDiem] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2]) VALUES (CAST(N'2024-05-16T00:43:44.687' AS DateTime), N'SV1101', CAST(N'2024-05-16T00:43:44.687' AS DateTime), N'admin', N'SV1101', 2, 1, NULL, NULL)
INSERT [dbo].[tblDiem] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2]) VALUES (CAST(N'2024-05-15T17:40:28.610' AS DateTime), N'admin', CAST(N'2024-05-15T17:40:28.610' AS DateTime), N'admin', N'SV1110', 2, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblGiaoVien] ON 

INSERT [dbo].[tblGiaoVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [magiaovien], [ho], [tendem], [ten], [gioitinh], [ngaysinh], [dienthoai], [email], [diachi], [matkhau]) VALUES (CAST(N'2024-04-24T15:43:05.400' AS DateTime), N'admin', CAST(N'2024-04-24T15:43:05.400' AS DateTime), N'admin', 1, N'Trần', N'Như', N'Cát', 1, CAST(N'1987-01-01' AS Date), N'01245555125255', N'nhucat@gmail.com', N'Địa chỉ của thầy như cát', N'123')
INSERT [dbo].[tblGiaoVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [magiaovien], [ho], [tendem], [ten], [gioitinh], [ngaysinh], [dienthoai], [email], [diachi], [matkhau]) VALUES (CAST(N'2024-04-24T15:43:05.400' AS DateTime), N'admin', CAST(N'2024-04-24T15:43:05.400' AS DateTime), N'admin', 2, N'Bùi', N'Văn', N'Hiếu', 1, CAST(N'1984-01-01' AS Date), N'0955448888', N'buivanhieu@gmail.com', N'Địa chỉ của thầy bùi văn hiếu', N'123')
INSERT [dbo].[tblGiaoVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [magiaovien], [ho], [tendem], [ten], [gioitinh], [ngaysinh], [dienthoai], [email], [diachi], [matkhau]) VALUES (CAST(N'2024-04-24T15:43:05.400' AS DateTime), N'admin', CAST(N'2024-04-24T15:43:05.400' AS DateTime), N'admin', 3, N'Nguyễn', N'Thị Hải', N'Yến', 0, CAST(N'1977-12-11' AS Date), N'09845545888', N'nguyenthihaiyen@gmail.com', N'Địa chỉ của cô hải yến', N'123')
INSERT [dbo].[tblGiaoVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [magiaovien], [ho], [tendem], [ten], [gioitinh], [ngaysinh], [dienthoai], [email], [diachi], [matkhau]) VALUES (CAST(N'2024-04-24T15:43:05.403' AS DateTime), N'admin', CAST(N'2024-04-24T15:43:05.403' AS DateTime), N'admin', 4, N'Đoàn', N'Thị', N'Nhi', 0, CAST(N'1987-10-20' AS Date), N'09113388777', N'quynhnhi@gmail.com', N'Địa chỉ của cô Nhi', N'123')
SET IDENTITY_INSERT [dbo].[tblGiaoVien] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLopHoc] ON 

INSERT [dbo].[tblLopHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [malophoc], [mamonhoc], [magiaovien], [daketthuc]) VALUES (CAST(N'2024-05-15T06:34:56.530' AS DateTime), N'admin', CAST(N'2024-05-15T06:34:56.530' AS DateTime), N'admin', 2, 2, 2, 0)
INSERT [dbo].[tblLopHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [malophoc], [mamonhoc], [magiaovien], [daketthuc]) VALUES (CAST(N'2024-05-15T06:34:56.530' AS DateTime), N'admin', CAST(N'2024-05-15T06:34:56.530' AS DateTime), N'admin', 3, 3, 3, 0)
INSERT [dbo].[tblLopHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [malophoc], [mamonhoc], [magiaovien], [daketthuc]) VALUES (CAST(N'2024-05-16T03:10:05.260' AS DateTime), N'admin', CAST(N'2024-05-16T03:10:05.260' AS DateTime), N'admin', 4, 8, 4, 0)
INSERT [dbo].[tblLopHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [malophoc], [mamonhoc], [magiaovien], [daketthuc]) VALUES (CAST(N'2024-05-16T03:17:33.067' AS DateTime), N'admin', CAST(N'2024-05-16T03:17:33.067' AS DateTime), N'admin', 5, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[tblLopHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMonHoc] ON 

INSERT [dbo].[tblMonHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [mamonhoc], [tenmonhoc], [sotinchi]) VALUES (CAST(N'2024-04-24T15:45:17.410' AS DateTime), N'admin', CAST(N'2024-04-24T15:45:17.410' AS DateTime), N'admin', 1, N'Tin học đại cương', 2)
INSERT [dbo].[tblMonHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [mamonhoc], [tenmonhoc], [sotinchi]) VALUES (CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', 2, N'Toán cao cấp I', 2)
INSERT [dbo].[tblMonHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [mamonhoc], [tenmonhoc], [sotinchi]) VALUES (CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', 3, N'Phân tích thiết kế CSDL', 2)
INSERT [dbo].[tblMonHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [mamonhoc], [tenmonhoc], [sotinchi]) VALUES (CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', 5, N'Thiết kế web bằng ASP.NET', 4)
INSERT [dbo].[tblMonHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [mamonhoc], [tenmonhoc], [sotinchi]) VALUES (CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', 6, N'An toàn thông tin', 3)
INSERT [dbo].[tblMonHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [mamonhoc], [tenmonhoc], [sotinchi]) VALUES (CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', 7, N'Lập trình WPF', 4)
INSERT [dbo].[tblMonHoc] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [mamonhoc], [tenmonhoc], [sotinchi]) VALUES (CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', CAST(N'2024-04-24T15:45:17.413' AS DateTime), N'admin', 8, N'Lập trình website bằng mô hình MVC', 3)
SET IDENTITY_INSERT [dbo].[tblMonHoc] OFF
GO
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-05-12T17:00:04.460' AS DateTime), N'admin', CAST(N'2024-05-12T17:00:04.460' AS DateTime), N'admin     ', N'19SV1103', N'Nguyễn', N'Thành', N'Danh', CAST(N'2002-01-01' AS Date), 0, N'Bình Ðịnh', N'Gia Lai', N'095554545521', N'thanhdanh@gmail.com', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-04-24T15:56:02.733' AS DateTime), N'admin', CAST(N'2024-04-24T15:56:02.733' AS DateTime), N'admin     ', N'SV1101', N'Dương', N'', N'Quá', CAST(N'2001-01-01' AS Date), 1, NULL, N'Cổ mộ cùng Cô cô', N'0988554887', N'quaquecungchymcut@gmail.com', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-04-24T15:56:07.943' AS DateTime), N'admin', CAST(N'2024-04-24T15:56:07.943' AS DateTime), N'admin     ', N'SV1102', N'Tiểu', N'Long', N'Nữ', CAST(N'1999-12-31' AS Date), 0, NULL, N'Đi phượt cùng Triệu Chí Kính', N'09888848484', N'cococungchikinh@gmail.com', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-04-24T15:56:11.950' AS DateTime), N'admin', CAST(N'2024-04-24T15:56:11.950' AS DateTime), N'admin     ', N'SV1103', N'Triệu', N'Chí', N'Kính', CAST(N'1995-10-10' AS Date), 1, NULL, N'Đạo trưởng đẹp troai', N'0888458487778', N'chikinhdeptroai@gmail.com', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-04-24T15:56:15.920' AS DateTime), N'admin', CAST(N'2024-04-24T15:56:15.920' AS DateTime), N'admin     ', N'SV1104', N'Chu', N'Bá', N'Thông', CAST(N'1000-01-01' AS Date), 1, NULL, N'Ngây thơ vô số tội', N'01215454888', N'chubathong@gmail.com', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-04-24T15:56:19.643' AS DateTime), N'admin', CAST(N'2024-04-24T15:56:19.643' AS DateTime), N'admin     ', N'SV1105', N'Quách', N'', N'Tĩnh', CAST(N'1990-01-31' AS Date), 1, N'Hà Nội', N'', N'', N'', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-04-24T15:56:22.740' AS DateTime), N'admin', CAST(N'2024-04-24T15:56:22.740' AS DateTime), N'admin     ', N'SV1106', N'Hoàng', N'', N'Dung', CAST(N'1999-05-25' AS Date), 0, NULL, N'Bang chủ Cái bang', N'0554878788', N'bangchucaibang@gmail.com', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-04-24T15:56:26.403' AS DateTime), N'admin', CAST(N'2024-04-24T15:56:26.403' AS DateTime), N'admin     ', N'SV1107', N'Quách', N'', N'Tương', CAST(N'2002-01-18' AS Date), 1, N'', N'', N'', N'', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-05-12T17:04:22.277' AS DateTime), N'admin', CAST(N'2024-05-12T17:04:22.277' AS DateTime), N'admin     ', N'SV1110', N'Nguyễn', N'Thành', N'Danh', CAST(N'2002-12-12' AS Date), 1, N'Bình Ðịnh', N'Gia Lai', N'095554545521', N'thanhdanh@gmail.com', NULL, N'123')
INSERT [dbo].[tblSinhVien] ([ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat], [masinhvien], [ho], [tendem], [ten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [lopsinhhoat], [matkhau]) VALUES (CAST(N'2024-05-13T03:06:28.987' AS DateTime), N'admin', CAST(N'2024-05-13T03:06:28.987' AS DateTime), N'admin     ', N'SV1111', N'Napoleon', N'', N'Bonaparte', CAST(N'1769-08-15' AS Date), 1, N'', N'', N'', N'', NULL, N'123')
GO
INSERT [dbo].[tblTaiKhoan] ([tentaikhoan], [matkhau]) VALUES (N'admin', N'admin')
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  DEFAULT ('123') FOR [matkhau]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_daketthuc]  DEFAULT ((0)) FOR [daketthuc]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  DEFAULT ('123') FOR [matkhau]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblLopHoc] FOREIGN KEY([malophoc])
REFERENCES [dbo].[tblLopHoc] ([malophoc])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblLopHoc]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblSinhVien] FOREIGN KEY([masinhvien])
REFERENCES [dbo].[tblSinhVien] ([masinhvien])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblSinhVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_tblGiaoVien] FOREIGN KEY([magiaovien])
REFERENCES [dbo].[tblGiaoVien] ([magiaovien])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_tblGiaoVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_tblMonHoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[tblMonHoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_tblMonHoc]
GO
/****** Object:  StoredProcedure [dbo].[allLopHoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[allLopHoc]
	@tukhoa nvarchar(50)
as
begin
	set @tukhoa = lower(@tukhoa); -- lowercase <-> viết thường
	select 
		l.malophoc,
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		case 
			when len(g.tendem) > 0 then concat(g.ho,' ',g.tendem,' ',g.ten)
			else concat(g.ho,' ',g.ten) end as gvien 
		
	from tblLopHoc l
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	where  m.tenmonhoc like '%'+@tukhoa+'%' -- tìm kiếm tương đối có chứa từ khóa
	or lower(concat(g.ho,' ',g.tendem,' ',g.ten)) like '%'+@tukhoa+'%' -- tìm kiếm tương đối có chứa từ khóa
	or lower(concat(g.ho,' ',g.tendem,' ',g.ten)) like '%'+@tukhoa+'%'; -- tìm kiếm tương đối có chứa từ khóa
end
GO
/****** Object:  StoredProcedure [dbo].[dangnhap]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[dangnhap]
	@loaitaikhoan varchar(10),
	@taikhoan varchar(50),
	@matkhau varchar(50)
as
begin
	if @loaitaikhoan = 'admin' 
			select *	
			from tblTaiKhoan 
			where tentaikhoan = @taikhoan
			and matkhau = @matkhau
		else if @loaitaikhoan = 'gv'
			select *	
			from tblGiaoVien
			where CONVERT(varchar(50), magiaovien) = @taikhoan
			and matkhau = @matkhau
		else
			select *
			from tblSinhVien
			where masinhvien = @taikhoan
			and matkhau = @matkhau
end
GO
/****** Object:  StoredProcedure [dbo].[deleteGV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteGV]
	@magiaovien int
as
begin
	begin try
		delete from tblDiem where malophoc in (select malophoc from tblLopHoc where magiaovien=@magiaovien)
		delete from tblLopHoc where magiaovien = @magiaovien;
		delete from tblGiaoVien where magiaovien=@magiaovien;
		return 1;
	end try
	begin catch
		return 0;
	end catch

end
GO
/****** Object:  StoredProcedure [dbo].[deleteLH]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteLH] 
	@malophoc int
as
begin
	begin try
		delete from tblDiem where malophoc=@malophoc
		delete from tblLopHoc where malophoc=@malophoc;
		return 1;
	end try
	begin catch
		return 0;
	end catch

end
GO
/****** Object:  StoredProcedure [dbo].[deleteMH]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteMH]
	@mamonhoc int
as
begin
	begin try
		delete from tblDiem where malophoc in (select malophoc from tblLopHoc where mamonhoc=@mamonhoc)
		delete from tblMonHoc where mamonhoc=@mamonhoc;
		delete from tblLopHoc where malophoc=@mamonhoc;
		return 1;
	end try
	begin catch
		return 0;
	end catch

end
GO
/****** Object:  StoredProcedure [dbo].[deleteSV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteSV]
	@masinhvien varchar(50)
as
begin
	begin try
		delete from tblDiem where masinhvien=@masinhvien;
		delete from tblSinhVien where masinhvien=@masinhvien;
		return 1;
	end try
	begin catch
		return 0;
	end catch

end
GO
/****** Object:  StoredProcedure [dbo].[dkyhoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create proc [dbo].[dkyhoc]
		@masinhvien varchar(50),
		@malophoc bigint
	as
	begin
		--vì bảng điểm(tblDiem) chỉ có cột mã lớp học (khóa ngoại) liên kết tới bảng  lớp học(tblLopHoc) <-> không có thông tin môn học
		--> từ mã lớp cần tìm ra được mã môn học ( nằm trong tblLopHoc) dựa vào inner join --> khai báo 1 biến để lấy thông tin môn học, cụ thể là mã môn học
		--vì số lần học được tính tự động -> cần khai báo 1 biến để đếm số lần học trước đó
		declare @v_lanhoc int,
				@v_mamonhoc int,
				@v_dadangky int;
		-- lấy mã môn học dựa vào mã lớp
		select @v_mamonhoc = mamonhoc
		from tblLopHoc
		where malophoc = @malophoc;

		-- từ mã môn học + mã sinh viên => tính được số lần học trước đó
		select @v_lanhoc = count(*)
		from tblDiem d
		inner join tblLopHoc l on d.malophoc = l.malophoc
		where l.daketthuc = 1 --> chỉ tính số lần học từ các lớp có trạng thái đã kết thúc
		and d.masinhvien = @masinhvien
		and l.mamonhoc = @v_mamonhoc;

		-- kiểm tra xem sinh viên này hiện có đăng ký lớp khác học cùng 1 môn hay không
		select @v_dadangky = count(*)
		from tblDiem d
		inner join tblLopHoc l on d.malophoc = l.malophoc
		where l.daketthuc = 0 --> lớp đang mở
		and l.mamonhoc = @v_mamonhoc --> môn học này đã đăng ký
		and d.masinhvien = @masinhvien; --> sinh viên xác định

		--> nếu kết quả trả về v_dadangky > 0 --> có nghĩa hiện tại sinh viên này đã đăng ký 1 lớp học cùng môn học này rồi
		if @v_dadangky>0 return -1;

		--lần học mới sẽ bằng số lần học trước đó + 1
		set @v_lanhoc = @v_lanhoc + 1;

		--> hơi rối chút, các bạn chịu khó đọc kỹ nhé. Đoạn nào chưa hiểu cứ dừng(hoặc tua) video lại mà ngâm

		--> insert dữ liệu vào bảng điểm <-> đăng ký môn học
		insert into tblDiem(nguoitao,masinhvien,malophoc,lanhoc)
		values(@masinhvien,@masinhvien,@malophoc,@v_lanhoc);--sinh viên đăng ký -> người tạo = mã sinh viên

		--kiểm tra thực thi câu lệnh sql
		if @@ROWCOUNT > 0 return 1 else return 0;
	end
GO
/****** Object:  StoredProcedure [dbo].[dsLopChuaDKy]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[dsLopChuaDKy]
	@masinhvien varchar(50)
as
begin
	select
		l.malophoc,
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		case when len(g.tendem)>0 then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat(g.ho,' ',g.ten) end as gvien
	from tblLopHoc l
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	where l.daketthuc = 0 -- lấy các lớp đang mở
	and l.malophoc not in ( select malophoc from tblDiem where masinhvien = @masinhvien);
end


GO
/****** Object:  StoredProcedure [dbo].[InsertGV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertGV]
	@nguoitao varchar(30),
	@ho nvarchar(10),
	@tendem nvarchar(20), 
	@ten nvarchar(10),
	@gioitinh tinyint,
	@ngaysinh date,
	@email varchar(150),
	@dienthoai varchar(30),
	@diachi nvarchar(150)
as
begin
	insert into tblGiaoVien(nguoitao,ho,tendem,ten,gioitinh,ngaysinh,email,dienthoai,diachi)
	values(@nguoitao,@ho,@tendem,@ten,@gioitinh,@ngaysinh,@email,@dienthoai,@diachi);
	if @@ROWCOUNT > 0 return 1 else return 0 ;
end;
GO
/****** Object:  StoredProcedure [dbo].[insertlophoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertlophoc]
	@nguoitao varchar(30),
	@magiaovien int,
	@mamonhoc int
as
begin
	insert into tblLopHoc(nguoitao,mamonhoc,magiaovien)
	values(@nguoitao,@mamonhoc,@magiaovien);
	if @@ROWCOUNT > 0 return 1 else return 0;
end
GO
/****** Object:  StoredProcedure [dbo].[insertMH]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[insertMH]
	@nguoitao varchar(30),
	@tenmonhoc nvarchar(150),
	@sotinchi int
as
begin
	insert into tblMonHoc(nguoitao,tenmonhoc,sotinchi)
	values(@nguoitao,@tenmonhoc,@sotinchi);
	if @@ROWCOUNT > 0 return 1 else return 0;
end
GO
/****** Object:  StoredProcedure [dbo].[monDaDKy]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[monDaDKy]
	@masinhvien varchar(30)
as
begin
	select
		l.malophoc,
		m.tenmonhoc,
		m.sotinchi,
		case when len(trim(g.tendem)) > 0 then concat(g.ho, ' ', g.tendem, ' ', g.ten)
		else concat(g.ho, ' ', g.ten) end as gvien
	from tblDiem d
	inner join tblLopHoc l on d.malophoc = l.malophoc
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	where d.masinhvien = @masinhvien
	and l.daketthuc = 0;
end
GO
/****** Object:  StoredProcedure [dbo].[selecmh]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selecmh]
	@mamh int
as
begin
	select 
		tenmonhoc,
		sotinchi
	from tblMonHoc
	where mamonhoc = @mamh;
end
GO
/****** Object:  StoredProcedure [dbo].[selectAllGV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[selectAllGV]
	@tukhoa nvarchar(50)
as
begin
	set @tukhoa = lower(ltrim(rtrim(@tukhoa)));
	select 
		magiaovien,
		case when len(ltrim(rtrim(tendem))) > 0 then concat(ltrim(rtrim(ho)),' ',ltrim(rtrim(tendem)), ' ', ltrim(rtrim(ten)))
		else  concat(ltrim(rtrim(ho)),' ', ltrim(rtrim(ten))) end as hoten,
		convert(varchar(10),ngaysinh,103) as ngaysinh,
		case when gioitinh = 1 then 'Nam' else N'Nữ' end as gt,
		dienthoai,
		email,
		diachi
	from tblGiaoVien
	where lower(ho) like '%'+@tukhoa+'%'
	or lower(tendem) like '%'+@tukhoa+'%'
	or lower(ten) like '%'+@tukhoa+'%'
	or lower(ho) like '%'+@tukhoa+'%'
	or lower(email) like '%'+@tukhoa+'%'
	or lower(dienthoai) like '%'+@tukhoa+'%'
	or lower(magiaovien) like '%'+@tukhoa+'%'
	order by ten;
end
GO
/****** Object:  StoredProcedure [dbo].[selectAllMonHoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectAllMonHoc]
	@tukhoa nvarchar(50)
as
begin
	set @tukhoa = lower(ltrim(rtrim(@tukhoa)));
	select 
		mamonhoc,
		tenmonhoc,
		sotinchi
	from tblMonHoc
	where mamonhoc like '%'+@tukhoa+'%'
	or lower(tenmonhoc) like '%'+@tukhoa+'%'
	order by tenmonhoc;	
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAllSinhVien]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectAllSinhVien]
    @tukhoa nvarchar(50) --tìm kiếm sinh viên dựa vào từ khóa
	--1: tìm theo mã sinh viên
	--2: tìm theo họ, tên đệm, tên sinh viên
	--3: tìm theo số điện thoại
	--loại tìm kiếm: tương đối
as
select
    masinhvien, 
    case 
	  when LEN(tendem) > 0 then
	       CONCAT(ho, ' ', tendem, ' ', ten)
	  else concat(ho, ' ', ten)
	 end as hoten,
	 CONVERT(varchar(10), ngaysinh, 103) as ngaysinh,
	 case
	   when gioitinh=1 then 'Nam'
	   else N'Nữ'
	 end as gioitinh,
	 quequan,
	 diachi, dienthoai, email
from tblSinhVien
where
  lower(ho) like '%'+lower(trim(@tukhoa)) + '%'
  or lower(tendem) like '%'+lower(trim(@tukhoa)) + '%'
  or lower(ten) like '%'+lower(trim(@tukhoa)) + '%'
  or dienthoai like '%'+lower(trim(@tukhoa)) + '%'
  or email like '%'+lower(trim(@tukhoa)) + '%'
order by ten;
GO
/****** Object:  StoredProcedure [dbo].[selectGV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectGV]
	@mgv int
as
begin
	select
		ho,tendem,ten,
		gioitinh,convert(varchar(10),ngaysinh,103) as ngsinh,
		dienthoai,email,diachi
	from tblGiaoVien
	where magiaovien = @mgv;
end
GO
/****** Object:  StoredProcedure [dbo].[selectLopHoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectLopHoc]
	@malophoc bigint
as
begin
	select
		m.tenmonhoc,
		g.magiaovien,
		l.mamonhoc
	from tblLopHoc l
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	where malophoc = @malophoc;
end
--drop proc selectlophoc
GO
/****** Object:  StoredProcedure [dbo].[selectSV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectSV]
  @masinhvien varchar(50)
AS
BEGIN
     SELECT 
     ho, tendem, ten, convert(varchar(10), ngaysinh, 103) as ngsinh,
	 case
	   when gioitinh=1 then 'Nam' else N'Nữ'
	 end as gtinh,
	 quequan, diachi, dienthoai, email
	 FROM tblSinhVien
	 WHERE masinhvien=@masinhvien;
END
GO
/****** Object:  StoredProcedure [dbo].[ThemMoiSV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemMoiSV]
  --khai báo danh sách tham số truyền vào
  @Ho nvarchar(10),
  @TenDem nvarchar(20),
  @Ten nvarchar(10),
  @Ngaysinh date,
  @Gioitinh tinyint,
  @Quequan nvarchar(150),
  @DiaChi nvarchar(150),
  @Dienthoai varchar(30),
  @Email varchar(150)
  --kết thúc khai báo tham số truyền vào
AS
BEGIN
  --thêm dữ liệu mới
  INSERT INTO tblSinhVien
  (
    masinhvien,
	ho, tendem, ten,
	ngaysinh, gioitinh,
	quequan, diachi,
	dienthoai, email
	)VALUES( 
	'SV' + CAST(NEXT VALUE FOR sinhvienSeq as varchar(30)),
	@Ho, @TenDem, @Ten,
	@Ngaysinh, 
	@Gioitinh,
	@Quequan, @Diachi,
	@Dienthoai, @Email
  ); -- kết thúc thêm mới dữ liệu
  -- kiểm tra xem đã insert thành công hay chưa
  IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
  ELSE BEGIN RETURN 0 END;
END
GO
/****** Object:  StoredProcedure [dbo].[updateGV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateGV]
	@magiaovien int,
	@nguoicapnhat varchar(30),
	@ho nvarchar(10),
	@tendem nvarchar(20), 
	@ten nvarchar(10),
	@gioitinh tinyint,
	@ngaysinh date,
	@email varchar(150),
	@dienthoai varchar(30),
	@diachi nvarchar(150)
as
begin
	update tblGiaoVien
	set nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = getdate(),
		ho = @ho,tendem = @tendem, ten = @ten,
		gioitinh = @gioitinh, ngaysinh = @ngaysinh, email = @email, dienthoai = @dienthoai, diachi = @diachi
	where magiaovien = @magiaovien;
	if @@ROWCOUNT > 0 return 1 else return 0;
end;
GO
/****** Object:  StoredProcedure [dbo].[updatelophoc]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatelophoc]
	@nguoicapnhat varchar(30),
	@malophoc bigint,
	@magiaovien int,
	@mamonhoc int
as
begin
	update tblLopHoc
	set
		ngaycapnhat = getdate(),
		nguoicapnhat = @nguoicapnhat,		
		magiaovien = @magiaovien
	where malophoc = @malophoc;
	if @@ROWCOUNT > 0 return 1 else return 0;
end
--select * from tblLopHoc
-- drop proc updatelophoc
GO
/****** Object:  StoredProcedure [dbo].[updateMH]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateMH]
	@nguoicapnhat varchar(30),
	@mamonhoc bigint,
	@tenmonhoc nvarchar(150),
	@sotinchi int
as
begin
	update tblMonHoc
	set
		nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = getdate(),
		tenmonhoc = @tenmonhoc,
		sotinchi = @sotinchi
	where mamonhoc = @mamonhoc;
	if @@ROWCOUNT > 0 return 1 else return 0;
	
end
GO
/****** Object:  StoredProcedure [dbo].[updateSV]    Script Date: 5/16/2024 3:37:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateSV]
   @masinhvien varchar(50),
   @ho nvarchar(10),
   @tendem nvarchar(20),
   @ten nvarchar(10),
   @ngaysinh date,
   @gioitinh tinyint,
   @quequan nvarchar(150),
   @diachi nvarchar(150),
   @dienthoai varchar(30),
   @email varchar(150)
AS
BEGIN
   UPDATE tblSinhVien
   SET
     ho=@ho,
	 tendem=@tendem,
	 ten=@ten,
	 ngaysinh=@ngaysinh,
	 gioitinh=@gioitinh,
	 quequan=@quequan,
	 diachi=@diachi,
	 dienthoai=@dienthoai,
	 email=@email
	WHERE masinhvien=@masinhvien;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO
