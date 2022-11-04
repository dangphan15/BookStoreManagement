USE [master]
GO
/****** Object:  Database [BookStoreManagement]    Script Date: 10/17/2022 9:56:04 PM ******/
CREATE DATABASE [BookStoreManagement]

GO
ALTER DATABASE [BookStoreManagement] SET COMPATIBILITY_LEVEL = 150
GO
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStoreManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoreManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStoreManagement] SET QUERY_STORE = OFF
GO
USE [BookStoreManagement]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[alias_name] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[year_of_birth] [int] NULL,
	[website] [varchar](200) NULL,
	[biography] [nvarchar](1500) NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[alias_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_authors]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_authors](
	[ISBN] [varchar](13) NOT NULL,
	[author_alias] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_book_authors] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[author_alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_genres]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_genres](
	[ISBN] [varchar](13) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_book_genres] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[ISBN] [varchar](13) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[language] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[translator] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[weight] [float] NOT NULL,
	[size] [nvarchar](20) NOT NULL,
	[year_of_publish] [int] NOT NULL,
	[number_of_page] [int] NOT NULL,
	[book_layout] [nvarchar](30) NOT NULL,
	[publisher_name] [nvarchar](100) NOT NULL,
	[image_url] [nvarchar](200) NULL,
	[blog_address] [nvarchar](200) NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](13) NOT NULL,
	[username] [varchar](11) NOT NULL,
	[content] [nvarchar](2000) NULL,
	[status] [varchar](30) NOT NULL,
	[star] [float] NULL,
	[posted_time] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1500) NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[ISBN] [varchar](13) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[ISBN] [varchar](13) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[receiver_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[order_time] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[username] [varchar](11) NOT NULL,
	[staff_username] [varchar](11) NULL,
	[status] [nvarchar](50) NOT NULL,
	[status_note] [nvarchar](1000) NULL,
	[payment] [varchar](50) NULL,
	[to_confirm_date] [datetime] NULL,
	[to_ship_date] [datetime] NULL,
	[to_receive_date] [datetime] NULL,
	[expected_date] [datetime] NULL,
	[delivery_company] [nvarchar](100) NULL,
	[completed_date] [datetime] NULL,
	[cancelled_date] [datetime] NULL,
	[return_refund_date] [datetime] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prices]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prices](
	[ISBN] [varchar](13) NOT NULL,
	[price] [float] NOT NULL,
	[applicable_date] [datetime] NOT NULL,
	[status] [varchar](30) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_prices_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[name] [nvarchar](100) NOT NULL,
	[address] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_publishers] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_user_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/17/2022 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](11) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[email] [nvarchar](320) NULL,
	[address] [nvarchar](250) NULL,
	[gender] [nvarchar](10) NULL,
	[password] [nvarchar](60) NOT NULL,
	[role_id] [int] NOT NULL,
	[avatar] [nvarchar](200) NULL,
	[date_of_birth] [date] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Akutami Gege', N'unknown', 1992, N'', N'Gege Akutami is a Japanese manga artist, known for their work Jujutsu Kaisen. Gege Akutami is a pen name and the author''s real name and gender are unknown.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Eiichiro Oda', N'Eiichiro Oda', 1975, N'', N'Eiichiro Oda is a Japanese manga artist and the creator of the series One Piece. With more than 516.5 million tankōbon copies in circulation worldwide, One Piece is both the best-selling manga in history and the best-selling comic series printed in volume, in turn making Oda one of the best-selling fiction authors.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Fujiko F.Fujio', N' Hiroshi Fujimoto', 1933, NULL, N'Fujiko Fujio was a manga writing duo formed by Japanese manga artists Hiroshi Fujimoto and Motoo Abiko. They formed their partnership in 1951, and used the Fujiko Fujio name from 1954 until dissolution of the partnership in 1987, upon Fujimoto''s illness.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Fukuda Shinichi', N'Fukuda Shinichi', 1955, N'', N'Shin-Ichi Fukuda is a Japanese classical guitarist. He has released more than 60 albums, including in Memoriam: Takemitsu: Guitar Works, his interpretation of works by the Japanese composer Toru Takemitsu. Shin-ichi Fukuda Official Website')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Haruba Negi', N'Haruba Negi', 1991, N'', N'Negi Haruba is a Japanese manga artist. He is well known for his manga Go-toubun no Hanayome, which was serialized in Kodansha''s Weekly Shōnen Magazine from August 2017 to February 2020.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Hikawa Hirokazu', N'Hikawa Hirokazu', 1967, N'', N'Hirokazu Hikawa was born July 4, 1967, in Aichi Prefecture. He is best known for his manga adaptations of Bonk and Kirby. In 1987, he won an honorable mention for Kaisei!! Aozora Kyoushitsu (Beautiful Day! Outdoor Classroom) at the 14th Fujiko Fujio Awards.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Himekawa Akira', N'unknown', 0, N'', N'Akira Himekawa is the pen name of a duo of female Japanese comic book artists. When writing original works, the pen name is spelled as Akira Himekawa.
The artists have worked together since 1991 and have chosen not to reveal their real names. The women are individually pen named A Honda and S Nagano. They were previously individually pen named Akira Karitaka  and Nui Ono.
')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Hiroya Oku', N'Oku Hiroya', 1967, NULL, N'Hiroya Oku (奥 浩哉, Oku Hiroya, born September 16, 1967) is a Japanese manga artist who is the creator of Gantz, Gigant, Hen and Inuyashiki, the first two of which have been serialized in Weekly Young Jump. Originally influenced by Katsuhiro Otomo and Ryoichi Ikegami,[1] his manga often contain explicit violence, sexual depictions, and matters that are considered taboo by the public, and he is known as a pioneer in the use of digital processing for manga backgrounds.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Isayama Hajime', N'Isayama Hajime', 1986, N'', N'Hajime Isayama is a Japanese manga artist. His first series, Attack on Titan (2009–2021), became one of the best-selling manga series of all time with 110 million copies in circulation as of September 2022.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Koyoharu Gotouge', N'unknown', 1989, N'', N'Koyoharu Gotouge is a Japanese manga artist, known for the manga series Demon Slayer: Kimetsu no Yaiba. As of February 2021, the manga had over 150 million copies in circulation, making it the ninth best-selling manga series of all time.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Maruyama Kugane', N'Muchimuchi Puririn', 1950, N'', N'Kugane Maruyama (丸山くがね) is a Japanese light novelist and the creator of Overlord. Overlord was later adapted into a manga and anime.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Matsumoto Naoya', N'Naoya Matsumoto', 1982, N'', N'Naoya Matsumoto published his first serialized series, Neko Wappa!, in Weekly Shonen Jump in 2009. His next series, Pochi Kuro, began serialization in Shonen Jump+ in 2014. Kaiju No. 8 is his follow-up series.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Naoko Takeuchi', N'Takeuchi Naoko', 1967, NULL, N'Naoko Takeuchi (Japanese: 武内 直子, Hepburn: Takeuchi Naoko, born March 15, 1967) is a Japanese manga artist. She is best known as the author of Sailor Moon, one of the most popular manga series of all time.[2]

