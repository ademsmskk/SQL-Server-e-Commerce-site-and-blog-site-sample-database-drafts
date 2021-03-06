USE [master]
GO
/****** Object:  Database [BlogSitesi]    Script Date: 31.01.2022 19:19:40 ******/
CREATE DATABASE [BlogSitesi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogSitesi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlogSitesi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlogSitesi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlogSitesi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlogSitesi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogSitesi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogSitesi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogSitesi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogSitesi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogSitesi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogSitesi] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogSitesi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogSitesi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogSitesi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogSitesi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogSitesi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogSitesi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogSitesi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogSitesi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogSitesi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogSitesi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogSitesi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogSitesi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogSitesi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogSitesi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogSitesi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogSitesi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogSitesi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogSitesi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlogSitesi] SET  MULTI_USER 
GO
ALTER DATABASE [BlogSitesi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogSitesi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogSitesi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogSitesi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlogSitesi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlogSitesi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BlogSitesi] SET QUERY_STORE = OFF
GO
USE [BlogSitesi]
GO
/****** Object:  Table [dbo].[Etiket]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiket](
	[EtiketId] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Etiket] PRIMARY KEY CLUSTERED 
(
	[EtiketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Parola] [nvarchar](200) NOT NULL,
	[MailAdres] [nvarchar](50) NOT NULL,
	[Cinsiyet] [bit] NULL,
	[DogumTarihi] [datetime] NULL,
	[KayıtTarihi] [datetime] NOT NULL,
	[Yazar] [bit] NULL,
	[Aktif] [bit] NULL,
	[ResimID] [int] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciRol]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciRol](
	[KullaniciRolId] [int] IDENTITY(1,1) NOT NULL,
	[RolID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_KullaniciRol] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC,
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makale]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makale](
	[MakaleId] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](100) NOT NULL,
	[İcerik] [nvarchar](max) NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[KategoriID] [int] NOT NULL,
	[GörüntülenmeSayisi] [int] NOT NULL,
	[Begeni] [int] NOT NULL,
	[YazarID] [int] NOT NULL,
	[ResimID] [int] NULL,
 CONSTRAINT [PK_Makale] PRIMARY KEY CLUSTERED 
(
	[MakaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MakaleEtiket]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakaleEtiket](
	[MakaleID] [int] NOT NULL,
	[EtiketID] [int] NOT NULL,
 CONSTRAINT [PK_MakaleEtiket] PRIMARY KEY CLUSTERED 
(
	[MakaleID] ASC,
	[EtiketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resim]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resim](
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
	[KucukBoyut] [nvarchar](250) NULL,
	[OrtaBoyut] [nvarchar](250) NULL,
	[BuyukBoyut] [nvarchar](250) NULL,
	[Video] [nvarchar](250) NULL,
	[MakaleID] [int] NULL,
 CONSTRAINT [PK_Resim] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[RolAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YazarTakip]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YazarTakip](
	[YazarID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_YazarTakip] PRIMARY KEY CLUSTERED 
(
	[YazarID] ASC,
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 31.01.2022 19:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[YorumId] [int] IDENTITY(1,1) NOT NULL,
	[Yorum] [nvarchar](2000) NOT NULL,
	[MakaleID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[AdSoyad] [nvarchar](150) NOT NULL,
	[Begeni] [int] NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[YorumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Etiket] ON 

INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (1, N'C#')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (2, N'ASP.NET')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (3, N'MSSQL')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (4, N'MVC')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (5, N'AJAX')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (6, N'WPF')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (7, N'HTML')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (8, N'CSS')
INSERT [dbo].[Etiket] ([EtiketId], [Adi]) VALUES (9, N'JQUERY')
SET IDENTITY_INSERT [dbo].[Etiket] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([KategoriId], [Adi], [Aciklama]) VALUES (1, N'C#', NULL)
INSERT [dbo].[Kategori] ([KategoriId], [Adi], [Aciklama]) VALUES (2, N'ADO.NET', NULL)
INSERT [dbo].[Kategori] ([KategoriId], [Adi], [Aciklama]) VALUES (3, N'OOP', NULL)
INSERT [dbo].[Kategori] ([KategoriId], [Adi], [Aciklama]) VALUES (4, N'MSSQL', NULL)
INSERT [dbo].[Kategori] ([KategoriId], [Adi], [Aciklama]) VALUES (5, N'ASP.NET', NULL)
INSERT [dbo].[Kategori] ([KategoriId], [Adi], [Aciklama]) VALUES (6, N'MVC', NULL)
INSERT [dbo].[Kategori] ([KategoriId], [Adi], [Aciklama]) VALUES (7, N'WPF', NULL)
SET IDENTITY_INSERT [dbo].[Kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciId], [Adi], [Soyadi], [KullaniciAdi], [Parola], [MailAdres], [Cinsiyet], [DogumTarihi], [KayıtTarihi], [Yazar], [Aktif], [ResimID]) VALUES (1, N'Adem', N'şimşek', N'adem', N'123456', N'adem@gmail.com', 1, CAST(N'1999-12-12T00:00:00.000' AS DateTime), CAST(N'2022-01-26T20:22:37.200' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Makale] ON 

INSERT [dbo].[Makale] ([MakaleId], [Baslik], [İcerik], [EklenmeTarihi], [KategoriID], [GörüntülenmeSayisi], [Begeni], [YazarID], [ResimID]) VALUES (1, N'Mvc ile blog sayfası', N'What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.

Where can I get some?
There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', CAST(N'2022-01-23T18:02:12.890' AS DateTime), 6, 0, 0, 1, 2)
SET IDENTITY_INSERT [dbo].[Makale] OFF
GO
SET IDENTITY_INSERT [dbo].[Resim] ON 

INSERT [dbo].[Resim] ([ResimId], [KucukBoyut], [OrtaBoyut], [BuyukBoyut], [Video], [MakaleID]) VALUES (1, NULL, N'/Content/yazarresim/jpeg.png', NULL, NULL, NULL)
INSERT [dbo].[Resim] ([ResimId], [KucukBoyut], [OrtaBoyut], [BuyukBoyut], [Video], [MakaleID]) VALUES (2, N'/Content/MakaleResim/KucukBoyut/mvc.png', N'/Content/MakaleResim/OrtaBoyut/mvc2.png', N'/Content/MakaleResim/BuyukBoyut/mvcbuyuk.png', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resim] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([RolId], [RolAdi]) VALUES (1, N'Üye')
INSERT [dbo].[Rol] ([RolId], [RolAdi]) VALUES (2, N'Yazar')
INSERT [dbo].[Rol] ([RolId], [RolAdi]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
ALTER TABLE [dbo].[Kullanici] ADD  CONSTRAINT [DF_Kullanici_KayıtTarihi]  DEFAULT (getdate()) FOR [KayıtTarihi]
GO
ALTER TABLE [dbo].[Makale] ADD  CONSTRAINT [DF_Makale_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [dbo].[Makale] ADD  CONSTRAINT [DF_Makale_GörüntülenmeSayisi]  DEFAULT ((0)) FOR [GörüntülenmeSayisi]
GO
ALTER TABLE [dbo].[Makale] ADD  CONSTRAINT [DF_Makale_Begeni]  DEFAULT ((0)) FOR [Begeni]
GO
ALTER TABLE [dbo].[Yorum] ADD  CONSTRAINT [DF_Yorum_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [dbo].[Yorum] ADD  CONSTRAINT [DF_Yorum_Begeni]  DEFAULT ((0)) FOR [Begeni]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([ResimId])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Resim]
GO
ALTER TABLE [dbo].[KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciRol_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[KullaniciRol] CHECK CONSTRAINT [FK_KullaniciRol_Kullanici]
GO
ALTER TABLE [dbo].[KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciRol_Rol] FOREIGN KEY([RolID])
REFERENCES [dbo].[Rol] ([RolId])
GO
ALTER TABLE [dbo].[KullaniciRol] CHECK CONSTRAINT [FK_KullaniciRol_Rol]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([KategoriId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kategori]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kullanici] FOREIGN KEY([YazarID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kullanici]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Resim] FOREIGN KEY([ResimID])
REFERENCES [dbo].[Resim] ([ResimId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Resim]
GO
ALTER TABLE [dbo].[MakaleEtiket]  WITH CHECK ADD  CONSTRAINT [FK_MakaleEtiket_Etiket] FOREIGN KEY([EtiketID])
REFERENCES [dbo].[Etiket] ([EtiketId])
GO
ALTER TABLE [dbo].[MakaleEtiket] CHECK CONSTRAINT [FK_MakaleEtiket_Etiket]
GO
ALTER TABLE [dbo].[MakaleEtiket]  WITH CHECK ADD  CONSTRAINT [FK_MakaleEtiket_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleId])
GO
ALTER TABLE [dbo].[MakaleEtiket] CHECK CONSTRAINT [FK_MakaleEtiket_Makale]
GO
ALTER TABLE [dbo].[Resim]  WITH CHECK ADD  CONSTRAINT [FK_Resim_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleId])
GO
ALTER TABLE [dbo].[Resim] CHECK CONSTRAINT [FK_Resim_Makale]
GO
ALTER TABLE [dbo].[YazarTakip]  WITH CHECK ADD  CONSTRAINT [FK_YazarTakip_Kullanici1] FOREIGN KEY([YazarID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[YazarTakip] CHECK CONSTRAINT [FK_YazarTakip_Kullanici1]
GO
ALTER TABLE [dbo].[YazarTakip]  WITH CHECK ADD  CONSTRAINT [FK_YazarTakip_Kullanici2] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[YazarTakip] CHECK CONSTRAINT [FK_YazarTakip_Kullanici2]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleId])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Makale]
GO
USE [master]
GO
ALTER DATABASE [BlogSitesi] SET  READ_WRITE 
GO
