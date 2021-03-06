USE [master]
GO
/****** Object:  Database [ImageDictionary]    Script Date: 17/02/2020 5:50:12 CH ******/
CREATE DATABASE [ImageDictionary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ImageDictionary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ImageDictionary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ImageDictionary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ImageDictionary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ImageDictionary] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ImageDictionary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ImageDictionary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ImageDictionary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ImageDictionary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ImageDictionary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ImageDictionary] SET ARITHABORT OFF 
GO
ALTER DATABASE [ImageDictionary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ImageDictionary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ImageDictionary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ImageDictionary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ImageDictionary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ImageDictionary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ImageDictionary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ImageDictionary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ImageDictionary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ImageDictionary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ImageDictionary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ImageDictionary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ImageDictionary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ImageDictionary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ImageDictionary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ImageDictionary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ImageDictionary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ImageDictionary] SET RECOVERY FULL 
GO
ALTER DATABASE [ImageDictionary] SET  MULTI_USER 
GO
ALTER DATABASE [ImageDictionary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ImageDictionary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ImageDictionary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ImageDictionary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ImageDictionary] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ImageDictionary', N'ON'
GO
ALTER DATABASE [ImageDictionary] SET QUERY_STORE = OFF
GO
USE [ImageDictionary]
GO
/****** Object:  Table [dbo].[Meaning]    Script Date: 17/02/2020 5:50:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meaning](
	[tId] [bigint] NOT NULL,
	[wId] [bigint] NOT NULL,
	[mText] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 17/02/2020 5:50:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[tId] [bigint] IDENTITY(1,1) NOT NULL,
	[tText] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[tId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Word]    Script Date: 17/02/2020 5:50:12 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Word](
	[wId] [bigint] IDENTITY(1,1) NOT NULL,
	[wText] [nvarchar](100) NOT NULL,
	[wImage] [nvarchar](100) NOT NULL,
	[wVoice] [nvarchar](250) NOT NULL,
	[wPronounce] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Word] PRIMARY KEY CLUSTERED 
(
	[wId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 1, N'Tê Giác')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 2, N'Mèo')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 3, N'Bò')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 11, N'Con Gà')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 5, N'Con Voi')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 6, N'Sư Tử')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 8, N'Chuột')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 10, N'Rắn')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 33, N'Con Khỉ')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 34, N'Con Heo')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 39, N'Hoa tulip')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 41, N'Con Cua')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 42, N'Con Cá Sấu')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 43, N'Con Thỏ')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 44, N'Cá Mập')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 46, N'Con Vẹt')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 47, N'Con Hà Mã')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 48, N'Gấu Trúc')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 49, N'Hươu Cao Cỗ')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 50, N'Tê Giác')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 51, N'Con Nhím')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 53, N'Chim Ưng')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 55, N'Con Gấu')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 56, N'Con Vịt')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 57, N'Con Sóc')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 58, N'Trái Cam')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 59, N'Cà Chua')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 60, N'Tắc kè')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 61, N'Đà Điểu')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 7, N'Cá Heo')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 9, N'Con Rùa')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 12, N'Trái Mận')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 13, N'Trái Chuối')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 14, N'Nhện')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 15, N'Trái Chanh')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 16, N'Trái Việt Quất')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 17, N'Trái Khóm')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 18, N'Trái Dưa Hấu')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 19, N'Trái Xoài')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 20, N'Trái Bưởi')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 21, N'Trái Nho')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 22, N'Hoa Oải Hương')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 23, N'Hoa Nhài')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 24, N'Con Dơi')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 25, N'Con Bướm')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 26, N'Hoa Trà')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 27, N'Hoa Mộc Lan')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 28, N'Hoa Sen')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 29, N'Hoa Phong Lan')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 30, N'Hoa Hướng Dương')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 32, N'Hoa Cẩm Tú Cầu')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 52, N'Cánh Cụt')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 38, N'Con Ngựa')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 40, N'Biển')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 45, N'Trái Dừa')
INSERT [dbo].[Meaning] ([tId], [wId], [mText]) VALUES (3, 54, N'Ve Sầu')
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([tId], [tText]) VALUES (1, N'conjunction')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (2, N'interjection')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (3, N'noun')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (4, N'participle')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (5, N'phrase')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (6, N'preposition')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (7, N'pronoun')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (8, N'verb')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (9, N'verb - intransitive verb')
INSERT [dbo].[Type] ([tId], [tText]) VALUES (10, N'verb - transitive verb')
SET IDENTITY_INSERT [dbo].[Type] OFF
SET IDENTITY_INSERT [dbo].[Word] ON 

INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (1, N'Rhino', N'rhino.jpg', N'rhino.mp3', N'''rainou')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (2, N'Cat', N'cat.jpg', N'cat.mp3', N'kat')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (3, N'Cow', N'cow.jpg', N'cow.mp3', N'kou')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (5, N'Elephant', N'elephant.jpg', N'elephant.mp3', N'ˈeləfənt ')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (6, N'Lion', N'lion.jpg', N'lion.mp3', N'ˈlīən')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (7, N'Dolphin', N'dolphin.jpg', N'dolphin.mp3', N'''dɔlfin')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (8, N'Mouse', N'mouse.jpg', N'mouse.mp3', N'mauz')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (9, N'Turtle', N'turtle.jpg', N'turtle.mp3', N'ˈtərtl')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (10, N'Snake', N'snake.jpg', N'snake.mp3', N'snāk')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (11, N'Chicken', N'chicken.jpg', N'chicken.mp3', N'ˈchikən')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (12, N'Plum', N'plum.jpg', N'plum.mp3', N'pləm')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (13, N'Banana', N'banana.jpg', N'banana.mp3', N'bəˈnanə')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (14, N'Spider', N'spider.jpg', N'spider.mp3', N'ˈspīdər')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (15, N'Lemon', N'lemon.jpg', N'lemon.mp3', N'ˈlemən')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (16, N'Blueberry', N'blueberry.jpg', N'blueberry.mp3', N'ˈblo͞oˌberē')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (17, N'Pineapple', N'pineapple.jpg', N'pineapple.mp3', N'ˈpīˌnapəl')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (18, N'Watermelon', N'watermelon.jpg', N'watermelon.mp3', N'ˈwä-,ˈwôtərˌmelən')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (19, N'Mango', N'mango.jpg', N'mango.mp3', N'ˈmaNGgō')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (20, N'Grapefruit', N'grapefruit.jpg', N'grapefruit.mp3', N'ˈgrāpˌfro͞ot')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (21, N'Grape', N'grape.jpg', N'grape.mp3', N'grāp')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (22, N'Lavender', N'lavender.jpg', N'lavender.mp3', N'ˈlavəndər')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (23, N'Jasmine', N'jasmine.jpg', N'jasmine.mp3', N'ˈjazmən')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (24, N'Bat', N'bat.jpg', N'bat.mp3', N'bat')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (25, N'Butterfly', N'butterfly.jpg', N'butterfly.mp3', N'ˈbətərˌflī')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (26, N'Camellia', N'camellia.jpg', N'camellia.mp3', N'kəˈmēlyə')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (27, N'Magnolia', N'magnolia.jpg', N'magnolia.mp3', N'magˈnōlyə')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (28, N'Lotus', N'lotus.jpg', N'lotus.mp3', N'ˈlōtəs')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (29, N'Orchid', N'orchid.jpg', N'orchid.mp3', N'ˈôrkid')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (30, N'Sunflower', N'sunflower.jpg', N'sunflower.mp3', N'ˈsənˌflou(-ə)r')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (32, N'Hydrangea', N'hydrangea.jpg', N'hydrangea.mp3', N'hīˈdrānjə')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (33, N'Monkey', N'monkey.jpg', N'monkey.mp3', N'''mʌɳki')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (34, N'Pig', N'pig.jpg', N'pig.mp3', N'pig')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (38, N'Horse', N'horse.jpg', N'horse.mp3', N'hôrs')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (39, N'Tulips', N'tulips.jpg', N'tulips.mp3', N'''tju:lip')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (40, N'Sea', N'sea.jpg', N'sea.mp3', N'si:')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (41, N'Crab', N'crab.jpg', N'crab.mp3', N'kræb')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (42, N'Crocodile', N'crocodile.jpg', N'crocodile.mp3', N'ˈkräkəˌdīl')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (43, N'Rabbit', N'rabbit.jpg', N'rabbit.mp3', N'ˈrabit')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (44, N'Shark', N'shark.jpg', N'shark.mp3', N'SHärk')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (45, N'Coconut', N'coconut.jpg', N'coconut.mp3', N'ˈkōkəˌnət')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (46, N'Parrot', N'parrot.jpg', N'parrot.mp3', N'ˈparət')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (47, N'Hippo', N'hippo.jpg', N'hippo.mp3', N'''hipo')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (48, N'Panda', N'panda.jpg', N'panda.mp3', N'''pændə')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (49, N'Giraffe', N'giraffe.jpg', N'giraffe.mp3', N'dʤi''rɑ:f')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (50, N'Rhinoceros', N'rhinoceros.jpg', N'rhinoceros.mp3', N'rīˈnäs(ə)rəs')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (51, N'Hedgehog', N'hedgehog.jpg', N'hedgehog.mp3', N'''hedʤhɔg')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (52, N'Penguin', N'penguin.jpg', N'penguin.mp3', N'ˈpeNGgwin,ˈpengwin')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (53, N'Eagle', N'eagle.jpg', N'eagle.mp3', N'''i:gl')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (54, N'Cicada', N'cicada.jpg', N'cicada.mp3', N'səˈkädə,səˈkādə')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (55, N'Bear', N'bear.jpg', N'bear.mp3', N'be(ə)r')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (56, N'Duck', N'duck.jpg', N'duck.mp3', N'dək')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (57, N'Squirrel', N'squirrel.jpg', N'squirrel.mp3', N'ˈskwər(ə)l')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (58, N'Orange', N'orange.jpg', N'orange.mp3', N'ˈär-,ˈôrənj')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (59, N'Tomato', N'tomato.jpg', N'tomato.mp3', N'-ˈmätō,təˈmātō')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (60, N'Gecko', N'gecko.jpg', N'gecko.mp3', N'ˈgekō')
INSERT [dbo].[Word] ([wId], [wText], [wImage], [wVoice], [wPronounce]) VALUES (61, N'Ostrich', N'ostrich.jpg', N'ostrich.mp3', N'ˈästriCH')
SET IDENTITY_INSERT [dbo].[Word] OFF
ALTER TABLE [dbo].[Meaning]  WITH CHECK ADD  CONSTRAINT [FK_Meaning_Type] FOREIGN KEY([tId])
REFERENCES [dbo].[Type] ([tId])
GO
ALTER TABLE [dbo].[Meaning] CHECK CONSTRAINT [FK_Meaning_Type]
GO
ALTER TABLE [dbo].[Meaning]  WITH CHECK ADD  CONSTRAINT [FK_Meaning_Word] FOREIGN KEY([wId])
REFERENCES [dbo].[Word] ([wId])
GO
ALTER TABLE [dbo].[Meaning] CHECK CONSTRAINT [FK_Meaning_Word]
GO
USE [master]
GO
ALTER DATABASE [ImageDictionary] SET  READ_WRITE 
GO