She has won several awards, including the 1993 Kodansha Manga Award for Sailor Moon.[3]

Takeuchi is married to Yoshihiro Togashi, the author of YuYu Hakusho and Hunter × Hunter.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Naoshi Arakawa', N'Arakawa Naoshi', 0, NULL, N'Naoshi Arakawa is a Japanese manga artist, known for his work Your Lie in April.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Ohba Tsugumi', N'Hiroshi Gamo', 1962, N'', N'Tsugumi Ohba is the pen name of a Japanese manga writer, best known for authoring the Death Note manga series with illustrator Takeshi Obata from 2003 to 2006, which has 30 million collected volumes in circulation. The duo''s second series, Bakuman., was also successful with 15 million in circulation.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Sakae Esuno', N'Esuno Sakae', 1973, NULL, N'Sakae Esuno (えすのサカエ, Esuno Sakae, born November 17, 1973) is a Japanese manga artist. He is best known for his manga series Future Diary[1] and Big Order.[2] Esuno started drawing at age 15, at the time he was an admirer of the works of Rumiko Takahashi[3] in particular her horror manga Mermaid Saga.[4] After working as a manga assistant for many years he managed to become a professional manga artist when his story Tetsudō Tenshi (鉄道天使, Railroad Angel) won a prize in a contest held by Kadokawa Shoten in 2001.[4] In the 2017 May issue of Monthly Shōnen Ace magazine, he launched a new manga titled Tantei Akechi wa Kyōran su (The Detective Akechi is Berserk), a tribute to the works of Edogawa Ranpo.[5] The manga ended in the issue published in December 2018.[6] In May 2019, he started the serialization of the manga adaptation of Bokuto Uno''s light novel series Reign of the Seven Spellblades in Monthly Shōnen Ace.[7')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Tatsuki Fujimoto', N'Fujimoto Tatsuki', 1992, NULL, N'Tatsuki Fujimoto is a Japanese manga artist, known for his works Fire Punch and Chainsaw Man.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Wakui Ken', N'Wakui Ken', 0, N'', N'Ken Wakui is a Japanese manga artist. In 2005, Wakui launched his first manga series, Shinjuku Swan, which performed well and received multiple adaptations. Following its success, Wakui launched Tokyo Revengers in 2017, which has also performed well.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Yoshihiro Togashi', N'Yoshihiro Togashi', 1966, N'', N'Yoshihiro Togashi is a Japanese manga artist. He began drawing manga at an early age, before being recognized for his talent by publishing company Shueisha while attending college. Togashi has authored several manga series in different genres during the past three decades.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Yusagi Aneko', N'Yusagi Aneko', 0, N'', N'Aneko Yusagi was born in Kanagawa. After growing interested in reading and gaming, Aneko began to write novels that reflected these interests.')
GO
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1421597713', N'Ohba Tsugumi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1427815577
', N'Sakae Esuno')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1506707742', N'Hiroya Oku')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1569319014', N'Eiichiro Oda')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1591167531', N'Yoshihiro Togashi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'163236171X
', N'Naoshi Arakawa')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1638585725', N'Wakui Ken')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'164273215X', N'Yusagi Aneko')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646090349', N'Fukuda Shinichi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646090519', N'Fukuda Shinichi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646091132', N'Fukuda Shinichi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646091280', N'Fukuda Shinichi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646512537', N'Haruba Negi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646513843', N'Isayama Hajime')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1935429744', N'Naoko Takeuchi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1935429752', N'Naoko Takeuchi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974722341', N'Hikawa Hirokazu')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974725987', N'Matsumoto Naoya')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974732339', N'Akutami Gege')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974734048', N'Himekawa Akira')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1975344855', N'Maruyama Kugane')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'377042848X', N'Tatsuki Fujimoto')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'4092270119', N'Fujiko F.Fujio')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'9123860448', N'Koyoharu Gotouge')
GO
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1421597713', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1421597713', N'Paranormal fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1591167531', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1591167531', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1591167531', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585725', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585725', N'Science fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585725', N'Thriller')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'164273215X', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646091280', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646091280', N'Slide of life')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646512537', N'Harem')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646512537', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646512537', N'School life')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646513843', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646513843', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646513843', N'Horror')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974722341', N'Comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974722341', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974725987', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974725987', N'Science fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974732339', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974732339', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974732339', N'Supernatural')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974734048', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1974734048', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1975344855', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'9123860448', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'9123860448', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'9123860448', N'Fantasy Fiction')
GO
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1421597713', N'Death Note (All-in-One Edition)', N'English', N'In our real life, if there is an object "falling from the sky", it has an almost limitless power to control human life.
The object is no less than a judgmental instrument and the user is not much different from a judge.

So, how to use it will be decisive.

For personal gain? Or to change the world?

The position of “misleading selfish person” and “justice judge” is only a thin line apart - the sobriety in thinking “justice-ideal, can it be decided by only one individual”.

“Then I will create a world full of honest, gentle people who are accepted by myself.”

“If you do that, the only villain left will be you…”', N'Amanda Haley', 1000000, 1.54675, N'4.63x7.13x3.2', 2017, 2, N'Paperback', N'VIZ Media LLC', N'https://salt.tikicdn.com/cache/w1200/ts/product/96/ab/aa/897541eaf5becff293cb329e81179db0.jpg', N'https://www.viz.com/blog/tagged/1454/death-note-all-in-one-edition')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1427815577
', N'Future Diary, Vol. 1', N'English', N'When Yukiteru, a quiet boy who spends most of his time typing on his cell phone diary, realizes that the entries in his diary are from the future, he must face twelve opponents who all posses Future Diaries in a battle to the death. Original.
', N'unknown', 670000, 0.555, N'5.25 x 0.75 x 8', 2009, 210, N'Paperback', N'Tokyopop', N'https://m.media-amazon.com/images/I/51Y+TZjq9gL._SX334_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1506707742', N'Gantz Omnibus Volume 1', N'English', N'Tokyo teens Kei and Masaru are struck dead by a subway train but awaken in a room with an ominous black orb that gives them weapons, suits . . . and orders. Fighting and endless stream of bizarre alien monstrosities in a deadly game, will they win their freedom or die for the final time?
', N'Matthew Johnson', 600000, 0.544311, N'5.15 x 2.03 x 7.23', 2018, 672, N'Paperback', N'Dark Horse Manga', N'https://m.media-amazon.com/images/I/41aesCLxvHL._SX351_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1569319014', N'One Piece, Vol. 1: Romance Dawn', N'English', N'As a child, Monkey D. Luffy dreamed of becoming King of the Pirates. But his life changed when he accidentally gained the power to stretch like rubber…at the cost of never being able to swim again! Years, later, Luffy sets off in search of the “One Piece,” said to be the greatest treasure in the world...', N'unknown', 200000, 0.18143, N'5x7.5x0.7', 2003, 216, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/518KKkmd1fL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', N'https://samquixote.blogspot.com/2020/06/one-piece-volume-1-romance-dawn-by.html')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1591167531', N'Hunter x Hunter, Vol. 1', N'English', N'Hunters are a special breed, dedicated to tracking down treasures, magical beasts, and even other people. But such pursuits require a license, and less than one in a hundred thousand can pass the grueling qualification exam. Those who do pass gain access to restricted areas, amazing stores of information, and the right to call themselves Hunters.', N'unknown', 230000, 0.155922, N'5x7.5x0.7', 2005, 184, N'Paperback', N'VIZ Media LLC', N'https://m.media-amazon.com/images/I/51sgb4BNN-L.jpg', N'https://aminoapps.com/c/anime/page/blog/hunter-x-hunter-volume-1-review/ant0_unWaeNLYoJMm4zmzEpMEPWVZ3')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'163236171X
', N'Your Lie in April Vol. 1', N'English', N'A LIFE IN MONOTONE
Kosei Arima was a piano prodigy until his cruel taskmaster of a mother died suddenly, changing his life forever. Driven by his pain to abandon piano, Kosei now lives in a monotonous, colorless world. Having resigned himself to a bland life, he is surprised when he meets Kaori Miyazono, a violinist with an unorthodox style. Can she bring Kosei back to music, and back to life?

Praise for the hit anime
“Your Lie in April is about two things: loss and love… A sight to behold.” -Kotaku
“A happy melody… about the power of music to inspire, to energize, to bring sunshine back into a life that’s lost it.” - Anime News Network', N'unknown', 250000, 0.23, N'4.94 x 0.71 x 7.38', 2015, 226, N'Paperback', N'Kodansha Comics', N'https://m.media-amazon.com/images/I/514I++54dYL.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1638585725', N'Tokyo Revengers (Omnibus) Vol. 3-4', N'English', N'After the initial misunderstandings were resolved, the student Ngu Duong gradually became closer to the junior Le Hoan - who had a "fierce" appearance but was actually very gentle and warm. They watch movies together and walk the streets together, and then share their worries with each other all the time.

Le Hoan, who was shunned by friends around, even slandered just because of his taciturn appearance, before a Ngu Duong who always treated him sincerely, began to develop a special emotion that cannot be named. . However, at this time, Yu Yang has too many worries to think about. The family does not understand, relatives speak in and out, the eyes of outsiders and society, making a person who has suffered many injuries like Ngu Duong become panic and insecure.', N'unknown', 500000, 0.368544, N'5.86x8.24x0.97', 2022, 396, N'Paperback', N'Seven Seas', N'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/6385/9781638585725.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'164273215X', N'The Rising of the Shield Hero Volume 19: The Manga Companion', N'English', N'A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom. A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom.', N'unknown', 300000, 0.255146, N'5x7x1', 2022, 176, N'Paperback', N'One Peace Books', N'https://images-na.ssl-images-amazon.com/images/I/615KYcw6hxL.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1646090349', N'My Dress-Up Darling 3', N'English', N'Wakana and Marin make it through their very first cosplay event, and not long after, Marin''s heart undergoes a change...?! But that''s not going to stop her cosplaying! To research their next project, the duo decide to watch the anime it''s based on...but on screening night, they wind up alone together...?! And with JuJu, another gorgeous cosplayer, dropping by Wakana''s house...it seems like a love triangle is abrew!
', N'Taylor Engel', 300000, 0.3453, N'5.78 x 0.62 x 8.24', 2020, 192, N'Paperback', N'Square Enix Manga', N'https://m.media-amazon.com/images/I/51KwrnYnVqL._SX346_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1646090519', N'My Dress-Up Darling 04', N'English', N'The preparations for Marin and JuJu''s group cosplay steadily advance...until at long last, the costumes are complete!!
That should just leave the photo shoot...but Wakana has a secret plan the other two don''t know about!!', N'Taylor Engel', 300000, 0.35765, N'5.7 x 0.6 x 8.2', 2021, 192, N'Paperback', N'Square Enix Manga', N'https://m.media-amazon.com/images/I/51VTeUIEcuL._SX346_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1646091132', N'My Dress-Up Darling 05', N'English', N'Wakana has spent every summer vacation on his own...until now! With a friend like Marin at his side, he''s about to get a taste of everything summer has to offer and more—the pool, fireworks, extra homework…and of course, cosplay!

Now that she''s crossed off bronzed fighter Veronica-tya from her to-do list, Marin has set her sights on a succubus from one of her favorite manga series! But when she picks out a questionable location for the photo shoot, Wakana''s the one about to be left red in the face and hot under the collar!', N'Taylor Engel', 300000, 0.3685, N'5.8 x 0.6 x 8.24', 2022, 192, N'Paperback', N'Square Enix Manga', N'https://m.media-amazon.com/images/I/511LxcZVYDL._SX352_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1646091280', N'My Dress-Up Darling 06', N'English', N'A loner boy and a flashy girl find common ground via cosplay in this sweet and spicy romcom! Traumatized by a childhood incident with a friend who took exception to his love of traditional dolls, doll-artisan hopeful Wakana Gojou passes his days as a loner, finding solace in the home ec room at his high school.', N'Taylor Engel', 300000, 0.368544, N'5.78x8.24x0.6', 2022, 192, N'Paperback', N'Square Enix Manga', N'https://images-na.ssl-images-amazon.com/images/I/714V27eBabL.jpg', N'https://www.crowsworldofanime.com/posts/my-dress-up-darling-episode-6-review-best-in-show/')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1646512537', N'The Quintessential Quintuplets Part 1 Manga Box Set', N'English', N'A poor, straight A student is hired to tutor some rich quintuplets. The story is told as a flashback from a future that shows that he ends up getting married to one of them. A poor, straight A student is hired to tutor some rich quintuplets.', N'unknown', 1400000, 1.474175, N'5.08x7.69x4.65', 2022, 1344, N'Paperback', N'Kodansha Comics', N'https://images-na.ssl-images-amazon.com/images/I/51+rlDyWYNL._SY418_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1646513843', N'Attack on Titan The Final Season Part 1 Manga Box Set', N'English', N'The War Hammer Titan defeats the Attack Titan and forces Eren out of its body. Just as she prepares to kill him, Mikasa arrives and attacks the War Hammer nape with Thunder Spears, although it turns out to be ineffective. Meanwhile, Udo is declared dead; a vengeful Gabi heads back to the battlefield. Eren realizes that Lara crystal-covered body is underground, connected by a long white cord. He transforms into the Attack Titan again and severs the cord, preparing to devour her. Porco Jaw Titan leaps onto the Attack Titan nape, but Levi arrives and slices its jaw-joint, much to Porco surprise and horror as the enemy initiates a counterattack against him.', N'unknown', 900000, 1.347169, N'5.1x7.67x4.34', 2021, 1248, N'Paperback', N'Kodansha Comics', N'https://images-na.ssl-images-amazon.com/images/I/51+ZlK-XJaL._SX453_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1935429744', N'Sailor Moon 1', N'English', N'Usagi Tsukino is a normal girl until she meets up with Luna, a talking cat, who tells her that she is Sailor Moon. As Sailor Moon, Usagi must fight evils and enforce justice, in the name of the Moon and the mysterious Moon Princess. She meets other girls destined to be Sailor Senshi (Sailor Scouts), and together, they fight the forces of evil!

This new edition of Sailor Moon will feature:

- An entirely new, incredibly accurate translation!
- Japanese-style, right-to-left reading!
- New cover art never before seen in the U.S.!
- The original Japanese character names!
- Detailed translation notes!

This version of Sailor Moon will be completely true to original. Join us as Sailor Moon returns to the U.S. for the first time in years!', N'unknown', 250000, 0.345, N'5 x 0.65 x 7.5', 2011, 248, N'Paperback', N'Kodansha Comics', N'https://m.media-amazon.com/images/I/51rQQISM3yL._SX331_BO1,204,203,200_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1935429752', N'Sailor Moon 2', N'English', N'The mysterious Tuxedo Mask has revealed his identity, forcing Usagi to come to terms with her growing affections for the masked vigilante, all the while defending the people of Earth from renewed attacks by the sinister “enemy”. Everything threatens to overwhelm even Sailor Moon when suddenly a new Sailor Guardian appears. Could this new Guardian be the Moon Princess the Sailor Guardians are sworn to protect?
 
This new edition of Sailor Moon features:

- An entirely new, incredibly accurate translation!
- Japanese-style, right-to-left reading!
- New cover art never before seen in the U.S.!
- The original Japanese character names!
- Detailed translation notes!', N'unknown', 250000, 0.345, N'5 x 0.64 x 7.5', 2011, 244, N'Paperback', N'Kodansha Comics', N'https://m.media-amazon.com/images/I/51CCc-6fcOL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1974722341', N'Kirby Manga Mania, Vol. 1', N'English', N'Kirby Manga Mania is a comedy manga based on the Kirby series, written and drawn by Hirokazu Hikawa. Its volumes are mainly collections of stories from throughout the 1995 - 2006 run of the series Kirby of the Stars: The Story of Dedede Who Lives In Pupupu, originally serialized in the magazine CoroCoro Comic.', N'Amanda Haley', 280000, 0.144583, N'5x7.5x0.6', 2021, 160, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/71pfJRpQLlL.jpg', N'https://goodcomicsforkids.slj.com/2021/07/21/kirby-manga-mania-review/')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1974725987', N'Kaiju No. 8, Vol. 1', N'English', N'Kafka Hibino, a kaiju-corpse cleanup man, has always dreamed of joining the force. But when he gets another shot at achieving his childhood dream, he undergoes an unexpected transformation. How can he fight kaiju now that he is become one himself?!', N'unknown', 190000, 0.201282, N'5x7.5x0.7', 2021, 204, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/516CtkXyKOL._SX430_BO1,204,203,200_.jpg', N'https://ashleymanning.com/2021/12/27/kaiju-no-8-vol-1-manga-review-monster-mondays/')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1974732339', N'Jujutsu Kaisen, Vol. 17', N'English', N'Jujutsu Kaisen is the story of Yuji Itadori, an easygoing high school student who joins the occult club at school. When they accidentally summon grotesque creatures by messing with a cursed object, Itadori fights to save his friends lives.', N'John Werry', 300000, 0.0850486, N'4.90x7.40x0.70', 2022, 200, N'Paperback', N'VIZ Media LLC', N'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/9747/9781974732333.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1974734048', N'The Legend of Zelda: Twilight Princess, Vol. 10', N'English', N'The story focuses on series protagonist Link, who tries to prevent Hyrule from being engulfed by a corrupted parallel dimension known as the Twilight Realm. To do so, he takes the form of both a Hylian and a wolf, and he is assisted by a mysterious creature named Midna.', N'unknown', 350000, 0.104893, N'5x7.5x0.5', 2022, 160, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/516ZvYYQTrL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'1975344855', N'Overlord, Vol. 15', N'English', N'Overlord Manga is based on the light novel series. It is a manga adaptation written by Satoshi Oshio, with art illustrated by Hugin Miyama.', N'Ixxion', 250000, 0.187107, N'5.05x7.5x0.85', 2022, 178, N'Paperback', N'Yen Press', N'https://images-na.ssl-images-amazon.com/images/I/811jQdm8-ML.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'377042848X', N'Chainsaw Man 02', N'English', N'Usagi Tsukino is a normal girl until she meets up with Luna, a talking cat, who tells her that she is Sailor Moon. As Sailor Moon, Usagi must fight evils and enforce justice, in the name of the Moon and the mysterious Moon Princess. She meets other girls destined to be Sailor Senshi (Sailor Scouts), and together, they fight the forces of evil!

This new edition of Sailor Moon will feature:

- An entirely new, incredibly accurate translation!
- Japanese-style, right-to-left reading!
- New cover art never before seen in the U.S.!
- The original Japanese character names!
- Detailed translation notes!

This version of Sailor Moon will be completely true to original. Join us as Sailor Moon returns to the U.S. for the first time in years!', N'unknown', 250000, 0.265, N'4.88 x 0.59 x 7.09', 2020, 399, N'Paperback', N'Egmont Manga', N'https://m.media-amazon.com/images/I/51w84qXKp0L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'4092270119', N'Doraemon: Gadget Cat from the Future, Vol. 1', N'Japanese', N'Doraemon, a cat robot, traveled back in time from the 22nd century to watch over Noby who’s a good kid but terrible at sports, never studies, and has an incredible capacity for slacking off. Doraemon tries to help Noby with nice but often unpredictable gadgets from his 4th dimensional pocket as Noby’s clumsy and always getting into trouble. Can Doraemon solve the problems and change Noby’s fortune for the better?', N'unknown', 370000, 0.354, N'5x1x8', 2004, 200, N'Paperback', N'Shougakukan', N'https://m.media-amazon.com/images/I/51M2gzuiNuL.jpg', NULL)
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url], [blog_address]) VALUES (N'9123860448', N'Demon Slayer: Kimetsu no Yaiba Vol-1-5 Books Collection set', N'English', N'In Taisho-era Japan, kindhearted Tanjiro Kamado makes a living selling charcoal. But his peaceful life is shattered when a demon slaughters his entire family. His little sister Nezuko is the only survivor, but she has been transformed into a demon herself! Tanjiro sets out on a dangerous journey to find a way to return his sister to normal and destroy the demon who ruined his life.', N'unknown', 900000, 0.195612, N'4.41x7.09x0.24', 2019, 216, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/514ByuCVj8L._SX290_BO1,204,203,200_.jpghttps://m.media-amazon.com/images/I/51sgb4BNN-L.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (1, N'1569319014', N'0899903369', N'truyện hay quá!', N'Active', 3.7, CAST(N'2022-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (2, N'1569319014', N'0986425618', N'Em thích đọc sách, đọc truyện từ hồi còn học lớp 2, những cuốn sách, cuốn truyện của em chất cao trên giá sách theo năm tháng. Có những cuốn em đã tặng hoặc cho đi, nhưng có những cuốn sách em vẫn luôn muốn giữ lại, riêng cuốn này thì em muốn vứt vào thùng rác luôn cho rồi.', N'Active', 4.5, CAST(N'2022-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (3, N'9123860448', N'0112345678', N'truyện dở quá.', N'Inactive', 1, CAST(N'2022-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (4, N'1974734048', N'0899903369', N'Có ai đó đã nói rằng: “Mỗi cuốn sách là một bức tranh kì diệu, mở ra trước mắt chúng ta những chân trời tri thức. Quả thật như vậy, qua mỗi cuốn sách, ta sẽ bắt gặp những câu chuyện, những con người với từng mảnh đời, số phận khác nhau.', N'Active', 5, CAST(N'2022-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (5, N'1974734048', N'0899903369', N'Em tin dù là người mạnh mẽ đến đâu cũng sẽ phải rung động khi đọc cuốn sách này.', N'Active', 3, CAST(N'2022-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (6, N'1421597713', N'0112345678', N'Có thể nói sách là thứ không thể thiếu trong cuộc đời mỗi con người, sách cho ta tri thức, nuôi dạy tâm hồn và trí tuệ của con người. Và chắc hẳn ai cũng có ít nhất một cuốn sách yêu thích của riêng mình và tôi cũng vậy.', N'Active', 4.8, CAST(N'2022-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (7, N'1421597713', N'0112345678', N'Tôi là một đứa bé mồ côi…
Sinh ra trong một gia đình thiếu đi cái siết chặt từ bàn tay cha, và cái ôm ấm áp của mẹ. tôi đã luôn ước ao có được sự may mắn như bao đứa trẻ khác, nhưng cuộc sống chẳng rộng lòng cho ai tất cả, tôi đã thực sự sụp đổ khi đối diện trước những khổ đau ấy. Nhưng bất ngờ tìm thấy và đồng cảm với cuốn sách của một tác giả nổi tiếng Ohba Tsugumi, trong cuốn sách đã chứa đựng những khoảnh khắc đôi khi làm tôi đau đớn nhưng đôi khi lại thấy mình thật hạnh phúc.', N'Active', 4, CAST(N'2022-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (9, N'1974734048', N'0123456789', N'Good book', N'Active', 0, CAST(N'2022-09-28T21:17:51.433' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (10, N'1974734048', N'0123456789', N'Nice Book', N'Active', 0, CAST(N'2022-09-28T21:18:57.347' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (11, N'1974734048', N'0123456789', N'Tuyệt quá', N'Active', 0, CAST(N'2022-09-28T21:19:04.810' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (21, N'1569319014', N'0123456789', N'ok', N'Active', 1, CAST(N'2022-10-04T14:15:20.220' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (22, N'1569319014', N'0123456789', N'Quan đã tới đây', N'Active', 3, CAST(N'2022-10-04T15:56:53.947' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (23, N'1569319014', N'0123456789', N'Hic :)', N'Active', 3, CAST(N'2022-10-04T16:14:45.697' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (24, N'1569319014', N'0123456789', N'hbhjbluh', N'Active', 3, CAST(N'2022-10-04T16:14:56.863' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (26, N'1569319014', N'0123456789', N'Sách hay lắm các bạn nhóm 3 ơi', N'Active', 5, CAST(N'2022-10-04T16:32:27.703' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (28, N'1569319014', N'0899903369', N'Hic :)', N'Active', 1, CAST(N'2022-10-07T12:37:21.207' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (29, N'1421597713', N'0123456742', N'
Cốt truyện, hướng phát triển nhân vật vẫn được thực hiện một cách hoàn hảo, nhưng mình phải thừa nhận rằng mình thích cách dẫn truyện dưới góc nhìn của Raito ban đầu hơn. Mình không quan tâm lắm đến các nhân vật mới đã được giới thiệu và do đó truyện không được thú vị như những tập trước. Đây cũng là một bước ngoặt rất bất ngờ khiến mọi thứ rất khó đoán. Cuối cùng, nhưng không kém phần quan trọng, mình thất vọng vì cách phát triển nhân vật của Misa. Mình đã hy vọng cô ấy dần trưởng thành và trở thành một thành viên bình đẳng của tổ. Series này thiếu một nhân vật nữ mạnh mẽ sau Naomi Misora nên mình không thích sự thiếu sót đáng chú ý này của dàn nhân vật.', N'Active', 5, CAST(N'2022-10-07T12:47:13.957' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (30, N'1421597713', N'0899903369', N'SPK本部をキラ信者に包囲されたニアは、驚愕の方法でこの危機を脱する事に!? そして今までの状況等を考え、二代目L=月に疑惑の念を強く抱き始めたニアは、日本捜査本部に揺さぶりをかけてきたが…!?', N'Active', 4, CAST(N'2022-10-07T12:47:29.687' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (31, N'1421597713', N'0986425618', N'
Khá nhiều độc giả nhận xét rằng họ đã có sự cải thiện lớn, hoặc sự thay đổi thật sự sau khi đọc quyển sách. Mình không rõ sự thay đổi ở chính mình sẽ sâu sắc đến mức nào, tuy nhiên trong cuộc sống hằng ngày, mình đã biết kiểm soát những ý nghĩ gây ngăn chặn quyết tâm làm một việc nào đó hoặc chỉ đơn giản là ngưng các vế sau từ "nhưng" vì những ý niệm sau đó dễ dầu trở thành yếu tố cấu thành cho một lời biện bạch. • Mình đồng tình với quan điểm và cách lí giải của những lời biện bạch đã ngăn chặn chúng ta khai phá khả năng hoặc tiềm năng trong việc theo đuổi hay hoàn thành một mục tiêu nào đó. Đại đa số những người biện hộ cho những lí do tại sao họ không thành công thường có xu hướng chấp nhận một cuộc sống tầm thường - điều mà tác giả cho rằng kẻ thù thật sự của thành công (hoặc theo mình, chỉ là có một cuộc sống tốt hơn) - và họ thường nghĩ đó thật là một thực tế chứ không phải là biện bạch. Một quyển sách nên đọc để nhận ra những niềm tin hay ý nghĩ sai lầm gây cản trở bước chân bạn để không đổ lỗi, than phiền hay nhìn nhận khuyết điểm của bản thân cũng chính là khuyết điểm của cuộc sống này.', N'Active', 5, CAST(N'2022-10-07T12:48:01.360' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (32, N'1421597713', N'0899903369', N'Cuốn sách giúp mình giác ngộ ra được nhiều điều hihi từ đó phá vỡ một số giới hạn mà bản thân mình tự đặt ra hay suy diễn để tìm lại đúng thực lực và vị trí của mình. Đọc mà cứ phì cười vì lời văn và hình ảnh con bò của sách khá vui nhộn. Mình nghĩ là đa số mọi người ai cũng sẽ tìm thấy mình ở trong quyển sách này. "Con bò" đại diện cho những lời biện bạch, những cái cớ, những lời nói dối và những định kiến mà ta tự áp đặt. Chắc hẳn trong mỗi người đều có những "con bò" trên vai mình. Sách thuộc thể loại kĩ năng nhưng không khô khan, rất dễ đọc. Sách giúp mình thay đổi cách suy nghĩ và lời nói của mình rất nhiều, vì Mỗi suy nghĩ và lời nói đều ảnh hưởng đến thái độ và hành động của mình. Lạc quan hay bi quan đều bắt đầu từ tâm trí, ta có thể lựa chọn. Đừng để những "con bò" kìm hãm ta sống mãi cuộc đời tầm thường chán ngắt..', N'Active', 5, CAST(N'2022-10-07T12:48:10.127' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (33, N'1421597713', N'0899903369', N'"Ngày Xưa Có Một Con Bò" của Camilo Cruz là một cuốn Self-help hữu dụng, đáng đọc. Những ví dụ mà tác giả đưa ra vô cùng gần gũi, nhiều trường hợp khiến ta phải dùng đến lời biện bạch của chính mình để che đậy đi những sai lầm, thật là một điều không nên làm. Chúng ta chính là người nuôi bò trong câu chuyện ngụ ngôn mà tác giả đã đề cập đến, đơn giản nhưng thâm sâu. Tác giả đã đưa ra những biện pháp giúp bạn giết những con bò đã khiến cuộc sống của bạn trở nên xáo trộn, trở nên đen tối. Chính những con bò ấy đã khiến bạn khó có thể thành công trong cuộc sống! Nhìn chung đây là một cuốn sách tuyệt vời giúp tự rèn luyện bản thân từ bỏ những thói quen xấu để hướng đến sự thay đổi lớn lao.', N'Active', 5, CAST(N'2022-10-07T12:48:20.797' AS DateTime))
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Action', N'Action is about conflict. Whether with guns, blades, fists, or mysterious powers, these manga feature characters in combat - either to protect themselves or the things or people they value, or simply as a way of life.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Adventure', N'Adventure fiction is a type of fiction that usually presents danger, or gives the reader a sense of excitement. Some adventure fiction also satisfies the literary definition of romance fiction.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Comedy', N'Comedy is a genre of fiction that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Fantasy Fiction', N'Fantasy fiction is a genre of writing in which the plot could not happen in real life (as we know it, at least). Often, the plot involves magic or witchcraft and takes place on another planet or in another — undiscovered — dimension of this world.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Harem', N'Harem is a kind of story in Japanese anime and manga where a male character is surrounded and loved by many female characters.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Horror', N'Horror is a genre of fiction which is intended to frighten, scare, or disgust. Horror is often divided into the sub-genres of psychological horror and supernatural horror, which is in the realm of speculative fiction.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Paranormal fiction', N'Paranormal fiction is a genre of fiction whose story lines revolve around the paranormal.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Romantic comedy', N'Romantic comedy is a subgenre of comedy and slice of life fiction, focusing on lighthearted, humorous plot lines centered on romantic ideas, such as how true love is able to surmount most obstacles.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'School life', N'School life is a genre which has the majority of the storyline taking place in a school.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Science fiction', N'Science fiction is a genre of speculative fiction which typically deals with imaginative and futuristic concepts such as advanced science and technology, space exploration, time travel, parallel universes, ...')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Slide of life', N'Slice of life is a depiction of mundane experiences in art and entertainment. In theater, slice of life refers to naturalism, while in literary parlance it is a narrative technique in which a seemingly arbitrary sequence of events in a character life is presented, often lacking plot development, conflict and exposition, as well as often having an open ending.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Supernatural', N'Supernatural fiction or supernaturalist fiction is a genre of speculative fiction that exploits or is centered on supernatural themes, often contradicting naturalist assumptions of the real world.')
INSERT [dbo].[genres] ([name], [description]) VALUES (N'Thriller', N'Thriller is a genre of fiction, having numerous, often overlapping subgenres. Thrillers are characterized and defined by the moods they elicit, giving viewers heightened feelings of suspense, excitement, surprise, anticipation and anxiety. Successful examples of thrillers are the films of Alfred Hitchcock.')
GO
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1421597713', 10)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1427815577
', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1506707742', 10)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1569319014', 30)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1591167531', 500)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'163236171X
', 100)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1638585725', 180)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'164273215X', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646090349', 1000)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646090519', 452)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646091132', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646091280', 0)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646512537', 90)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646513843', 150)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1935429744', 344)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1935429752', 400)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974722341', 50)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974725987', 100)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974732339', 100)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974734048', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1975344855', 80)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'377042848X', 50)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'4092270119', 340)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'9123860448', 100)
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (1, 1, N'1646512537', 1, 1400000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (2, 1, N'1646513843', 1, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (3, 2, N'164273215X', 1, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (4, 3, N'1638585725', 3, 500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (5, 3, N'1646091280', 1, 300000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (6, 4, N'1974722341', 4, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (7, 5, N'1591167531', 1, 230000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (8, 6, N'1421597713', 1, 1000000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (9, 7, N'1569319014', 1, 200000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (10, 8, N'1569319014', 1, 588600)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (11, 9, N'1421597713', 1, 949000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (12, 10, N'1569319014', 2, 378000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (13, 11, N'1638585725', 3, 1500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (14, 12, N'1591167531', 11, 2530000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (15, 12, N'1638585725', 2, 1000000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (16, 13, N'1638585725', 23, 11500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (17, 14, N'1421597713', 5, 4745000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (18, 15, N'1591167531', 1, 230000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (19, 16, N'1591167531', 1, 230000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (20, 17, N'1974734048', 1, 350000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (21, 17, N'164273215X', 1, 300000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (22, 17, N'1591167531', 4, 920000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (23, 17, N'9123860448', 1, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (24, 18, N'1638585725', 7, 3500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (25, 19, N'164273215X', 1, 300000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (26, 20, N'1638585725', 1, 500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (27, 20, N'1569319014', 1, 189000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (28, 21, N'1421597713', 1, 949000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (29, 21, N'1506707742', 1, -1)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (1, N'Receiver1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-01-10T00:00:00.000' AS DateTime), 2300000, N'0899903369', NULL, N'To Confirm', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (2, N'customer1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0894603369', CAST(N'2022-09-15T00:00:00.000' AS DateTime), 550000, N'0899903369', NULL, N'To Confirm', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (3, N'customer2', N' Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City', N'1233536890', CAST(N'2022-09-20T00:00:00.000' AS DateTime), 1800000, N'0112345678', NULL, N'Cancelled', N'Returns', N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (4, N'Receiver2', N'533 Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City', N'1234567890', CAST(N'2023-01-10T00:00:00.000' AS DateTime), 1000000, N'0112345678', NULL, N'Completed', N'No reason', N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (5, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T21:47:17.237' AS DateTime), 230000, N'0899903369', NULL, N'Return/Refund', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (6, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T21:56:46.270' AS DateTime), 1000000, N'0899903369', NULL, N'Return/Refund', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (7, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T21:56:55.220' AS DateTime), 200000, N'0899903369', NULL, N'To Confirm', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (8, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:30:49.707' AS DateTime), 189000, N'0899903369', NULL, N'To Ship', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (9, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:37:15.133' AS DateTime), 949000, N'0899903369', NULL, N'To Ship', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (10, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:37:39.933' AS DateTime), 378000, N'0899903369', NULL, N'To Confirm', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (11, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:38:57.250' AS DateTime), 1500000, N'0899903369', NULL, N'Cancelled', N'No reason', N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (12, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-26T15:07:18.747' AS DateTime), 3530000, N'0899903369', NULL, N'To Ship', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (13, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-27T14:25:34.357' AS DateTime), 11500000, N'0899903369', NULL, N'To Confirm', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (14, N'mai xuan quan', N'abc', N'0123456789', CAST(N'2022-09-28T21:33:39.450' AS DateTime), 4745000, N'0123456789', NULL, N'To Ship', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (15, N'mai xuan quan', N'abc', N'0123456789', CAST(N'2022-09-28T21:35:00.740' AS DateTime), 230000, N'0123456789', NULL, N'Cancelled', N'I like!', N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (16, N'mai xuan quan', N'abc', N'0123456789', CAST(N'2022-09-28T23:01:58.993' AS DateTime), 230000, N'0123456789', NULL, N'To Ship', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (17, N'mai xuan quan', N'abc', N'0123456789', CAST(N'2022-10-03T21:03:01.420' AS DateTime), 2470000, N'0123456789', NULL, N'To Confirm', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (18, N'mai xuan quan', N'abc', N'0123456789', CAST(N'2022-10-06T20:06:39.913' AS DateTime), 3500000, N'0123456789', NULL, N'Completed', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (19, N'Quan dep trai', N'Hà Tĩnh', N'0123456788', CAST(N'2022-10-06T20:32:33.947' AS DateTime), 300000, N'0123456788', NULL, N'To Receive', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (20, N'Viên Kim Cương', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-10-07T13:38:52.573' AS DateTime), 689000, N'0899903369', NULL, N'Completed', NULL, N'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (21, N'Mai Xuân Quân', N'Hà Tĩnh', N'0123456782', CAST(N'2022-10-16T09:53:55.723' AS DateTime), 948999, N'0123456782', NULL, N'To Receive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[prices] ON 

INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1974732339', 300000, CAST(N'2022-09-15T00:00:00.000' AS DateTime), N'Inactive', 1)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1974732339', 250000, CAST(N'2022-09-25T00:00:00.000' AS DateTime), N'Active', 2)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'164273215X', 300000, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'Active', 3)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'164273215X', 200000, CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'Inactive', 4)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'164273215X', 250000, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'Inactive', 5)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1974722341', 280000, CAST(N'2022-08-11T00:00:00.000' AS DateTime), N'Inactive', 6)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1974722341', 250000, CAST(N'2022-09-10T00:00:00.000' AS DateTime), N'Active', 7)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1421597713', 1000000, CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'Inactive', 8)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1421597713', 949000, CAST(N'2022-09-08T00:00:00.000' AS DateTime), N'Active', 9)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646091280', 300000, CAST(N'2022-08-15T00:00:00.000' AS DateTime), N'Active', 10)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646091280', 250000, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'Inative', 11)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1975344855', 250000, CAST(N'2022-01-05T00:00:00.000' AS DateTime), N'Active', 12)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646513843', 900000, CAST(N'2022-01-05T00:00:00.000' AS DateTime), N'Active', 13)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646513843', 700000, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'Inactive', 14)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1974734048', 350000, CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'Active', 15)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1974734048', 300000, CAST(N'2022-11-10T00:00:00.000' AS DateTime), N'Inactive', 16)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646512537', 1400000, CAST(N'2022-09-20T00:00:00.000' AS DateTime), N'Active', 17)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1638585725', 500000, CAST(N'2022-09-01T00:00:00.000' AS DateTime), N'Active', 18)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1638585725', 430000, CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'Inative', 19)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1974725987', 190000, CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'Active', 20)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1591167531', 230000, CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'Active', 21)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1591167531', 200000, CAST(N'2022-10-31T00:00:00.000' AS DateTime), N'Inactive', 22)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'9123860448', 900000, CAST(N'2022-07-17T00:00:00.000' AS DateTime), N'Active', 23)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1569319014', 200000, CAST(N'2022-07-17T00:00:00.000' AS DateTime), N'Inactive', 24)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1569319014', 189000, CAST(N'2022-08-12T00:00:00.000' AS DateTime), N'Active', 25)
SET IDENTITY_INSERT [dbo].[prices] OFF
GO
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Dark Horse Manga', N'....com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Egmont Manga', N'dgvdgd.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Kodansha Comics', N'kodansha.us')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'One Peace Books', N'www.onepeacebooks.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Seven Seas', N'sevenseasentertainment.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Shougakukan', N'shougakukan.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Square Enix Manga', N'squareenixmangaandbooks.square-enix-games.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Tokyopop', N'grgdsgbds.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'VIZ Media LLC', N'www.viz.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Yen Press', N'yenpress.com')
GO
SET IDENTITY_INSERT [dbo].[user_roles] ON 

INSERT [dbo].[user_roles] ([id], [role_name]) VALUES (1, N'admin')
INSERT [dbo].[user_roles] ([id], [role_name]) VALUES (2, N'sale staff')
INSERT [dbo].[user_roles] ([id], [role_name]) VALUES (3, N'inventory staff')
INSERT [dbo].[user_roles] ([id], [role_name]) VALUES (4, N'customer')
INSERT [dbo].[user_roles] ([id], [role_name]) VALUES (5, N'guest')
SET IDENTITY_INSERT [dbo].[user_roles] OFF
GO
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0112345678', N'Nguyễn Thế Hùng', N'customer2@gmail.com', N'334 Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City', N'male', N'$2a$10$nZCfh.svXV.TfJodwIAM3uHRs2dWjoM6sCWwNput8k0lV08oHnEuG', 4, NULL, CAST(N'2002-09-16' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123456742', N'mai xuan quan', N'quan@gamil', N'121dawdas', NULL, N'$2a$10$odTPCHKKUdq2f2diAH/AU.KBu2aRJrzYxVUQ3NG6qQXaXXWXamz2.', 4, NULL, CAST(N'2002-09-16' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123456782', N'Mai Xuân Quân', N'maiquan2212@gmail.com', N'Hà Tĩnh', NULL, N'$2a$10$mWlhRJI.wmpY.YwAsZaCieUtbE4Dm6.DJRfngYjnumHYlHuPy91EG', 4, NULL, CAST(N'2002-09-16' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123456788', N'Quan dep trai', N'quanmxse160052@fpt.edu.vn', N'xyz', NULL, N'$2a$10$EXvfJVOk.5EenLuKqfhgTu6POBGstM7xlPTSMG8Jmul.LtQLzG6Oq', 4, NULL, CAST(N'2002-09-16' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123456789', N'mai xuan quan', N'maiquan@gmail.com', N'abc', N'other', N'$2a$10$cB3zdHUGFAqRu9UB6jzCYu1vTB/oWH05q.irBYpbkIkBSPOR3Y4tm', 4, NULL, CAST(N'2002-02-25' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0899903369', N'Viên Kim Cương', N'customer1@gmail.com', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'male', N'$2a$10$R8AMBy8VPPs2r6X7WjRvB.o5TefsdK0n6komNFViLnszgZGkhe2UW', 4, NULL, CAST(N'2002-08-30' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0986425618', N'Phan Trương Minh Đăng', N'customer3@gmail.com', N'61/1 Thang Long Street, Tan Binh District, Ho Chi Minh City', N'male', N'$2a$10$Xubh0xhayLgtppOVDybmYuOyThrP4/IvChTxogeYcTHo..i/XS8wC', 4, NULL, CAST(N'2000-12-15' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'1233728400', N'i am inventory staff', N'inventorystaff@gmail.com', N'24/491a Le Duc Tho Street, Go Vap District, Ho Chi Minh City', N'male', N'$2a$10$exNKXV7nf4GrQVTmw7cz4uZm7fv2Llvhy6ydQK1xtOV7vV1teSmLi', 3, NULL, CAST(N'2003-12-01' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'1234567890', N'i am admin', N'admin@gmail.com', N'492 Nguyen Dinh Chieu Street, District 3, Ho Chi Minh City', N'female', N'$2a$10$QcfmHmHBSFbsbNAUMlHR6.X8gR05j2Yb2oe3RXngT7QC5MBaYRqcu', 1, NULL, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'1562869061', N'i am sale staff22', N'salestaff2@gmail.com', N'786A Hung Phu Street, District 8, Ho Chi Minh City', N'female', N'$2a$10$9NXi1CAMvAMVWWupIqtgjewtdEEz.JhDCzOXxDJ5VQpiie964ADR6', 2, NULL, CAST(N'2001-10-16' AS Date))
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'1739427091', N'i am sale staff21', N'salestaff1@gmail.com', N'14 Tran Huu Thang Street, Phu Nhuan District, Ho Chi Minh City', N'male', N'$2a$10$4MoN1Nce9s338nBLSsE41uunvuESmezBZ4MvZPLqXv9H8YrHfNMuy', 2, NULL, CAST(N'2002-05-26' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_email]    Script Date: 10/17/2022 9:56:04 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[book_authors]  WITH CHECK ADD  CONSTRAINT [FK_book_authors_authors] FOREIGN KEY([author_alias])
REFERENCES [dbo].[authors] ([alias_name])
GO
ALTER TABLE [dbo].[book_authors] CHECK CONSTRAINT [FK_book_authors_authors]
GO
ALTER TABLE [dbo].[book_authors]  WITH CHECK ADD  CONSTRAINT [FK_book_authors_books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[books] ([ISBN])
GO
ALTER TABLE [dbo].[book_authors] CHECK CONSTRAINT [FK_book_authors_books]
GO
ALTER TABLE [dbo].[book_genres]  WITH CHECK ADD  CONSTRAINT [FK_book_genres_books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[books] ([ISBN])
GO
ALTER TABLE [dbo].[book_genres] CHECK CONSTRAINT [FK_book_genres_books]
GO
ALTER TABLE [dbo].[book_genres]  WITH CHECK ADD  CONSTRAINT [FK_book_genres_genres] FOREIGN KEY([name])
REFERENCES [dbo].[genres] ([name])
GO
ALTER TABLE [dbo].[book_genres] CHECK CONSTRAINT [FK_book_genres_genres]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_books_inventory] FOREIGN KEY([ISBN])
REFERENCES [dbo].[inventory] ([ISBN])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_books_inventory]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_books_publishers] FOREIGN KEY([publisher_name])
REFERENCES [dbo].[publishers] ([name])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_books_publishers]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[books] ([ISBN])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_Comment_books]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_Comment_users]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[books] ([ISBN])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_books]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_orders]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([staff_username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users1] FOREIGN KEY([staff_username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users1]
GO
ALTER TABLE [dbo].[prices]  WITH CHECK ADD  CONSTRAINT [FK_prices_books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[books] ([ISBN])
GO
ALTER TABLE [dbo].[prices] CHECK CONSTRAINT [FK_prices_books]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_user_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[user_roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_user_roles]
GO
USE [master]
GO
ALTER DATABASE [BookStoreManagement] SET  READ_WRITE 
GO
