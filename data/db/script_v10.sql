USE [master]
GO
/****** Object:  Database [BookStoreManagement]    Script Date: 14/11/2022 13:26:48 ******/
CREATE DATABASE [BookStoreManagement]
GO
ALTER DATABASE [BookStoreManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
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
/****** Object:  Table [dbo].[authors]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[blogs]    Script Date: 14/11/2022 13:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](300) NULL,
	[content] [ntext] NULL,
	[posted_time] [datetime] NULL,
	[author] [varchar](11) NULL,
	[staff] [varchar](11) NULL,
	[status] [nvarchar](50) NULL,
	[ISBN] [varchar](13) NULL,
	[thumbnail] [nvarchar](300) NULL,
 CONSTRAINT [PK_blogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_authors]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[book_genres]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[book_import]    Script Date: 14/11/2022 13:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_import](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](13) NULL,
	[publisher] [nvarchar](100) NULL,
	[import_date] [datetime] NULL,
	[quantity] [int] NULL,
	[original_price] [float] NULL,
 CONSTRAINT [PK_book_import] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 14/11/2022 13:26:48 ******/
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
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[genres]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[inventory]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[order_details]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[prices]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[publishers]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 14/11/2022 13:26:48 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 14/11/2022 13:26:48 ******/
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
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Fujiko F.Fujio', N'Hiroshi Fujimoto', 1933, N'', N'Fujiko Fujio was a manga writing duo formed by Japanese manga artists Hiroshi Fujimoto and Motoo Abiko. They formed their partnership in 1951, and used the Fujiko Fujio name from 1954 until dissolution of the partnership in 1987, upon Fujimoto''s illness.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Fukuda Shinichi', N'Fukuda Shinichi', 1955, N'', N'Shin-Ichi Fukuda is a Japanese classical guitarist. He has released more than 60 albums, including in Memoriam: Takemitsu: Guitar Works, his interpretation of works by the Japanese composer Toru Takemitsu. Shin-ichi Fukuda Official Website')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Haruba Negi', N'Haruba Negi', 1991, N'', N'Negi Haruba is a Japanese manga artist. He is well known for his manga Go-toubun no Hanayome, which was serialized in Kodansha''s Weekly Shōnen Magazine from August 2017 to February 2020.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Hikawa Hirokazu', N'Hikawa Hirokazu', 1967, N'', N'Hirokazu Hikawa was born July 4, 1967, in Aichi Prefecture. He is best known for his manga adaptations of Bonk and Kirby. In 1987, he won an honorable mention for Kaisei!! Aozora Kyoushitsu (Beautiful Day! Outdoor Classroom) at the 14th Fujiko Fujio Awards.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Himekawa Akira', N'unknown', 0, N'', N'Akira Himekawa is the pen name of a duo of female Japanese comic book artists. When writing original works, the pen name is spelled as Akira Himekawa.
The artists have worked together since 1991 and have chosen not to reveal their real names. The women are individually pen named A Honda and S Nagano. They were previously individually pen named Akira Karitaka  and Nui Ono.
')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Hiroya Oku', N'Oku Hiroya', 1967, N'', N'Hiroya Oku (Oku Hiroya, born September 16, 1967) is a Japanese manga artist who is the creator of Gantz, Gigant, Hen and Inuyashiki, the first two of which have been serialized in Weekly Young Jump. Originally influenced by Katsuhiro Otomo and Ryoichi Ikegami,[1] his manga often contain explicit violence, sexual depictions, and matters that are considered taboo by the public, and he is known as a pioneer in the use of digital processing for manga backgrounds.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Isayama Hajime', N'Isayama Hajime', 1986, N'', N'Hajime Isayama is a Japanese manga artist. His first series, Attack on Titan (2009–2021), became one of the best-selling manga series of all time with 110 million copies in circulation as of September 2022.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Koyoharu Gotouge', N'unknown', 1989, N'', N'Koyoharu Gotouge is a Japanese manga artist, known for the manga series Demon Slayer: Kimetsu no Yaiba. As of February 2021, the manga had over 150 million copies in circulation, making it the ninth best-selling manga series of all time.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Maruyama Kugane', N'Muchimuchi Puririn', 1950, N'', N'Kugane Maruyama is a Japanese light novelist and the creator of Overlord. Overlord was later adapted into a manga and anime.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Matsumoto Naoya', N'Naoya Matsumoto', 1982, N'', N'Naoya Matsumoto published his first serialized series, Neko Wappa!, in Weekly Shonen Jump in 2009. His next series, Pochi Kuro, began serialization in Shonen Jump+ in 2014. Kaiju No. 8 is his follow-up series.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Matsuri Hino', N'Matsuri Hino', 1995, N'', N'Matsuri Hino was born on January 24 in Hokkaido. She was a bookshop keeper who one day decided to become a manga artist, and all of nine months later, in 1995, she published her first manga title, Kono Yume ga Sametara (When This Dream Is Over), in Japan''s LaLa DX magazine')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Naoko Takeuchi', N'Takeuchi Naoko', 1967, N'', N'Naoko Takeuchi (Japanese: 武内 直子, Hepburn: Takeuchi Naoko, born March 15, 1967) is a Japanese manga artist. She is best known as the author of Sailor Moon, one of the most popular manga series of all time.[2]

She has won several awards, including the 1993 Kodansha Manga Award for Sailor Moon.[3]

Takeuchi is married to Yoshihiro Togashi, the author of YuYu Hakusho and Hunter × Hunter.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Naoshi Arakawa', N'Arakawa Naoshi', 0, N'', N'Naoshi Arakawa is a Japanese manga artist, known for his work Your Lie in April.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Ohba Tsugumi', N'Hiroshi Gamo', 1962, N'', N'Tsugumi Ohba is the pen name of a Japanese manga writer, best known for authoring the Death Note manga series with illustrator Takeshi Obata from 2003 to 2006, which has 30 million collected volumes in circulation. The duo''s second series, Bakuman., was also successful with 15 million in circulation.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Sakae Esuno', N'Esuno Sakae', 1973, N'', N'Sakae Esuno (えすのサカエ, Esuno Sakae, born November 17, 1973) is a Japanese manga artist. He is best known for his manga series Future Diary[1] and Big Order.[2] Esuno started drawing at age 15, at the time he was an admirer of the works of Rumiko Takahashi[3] in particular her horror manga Mermaid Saga.[4] After working as a manga assistant for many years he managed to become a professional manga artist when his story Tetsudō Tenshi (鉄道天使, Railroad Angel) won a prize in a contest held by Kadokawa Shoten in 2001.[4] In the 2017 May issue of Monthly Shōnen Ace magazine, he launched a new manga titled Tantei Akechi wa Kyōran su (The Detective Akechi is Berserk), a tribute to the works of Edogawa Ranpo.[5] The manga ended in the issue published in December 2018.[6] In May 2019, he started the serialization of the manga adaptation of Bokuto Uno''s light novel series Reign of the Seven Spellblades in Monthly Shōnen Ace.[7')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Tatsuki Fujimoto', N'Fujimoto Tatsuki', 1992, N'', N'Tatsuki Fujimoto is a Japanese manga artist, known for his works Fire Punch and Chainsaw Man.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Wakui Ken', N'Wakui Ken', 0, N'', N'Ken Wakui is a Japanese manga artist. In 2005, Wakui launched his first manga series, Shinjuku Swan, which performed well and received multiple adaptations. Following its success, Wakui launched Tokyo Revengers in 2017, which has also performed well.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Yoshihiro Togashi', N'Yoshihiro Togashi', 1966, N'', N'Yoshihiro Togashi is a Japanese manga artist. He began drawing manga at an early age, before being recognized for his talent by publishing company Shueisha while attending college. Togashi has authored several manga series in different genres during the past three decades.')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website], [biography]) VALUES (N'Yusagi Aneko', N'Yusagi Aneko', 0, N'', N'Aneko Yusagi was born in Kanagawa. After growing interested in reading and gaming, Aneko began to write novels that reflected these interests.')
GO
SET IDENTITY_INSERT [dbo].[blogs] ON 

INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (1, N'Maki Goes Wild!!!', N'<p>Before this review veers into the negative, let&rsquo;s get this out of the way quickly: Jujutsu Kaisen is cool. Really, really cool. It slides between battles with that special pizazz, and its staggeringly well animated. The music, too, often brings in rock and hip-hop undertones to orchestral highs, and has that right amount of style to fire the adrenaline. Sure, it sacrifices depth one too many times, and it&rsquo;s maybe a bit too hasty moving moving between its arcs, but who cares? It&rsquo;s cool.</p>
<p>Even the premise manages to be a good mix of funny and&hellip; really, really cool. Ya boy Yuji Itadori is something of a class clown with incredible natural fitness, and after his gramps dies, he gets motivated to try and save people &ndash; problem is that he doesn&rsquo;t have any power to fight the supernatural curses of the series, so, with a curse moments from killing him, he eats a special grade cursed object to find a chance to survive, fight back, and save people. Normally, ingesting cursed objects takes over your body or kills you, but Yuji is special and can harbour this cursed finger &ndash; which happens to be from one of the most deadly special grade curses called Sukuna.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://spacewhaleshome.files.wordpress.com/2021/04/582c080b54a9590e482e28b466b636bd.jpeg?w=1024" alt="" width="924" height="520"></p>
<p>Now, curses. Oh lord, curses. Curses in this series are deadly. They&rsquo;re Lovecraftian abominations, often mangled-up humans wishing for death, that have immense power and special abilities. Most can&rsquo;t talk or think beyond survival (though we obviously end up getting a lot more special grades because this is an underdog story, and thus more of the special variety), and kill indiscriminately with their specific powers. This is generally a great thing as it creates brilliant tension and thinky-tactical fights beyond Hitting Things Harder, but sometimes it creates scenarios where the light-hearted comic tones can&rsquo;t handle the full-extent of how dark it can get. In short &ndash; it can get &lsquo;teenage edgelord edgy&rsquo;, like that time when a Curse burns down a whole restaurant or when a character&rsquo;s mum gets splattered and there&rsquo;s just not enough reflection to let it get away with it beyond shallow shock value.</p>
<p>The mixture of tension and comedy can also be really well matched in this series, though. You&rsquo;ve got Yuji who is a lovable idiot with the best intentions, and that just means he can be confused at the right moments and heroic at others. He goes pretty undeveloped, with his mysteriously athletic backstory not given any story hooks to unfurl, but that ain&rsquo;t that point of the series. It&rsquo;s&nbsp;<em>shounen&nbsp;</em>action &ndash; you came to see an underdog story, and Jujutsu Kaisen delivers with glee.</p>
<p>After ingesting the curse and gaining minor supernatural powers, Yuji joins the mysterious but-so-damn-cool Gojo Satoru and his school of Jujutsu Sorcerers&hellip; of which there are 2 other people in his year. We were acquainted with Megumi Fushigoro from episode 1 &ndash; a fellow sorcerer who summons cursed familiars to fight on his behalf and who can be extremely cold to hide his idyllic side &ndash; and we meet Nobara Kugisaki a few episodes later &ndash; a girl from the boonies who uses a hammer and nails to fire supernatural bullets, and can curse curses by smashing parts of their bodies into voodoo dolls. The series gained a lot when Nobara came in, because it showed that Jujutsu Kaisen isn&rsquo;t just a &lsquo;boy&rsquo;s club&rsquo;&nbsp;<em>shounen</em>&nbsp;anime &ndash; it&rsquo;s equally as competent at writing male and female characters, and never leers at its women.</p>
<p>It even challenges sexism later in the series, when we meet the second years where there&rsquo;s another well written female character in Maki, a master of multiple forms of weaponry who was essentially cast aside from her family because she was too ambitious for a woman. You love to see it, and you love to see the respect that Nobara and Maki gain (and how well they ship omg).</p>
<p>Yet at the same time, I don&rsquo;t wanna go giving too much credit for writing women in the correct fashion &ndash; it still, ultimately, falls into the same trappings of lacking depth and punch that the male characters suffer from, so Nobara and Maki never become &lsquo;great female characters&rsquo;.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://spacewhaleshome.files.wordpress.com/2021/04/4a3b6e2b133afd1aea1aab23bfdc7d80.jpeg?w=1024" alt="" width="841" height="473"></p>
<p>But this excellent treatment of its female characters contributes to Jujutsu Kaisen having very few of the tripping blocks that relegate&nbsp;<em>shounen</em>&nbsp;action to the &lsquo;boy&rsquo;s club&rsquo;. It&rsquo;s slick, it&rsquo;s cool, it&rsquo;s respectful and it&rsquo;s a lot of fun. There&rsquo;s sequences of Itadori chasing small leads and turning into something too big that he can&rsquo;t solve alone, and he has to tag-out with other characters, and the way that teamwork happens in action scenes is great and makes the cast feel &lsquo;full&rsquo; without feeling like a one-man-superhero affair,. No wonder it&rsquo;s selling bombs in Japan, because it has such a large demographic pull and, really, you might not walk away calling it your favourite, but I can almost guarantee you&rsquo;ll crack a smile watching it because it just doesn&rsquo;t trip on landmines. Other than, potentially, having too wider tone and not giving its transitions between arcs enough take-up time.</p>
<p>The tonal width is something I wouldn&rsquo;t want to sacrifice for the world, though, because whatJujutsu Kaisen absolutely excels at is comedy. Goddamn this show is funny. It keeps up the cool aesthetic despite turning all its characters into dorky goons. You got Gojo Satoru, who is a teacher at Jujutsu Tech, and is ridiculously overpowered. At one point he finger-guns a magical bullet that destroys scenery, and the curse that the gang were barely able to go toe-to-toe with&hellip; is assumed absolutely decimated &ndash; but at the same time, this guy posted a series of letters for another teacher to follow, leading them to an envelope with a picture of a crudely drawn penis inside. Or, take Todo, a 3rd year from the Kyoto school, who has immense physical strength and is purported to have the same sort of potential as Gojo &ndash; and he opens the fights with other sorcerers by asking what their type of women is (or men, which just made me love him more because everybody&rsquo;s so nice and respectful!). Everybody&rsquo;s a dork, and the comic scenes are given such dedication via the series&rsquo; astonishing animation chops, slick fast direction and terrific voice acting that it&rsquo;s a hoot. I fell about laughing constantly&hellip; though&hellip; even aside gimmicky characters like Panda and the boy who talks only in food, I had this nagging the comedy was just scene-setting stuff with very few ties to developments, but it doesn&rsquo;t change the fact that it&rsquo;s 110% effort and exhausting my ribs. Bonus points to the after credit &lsquo;Juju Scrolls&rsquo; &ndash; brief sketches that are pure sillies and I never missed one.</p>
<p>The action is pure spectacle. Gob-dropping stuff. Even small skirmishes are extremely passionately animated. I couldn&rsquo;t believe they kept it up all series, and even if there were some shortcuts taken outside of action sequences, there was never once a degradation. Watching the characters zoom around battles could be matched by slower, more methodical high-frame-rate sequences, and even scenes with Maki and her assortment of weapons had a great sense of choreography behind them. Cursed magic would enter in a thick lined, jarring art-style, but that made it really stylish and cool, and reminded me of Demon Slayer&rsquo;s water effects. Very cool stuff.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://spacewhaleshome.files.wordpress.com/2021/04/6a3b84d619c62ca43d0d0b049433341f.jpeg?w=1024" alt="" width="806" height="453"></p>
<p>Itadori keeps getting into situations, and I love that everybody gets a chance to shine, but if you look at the backbone, these are basic&nbsp;<em>shounen</em>&nbsp;formulas. There&rsquo;s even a tournament arc &ndash; though it culminates in a baseball game between the schools and is comedy gold, it doesn&rsquo;t change the fact that it &lsquo;goes wrong&rsquo; when the scheming Curses turn up with their plans. It&rsquo;s got hype moments and has the artistic chops to make them hype as hell, but there&rsquo;s just not too much sticking. Jujutsu Kaisen is so close to greatness. So, so, so close. But it falls short because it just doesn&rsquo;t have depth &ndash; anywhere. It&rsquo;s cool as hell, but shallow; shall we call that &lsquo;all style; no substance?&rsquo; I don&rsquo;t want to rely on cliches to insult it, though, because its heart is in the right place (other than the gimmicky characters, but even they&rsquo;re cool too).</p>', CAST(N'2022-10-20T10:14:20.000' AS DateTime), N'0123450007', N'0123450003', N'approved', N'1974732339', N'https://static1.srcdn.com/wordpress/wp-content/uploads/2022/05/Jujutsu-Kaisen-Maki-Zenin.jpg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (2, N'Gojo''s students fight back', N'<p>All living beings emanate an energy called Cursed Energy, which arises from negative emotions that naturally flow throughout the body. Normal people cannot control this flow in their bodies. As a result, they continually lose Cursed Energy, resulting in the birth of Curses. Jujutsu Sorcerers are people who control the flow of Cursed Energy in their bodies, allowing them to use it as they please and also to reduce its release.</p>
<p>After the death of his grandfather, Yuji Itadori chooses to eat the finger of a Curse creature to protect his friends from a Cursed creature and he becomes the host of Ryomen Sukuna, a powerful Curse. Jujutsu Sorcerers who had been hunting the Cursed creature are then asked to slay Yuji immediately. However, because Yuji is able to maintain control of the Curse, they allow him to live for as long as he agrees to eat the rest of the creature&rsquo;s fingers so that they can execute all Curses in one. The belief is that Yuji may also find a way out of this fate by the time they find all Cursed fingers.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://i0.wp.com/www.redital.com/wp-content/uploads/2021/03/jujutsu-kaisen-panel.jpg?resize=1024%2C614&amp;ssl=1" alt="" width="1024" height="614"></p>
<p>Although the premise of&nbsp;<em>Jujutsu Kaisen</em>&nbsp;sounds too bizarre to be taken seriously, I was surprised at how enjoyable a read this manga volume was. As I said at the start of this review, the anime didn&rsquo;t grab me at all during its first episode. How much of this is a format preference, I&rsquo;m not sure about, but to me it seemed that the manga cut out the fluff and got right to the core story elements. This is important in a first volume of a story, because the fundamental aim is to hook the reader into the story so they&rsquo;ll be invested in what&rsquo;s to come.</p>
<p>The art in this manga suits its tone perfectly.&nbsp;<em>Jujutsu Kaisen</em>&nbsp;is your typical Shōnen action series which features a bunch of well-placed humour. For that reason, it&rsquo;s perfectly normal for some illustrations to be full of intricate details during an action scene, while during some of the more laid-back and comedic moments, the level of detail sees a reduction. In-between chapters, author Gege Akutami also adds in lots of fun introspection about the creative process. While also giving us some fun (and obscure) details about the characters. It&rsquo;s little things like this that make the manga even more worth reading.</p>
<p>There were some panels where it got confusing to tell who&rsquo;s speaking, such as when a character is saying something while not being displayed in the panel. This means you need to pay extra close attention to the thread of conversations. Sometimes the author makes it easier by drawing a chibi face of the character inside the bubble, but this is typically in panels where no characters at all are shown. But despite the few moments of confusion, this was still a pleasurable reading experience.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://i0.wp.com/www.redital.com/wp-content/uploads/2021/03/jujutsukaisen-feature.jpg?w=1280&amp;ssl=1" alt="" width="737" height="415"></p>
<p>Because of how well the action and humour go together in this series, I was getting Bleach vibes from it. Some may see that as a bad thing, but early&nbsp;<em>Bleach</em>&nbsp;was pretty incredible. And&nbsp;<em>Jujutsu Kaisen</em>&nbsp;is already showing more promise than&nbsp;<em>Bleach</em>&nbsp;had.</p>
<p>I highly recommend reading this manga if you&rsquo;re a weirdo like me and the anime isn&rsquo;t doing it for you.</p>', CAST(N'2022-09-14T17:17:20.000' AS DateTime), N'0123450007', N'0123450009', N'approved', N'1974732339', N'https://gamek.mediacdn.vn/133514250583805952/2021/12/17/tc2-1639725141535644461544.jpg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (3, N'Is the Jujutsu Kaisen manga worth reading?', N'<p>Jujutsu Kaisen is my most enjoyed manga ever. I haven&rsquo;t read a lot but this is definitely my favorite. I&rsquo;m not into shounen manga so much but this totally made me love it. The artstyle is pretty good. The characters are also enough to make you read until the end even if you don&rsquo;t like its overall plot. Heck, Gojo and Toji alone can make you stay.</p>
<p>Let me state some reasons why you should read this manga.</p>
<h2>The animation is very cooool</h2>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://qph.cf2.quoracdn.net/main-qimg-155968676e54bde44c1b3cf88f36daca-lq" alt="" width="602" height="339"></p>
<p>The art style is definitely 10/10 for me. I don&rsquo;t really understand how fight scenes in a manga works since I&rsquo;ve only read romcom mangas and such but it really is very interesting to see these types of panels. You can understand it once you&rsquo;ve put your attention to it so it&rsquo;s not a problem. The fight scenes are also superb.</p>
<h2>Great characters</h2>
<div>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="https://qph.cf2.quoracdn.net/main-qimg-7a3d3f40c2dc493e3fc3eed81d040ffd-lq" alt="" width="774" height="261"></div>
<div>The characters really are fun. They have their own share of flashbacks and reasons that are explained thoroughly in the manga. They are also hot as flat iron. Even panda is so cool and hot! Heck, Gojo and Toji alone can make you stay til the end even if you don&rsquo;t like the overall plot.</div>
<div>
<h2>Has villains that you would definitely hate</h2>
<div>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="https://qph.cf2.quoracdn.net/main-qimg-ae41f26a0b89b4dcb9e926255f67219b-pjlq" alt="" width="602" height="467"></div>
<div>Mahito is really really cute and hot and handsome but I TOTALLY HATE HIM! I hate him so much that I want him to die even if she&rsquo;s handsome as heck. It&rsquo;s actually a good thing since you won&rsquo;t have split opinions like what I had during some animes where I can&rsquo;t hate the villains and it frustrates me so much. Mahito doesn&rsquo;t make that much of a sense so it&rsquo;s easy to hate him.</div>
<div>
<h2>Doesn&rsquo;t overuse the power of friendship</h2>
<div>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="https://qph.cf2.quoracdn.net/main-qimg-d400bd21e90218efa65cde3bf589e0e9-lq" alt="" width="602" height="315"></div>
<div>It doesn&rsquo;t have things where the mc would gain an impossible and undefeatable power because a friend just died or was hurt. Of course, the rage from a friend&rsquo;s demise or something would give him determination but it was always because of his hard work.</div>
<div>
<h2>They do not over-simplify things</h2>
<p>They do not over-simplify the character&rsquo;s powers and is almost incomprehensible but if you allot much time thinking about it, you&rsquo;d understand it soon. Their abilities are complex but you&rsquo;ll understand soon enough why.</p>
<p>JUST READ IT. THIS IS A SIGN. IT&rsquo;S A VERY GOOD MANGA AND IS VERY ENJOYABLE.</p>
<p>Here&rsquo;s a cute nobara, gojo, megumi and yuji moment for y&rsquo;all.</p>
<p style="text-align: center;"><img src="https://qph.cf2.quoracdn.net/main-qimg-4fe036aa6db541cc51c8a8734ff703e1-lq" alt="" width="602" height="300"></p>
</div>
</div>
</div>
</div>
</div>
</div>', CAST(N'2022-11-14T11:39:17.063' AS DateTime), N'0123450007', N'0123450003', N'approved', N'1974732339', N'https://sportshub.cbsistatic.com/i/2022/10/05/5ced0b0f-1242-48f8-9576-3ab88ef0d613/jujutsu-kaisen-sukuna-return-cliffhanger-manga-spoilers.jpg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (4, N'When a smart guy finds a notebook giving him power over death', N'<p>So I&rsquo;m a little late to the party as Death Note is an anime that first aired in 2006. Strangely enough that was the year I was watching a shit ton of anime yet this one passed me by. Anyways, it&rsquo;s on Netflix and has been for a while so I thought I&rsquo;d give it a go.</p>
<p>Death Note is the story of a guy, Light (that&rsquo;s his name), who finds a notebook dropped by a god of death. If a name is written in the notebook the person whose name is written will die. There&rsquo;s a whole bunch of rules to this and what not, but that&rsquo;s the premise. Light takes on the alias of Kira and starts using this notebook to murder criminals all over the world in an attempt to end crime and bring about a new era of peace and prosperity with himself as the god of justice. At the same time the authorities bring in a genius detective, L (that&rsquo;s his name), to help catch Kira. What follows is part cat and mouse, part chess game, and part Holmes Vs Moriarty.</p>
<p>It&rsquo;s worth pointing out I watched Death Note with English dubbing because it&rsquo;s actually very good quality and&hellip; OH DEAR GOD L IS PLAYED BY LIEUTENANT GAETA!</p>
<p>So I&rsquo;m a little late to the party as Death Note is an anime that first aired in 2006. Strangely enough that was the year I was watching a shit ton of anime yet this one passed me by. Anyways, it&rsquo;s on Netflix and has been for a while so I thought I&rsquo;d give it a go.</p>
<p>Death Note is the story of a guy, Light (that&rsquo;s his name), who finds a notebook dropped by a god of death. If a name is written in the notebook the person whose name is written will die. There&rsquo;s a whole bunch of rules to this and what not, but that&rsquo;s the premise. Light takes on the alias of Kira and starts using this notebook to murder criminals all over the world in an attempt to end crime and bring about a new era of peace and prosperity with himself as the god of justice. At the same time the authorities bring in a genius detective, L (that&rsquo;s his name), to help catch Kira. What follows is part cat and mouse, part chess game, and part Holmes Vs Moriarty.</p>
<p>It&rsquo;s worth pointing out I watched Death Note with English dubbing because it&rsquo;s actually very good quality and&hellip; OH DEAR GOD L IS PLAYED BY LIEUTENANT GAETA!</p>
<p style="text-align: center;"><img src="https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/large/800/Light-Yagami.Death-Note.webp" alt="" width="800" height="440"></p>
<p style="text-align: left;">L is characterised as very much the eccentric. He&rsquo;s a genius and thinks both inside and outside the box but has so many distracting quirks that it&rsquo;s often easy to forget he&rsquo;s the world&rsquo;s greatest detective. Honestly from the way he sits, to the fact that he clearly never sleeps, to the fact that he is always eating sugary snacks&hellip; He&rsquo;s either insane or it&rsquo;s all an act to distract everyone around him. He&rsquo;s probably just insane. He&rsquo;s also a joy to watch as he&rsquo;s the only character that operates on Light&rsquo;s level and it makes for some brilliant deductive reasoning, not to mention banter between the two. There is a strange hypocrisy in L though. I have to wonder if he too is a bit of a psychopath. He clearly sees Kira as evil and recognises the need to catch the murderer, but he also clearly believes himself above the law and often breaks the law in order to catch Kira. L is probably the most fascinating character of the series. He latches onto Light as the prime suspect because he has no other suspects and the show quickly becomes a sort of witch hunt. Nothing Light can do dissuades L from believing he is Kira.</p>
<p style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://steamuserimages-a.akamaihd.net/ugc/1684871397695256220/8466951DDF1050149598DFA8432EE1CB7E1B2378/?imw=512&amp;&amp;ima=fit&amp;impolicy=Letterbox&amp;imcolor=%23000000&amp;letterbox=false" alt="" width="512" height="512"></p>
<p>So it should be obvious by now that I really enjoyed Death Note&hellip; But it&rsquo;s me and you might have realised by now that I have issues with everything. So here we go. Some of the leaps in logic and deductive reasoning are completely beyond the realms of the realistic. It&rsquo;s hard to go into specifics without spoilers but I&rsquo;ll just say L sometimes figures out things that he really shouldn&rsquo;t be able to without having knowledge of the Death Note&hellip; which he doesn&rsquo;t. He&rsquo;s actually not the only character who does it and it sometimes feels like the weave of plans formulated by Light and L can only be solved by these insane leaps of logic. Maybe I was just overthinking things and I should have just accepted it, but I was sometimes left thinking &ldquo;How the fuck did he figure that out?&rdquo;</p>
<p>Secondly I feel I need to address the inconsistency in Light&rsquo;s character. Light is a psychopath but only while he has possession of the Death Note. Now I know it&rsquo;s meant to show that power corrupts and all that&hellip; but that isn&rsquo;t the way it works. If Light is a psychopath, he is a psychopath whether he has a magical note book or not.</p>
<p>I have one more gripe but I can&rsquo;t talk about it without MASSIVE SPOILERS&hellip; so I&rsquo;ll put it down at the end.</p>
<p>Overall I enjoyed Death Note. I thought it fun and clever with plenty of interesting characters and twists. However I just couldn&rsquo;t overlook some of its flaws. I give it 3 stars.</p>
<p>OK. Conclusion done so it&rsquo;s time for my biggest issues with the story.&nbsp;<strong>SPOILERS!!!!&nbsp;</strong>You have been warned.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://www.robjhayes.co.uk/wp-content/uploads/2016/12/spoiler_alert_300_w2-150x150.jpg" alt="" width="150" height="150"></p>
<p>For me the show lost all urgency about two thirds of the way in when Light manipulates events into killing L. The entire show had been built around the cerebral battle between the two of them and then it was over. Light had won. Fair enough&hellip; but the show wasn&rsquo;t over. It continued with Near (L&rsquo;s successor) taking the place of world&rsquo;s greatest detective. Near felt like a pale copy of L and I never connected with him like I did with L. Essentially the show moves on to a new stage with Kira being in control and Near struggling to catch him&hellip; but I kinda stopped caring.</p>
<p>Then there&rsquo;s the ending. Maybe my own expectations were a problem here but I expected it to be&hellip; better. More intelligent. It boils down to Light trusted someone else and they weren&rsquo;t as smart as him and Near catches Light through this other character. It was very unsatisfying and mostly because I honestly expected L to reappear after somehow faking his death and outsmart Light for the final time.</p>
<p>The final third of the show dragged out and led to a completely unsatisfying conclusion with characters I simply didn&rsquo;t care about. It felt like one of those detective TV shows that goes on too long and forgets what made it good in the first place. By then Light had become a tired character and L&rsquo;s replacement was all sorts of meh.</p>', CAST(N'2021-01-24T19:13:40.000' AS DateTime), N'0123450007', N'0123450009', N'approved', N'1421597713', N'https://www.robjhayes.co.uk/wp-content/uploads/2016/12/deathnote.jpg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (5, N'Biển cả, Hải tặc và Tự do', N'<p>N&oacute;i lu&ocirc;n l&agrave; thế n&agrave;y, vẽ truyện Shounen b&igrave;nh thường kh&ocirc;ng hề dễ, tưởng tượng b&acirc;y giờ bạn vẽ nổi một ph&ocirc;ng h&igrave;nh đ&atilde; kh&oacute; lắm rồi, giờ nh&acirc;n số việc đ&oacute; với số trang v&agrave; lặp lại tất cả mỗi tuần. Cũng v&igrave; thế c&oacute; qu&aacute; nhiều t&aacute;c phẩm khi phải chạy trong thời gian d&agrave;i, thường sẽ bị giảm nặng chất lượng do cạn chất x&aacute;m, nhiều bộ kh&aacute;c th&igrave; phải l&ugrave;i cả mật độ ra, chuyển sang những tạp ch&iacute; &iacute;t người động tới hơn, c&ograve;n c&oacute; bộ th&igrave; rơi lu&ocirc;n v&agrave;o t&igrave;nh trạng hiatus kh&ocirc;ng thấy tương lai. Nhưng&hellip;ở tr&ecirc;n đỉnh của danh vọng, th&aacute;nh Oda tồn tại.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blognhanpham.com/wp-content/uploads/2021/02/review-manga-one-piece-1.jpg" alt="" width="800" height="595"></p>
<p>One Piece đến giờ vẫn giữ được v&agrave; c&oacute; thể đ&atilde; vượt xa cả sự nổi tiếng v&agrave; nội dung hồi đầu n&oacute; ra mắt. Với nội dung đơn giản ban đầu chỉ l&agrave; một thằng đần n&atilde;o cao su đi t&igrave;m đo&agrave;n vi&ecirc;n để trở th&agrave;nh vua hải tặc, trở th&agrave;nh bộ manga với thế giới rộng lớn bậc nhất (m&agrave; c&ograve;n kh&ocirc;ng hi sinh chiều s&acirc;u).</p>
<p>C&oacute; lẽ một trong những thứ ấn tượng đầu ti&ecirc;n bạn sẽ thấy khi đọc One Piece, nhất nếu khi bạn như t&ocirc;i v&agrave; vừa đ&atilde; c&agrave;y hết cả hơn ngh&igrave;n chap trong một l&uacute;c, l&agrave; việc chất lượng art kể cả trong tưng kia thời gian vẫn rất tốt. Kh&ocirc;ng trong một trang n&agrave;o m&agrave; art của Oda m&agrave; c&oacute; thể gọi l&agrave; trung b&igrave;nh được cả, đặc biệt nếu nh&igrave;n mấy cảnh trọng t&acirc;m, c&aacute;c trận đ&aacute;nh, cảnh tượng n&oacute; c&ograve;n mang nhiều sức sống v&agrave; chuyển động hơn cả nhiều anime h&agrave;nh động.</p>
<p>&Agrave; m&agrave; vừa li&ecirc;n quan vừa kh&ocirc;ng, t&ocirc;i đ&atilde; n&oacute;i tạo h&igrave;nh của mọi thứ trong one piece thực sự tuyệt vời chưa. Tất cả đều c&oacute; thể ngay lập tức nhận ra, tất cả c&aacute;c địa danh, từ nh&agrave; h&agrave;ng m&agrave; Sanji từng lắm, từ ng&ocirc;i l&agrave;ng Vua Roger bị xử tử, đến cả ngục Impel Down, mỗi nơi đều đặc trưng, đậm sắc c&aacute;i chất ri&ecirc;ng của bản th&acirc;n, y&ecirc;n b&igrave;nh, n&aacute;o loạn đến cả &acirc;m u, kh&ocirc;ng c&oacute; một cảm gi&aacute;c n&agrave;o m&agrave; Oda kh&ocirc;ng thể truyền tải qua mực giấy.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blognhanpham.com/wp-content/uploads/2021/02/review-manga-one-piece-2.jpg" alt="" width="800" height="384"></p>
<p>Tất nhi&ecirc;n đ&oacute; l&agrave; c&ograve;n chưa tới c&aacute;c nh&acirc;n vật, giờ t&ocirc;i th&aacute;ch bạn t&igrave;m được t&aacute;c phẩm n&agrave;o kh&aacute;c m&agrave; c&oacute; những nh&acirc;n vật c&oacute; thể dễ nhận thấy ngay tức khắc như OP. N&oacute;i thế l&agrave; bạn c&oacute; thể hiểu rằng truyện được đầu tư thế n&agrave;o, với số lượng nh&acirc;n vật chắc đ&atilde; nhất nh&igrave; M-a, nhưng chắc chẳng c&oacute; ai bị quần ch&uacute;ng ho&aacute;, điều n&agrave;y n&oacute; c&ograve;n được phản &aacute;nh r&otilde; hơn nếu ta nh&igrave;n v&agrave;o c&aacute;i thứ xuất sắc nhất của phim, thế giới.</p>
<p>Worldbuilding gồm world, phần thế giới, v&agrave; building, c&aacute;ch t&aacute;c giả tiết lộ thế giới cho người đọc. Thế giới của Onepiece rộng lớn thế n&agrave;o th&igrave; chắc ai cũng biết rồi, nhưng nếu đặt cạnh trước những bộ như Fullmetal Alchemist hay Hunter x Hunter th&igrave; n&oacute; c&oacute; thể k&eacute;m cạnh nhiều tại chiều s&acirc;u. D&ugrave; thế, thứ m&agrave; theo t&ocirc;i, khiến thế giới One Piece ấn tượng kh&ocirc;ng phải l&agrave; c&aacute;i chiều s&acirc;u, dăm ba mấy c&aacute;i dảk d&ecirc;p, thứ thực sự quan trọng l&agrave; c&aacute;c nh&acirc;n vật gắn liền với ch&uacute;ng.</p>
<p>C&aacute;c sự kiện của One Piece kh&ocirc;ng nhiều khi thực sự hiếm khi li&ecirc;n quan tới c&aacute;i đ&iacute;ch đến cuối c&ugrave;ng, kho b&aacute;u OP. Thay v&agrave;o đ&oacute;, ch&uacute;ng thường xảy ra v&igrave; c&aacute;c mối quan hệ của c&aacute;c nh&acirc;n vật với những v&ugrave;ng đất kia, Sanji l&agrave; con trai của Judge, arc đảo b&aacute;nh ra đời, sự nghi ngờ của Nami tới những thứ c&ocirc; chưa thấy, arc đảo tr&ecirc;n trời v&igrave; thế m&agrave; tồn tại. Kể cả ngay trong diễn biến của một phần, cũng c&oacute; h&agrave;ng loạt m&acirc;u thuẫn được sinh ra, kh&ocirc;ng chỉ v&igrave; kẻ phản diện m&agrave; cả do t&acirc;m l&yacute; của cả băng trước c&aacute;c kẻ phản diện.</p>
<p>Mọi thứ trong đ&acirc;y kh&ocirc;ng phải l&uacute;c n&agrave;o l&agrave; thấy c&oacute; chuyện l&agrave; lao v&agrave;o đập nhau cho xong, đ&ocirc;i khi họ cần thay đổi cả ch&iacute;nh bản th&acirc;n, bạn xem bao nhi&ecirc;u shounen kh&aacute;c dạy rằng đ&ocirc;i khi ta n&ecirc;n&hellip; chạy, v&agrave; c&oacute; bao nhi&ecirc;u anime kh&aacute;c ph&aacute;t triển th&ecirc;m nữa từ c&aacute;i đ&oacute;.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blognhanpham.com/wp-content/uploads/2021/02/review-manga-one-piece-3.jpg" alt="" width="800" height="438"></p>
<p>C&oacute; hai thứ lời ch&ecirc; t&ocirc;i thường coi l&agrave; x&agrave;m loz mỗi khi nghe người kh&aacute;c đ&aacute;nh gi&aacute; One piece, rằng n&oacute; trẻ con, biết thừa main sẽ thắng, v&agrave; hai l&agrave; n&oacute; lan man. Tất nhi&ecirc;n đ&acirc;y kh&ocirc;ng phải t&aacute;c phẩm ho&agrave;n hảo, kể cả t&ocirc;i cũng thấy đảo b&aacute;nh kh&aacute; yếu so với c&aacute;c phần trước. Nhưng kể cả khi &ldquo;yếu&rdquo; n&oacute; cũng đủ vượt xa c&aacute;i mức &ldquo;ổn&rdquo; b&igrave;nh thường.</p>
<p>Về c&aacute;i lời ch&ecirc; về tone của c&acirc;u chuyện. N&oacute;i lu&ocirc;n n&agrave;y, bạn phản &aacute;nh x&atilde; hội đen tối thế n&agrave;o đi chăng nữa, m&agrave; l&agrave;m nội dung kh&ocirc;ng ra hồn, th&igrave; cũng vẫn l&agrave; r&aacute;c th&ocirc;i. Oda c&oacute; động tới c&aacute;c vấn đề &ldquo;người lớn&rdquo; hơn trong đ&acirc;y, nhưng thường kh&aacute; &iacute;t v&agrave; hiếm khi động tới kiểu mấy c&aacute;i cực đoan. Nhưng chẳng phải c&aacute;i đấy đ&aacute;ng n&oacute;i hơn sao, lồng gh&eacute;p được những yếu tố đ&oacute; m&agrave; kh&ocirc;ng khiến mọi thứ ph&aacute; lu&ocirc;n c&aacute;i kh&ocirc;ng kh&iacute; của cả bộ truyện chẳng hề dễ.</p>
<p>Hơn nữa, những c&aacute;i đen tối như c&aacute;c bạn n&oacute;i th&igrave; nhiều khi chẳng c&oacute; g&igrave;, ch&uacute;ng phản &aacute;nh nhưng to&agrave;n ảo tưởng ho&aacute; c&acirc;u chuyện, đ&ocirc;i khi tới mức lố bịch, khiến t&ocirc;i c&ograve;n phải cười tr&ecirc;n c&aacute;ch trước c&aacute;i c&aacute;ch suy nghĩ c&oacute; vấn đề của t&aacute;c giả, rồi khi n&oacute;i ra to&agrave;n lấy mấy c&aacute;i m&aacute;c dảk che cho sự thiếu thốn về nội dung. Tiện đ&acirc;y lu&ocirc;n giải th&iacute;ch cho c&aacute;i việc nh&acirc;n vật ch&iacute;nh lu&ocirc;n chiến thắng, sao giờ ai cũng muốn mọi thứ edgy nhất c&oacute; thể thế.</p>
<p>Tưởng tượng build up cả mấy chục tập rồi l&agrave;m một c&aacute;i twist v&ocirc; căn cứ rồi tưởng thế l&agrave; ngầu, một lần nữa, quan trọng phải l&agrave; c&aacute;ch xử l&yacute; những m&acirc;u thuẫn trong cả nội bộ v&agrave; giữa hai phe đối lập c&oacute; tốt hay kh&ocirc;ng (thứ m&agrave; t&ocirc;i đ&atilde; khen đấy khen để b&ecirc;n tr&ecirc;n rồi), chứ ai từng coi kỹ &iacute;t nhất một t&aacute;c phẩm bất kỳ rồi th&igrave; cũng biết việc nh&acirc;n vật ch&iacute;nh kiểu g&igrave; thắng l&agrave; chuyện chẳng thể b&agrave;n c&atilde;i.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blognhanpham.com/wp-content/uploads/2021/02/review-manga-one-piece-4.jpg" alt="" width="527" height="527"></p>
<p>Giờ tới c&aacute;i lời ch&ecirc; lan man. T&ocirc;i kh&ocirc;ng hay lấy số liệu lung tung ra đ&acirc;u nhưng bạn nghĩ một bộ truyện lan man chạy được l&acirc;u tới chừng n&agrave;y &agrave;. Lan man l&agrave; g&igrave;, l&agrave; khi c&acirc;u chuyện c&oacute; cảm gi&aacute;c bị k&eacute;o d&atilde;n kh&ocirc;ng cần thiết, nhưng c&oacute; thực sự bảo giờ Oda cố tr&egrave;n những chi tiết kh&ocirc;ng cần thiết v&agrave;o cốt truyện.</p>
<p>Mọi v&ugrave;ng đất, h&ograve;n đảo trong đ&acirc;y đều c&oacute; một thứ g&igrave; mới cho người đọc, trong hơn cả 1000 chap t&ocirc;i đọc, t&ocirc;i chưa thấy một l&uacute;c n&agrave;o m&agrave; c&oacute; những chi tiết n&oacute; bị lặp cả. C&aacute;i n&agrave;y được x&acirc;y dựng tr&ecirc;n cơ sở c&aacute;i trước tạo n&ecirc;n một chuỗi chuyện kh&oacute; c&oacute; thể n&agrave;o ng&aacute;n được.</p>
<p>Tổng kết lại, one piece l&agrave; một t&aacute;c phẩm hay m&agrave; thường bị qu&aacute; nhiều thượng đẳng tập sự ch&ecirc;, n&oacute; l&agrave; một t&aacute;c phẩm kể cả sau mấy trăm bộ, deep đến mấy, khi quay lại t&ocirc;i vẫn c&ograve;n thừa chữ để n&oacute;i về n&oacute;, nhưng thời gian c&oacute; hạn, n&ecirc;n hiện tại, h&atilde;y cứ hiểu rằng One Piece xứng đ&aacute;ng với điểm 9/10.</p>', CAST(N'2022-11-14T11:50:53.567' AS DateTime), N'0123450007', N'0123450003', N'approved', N'1569319014', N'https://blognhanpham.com/wp-content/uploads/2021/02/review-manga-one-piece.jpg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (6, N'Big Mom Vs Strawhat Pirates; Is this the end for Thousand Sunny?', N'<p>This image right here could sum up this chapter. Just look at Charlotte Linlin here, in all her glory, riding her majestic thunder cloud; sword in hand and the blaze of her own freaking sun behind her. This my friends is the strength of a Yonkou and I for one completely underestimated her.</p>
<p>There is no way I can see Luffy taking her out 1-v-1 without some form of external help. Big Mom is legit the scariest thing in One Piece.</p>
<p>Now before I go full fan-girl, lets take a step back and start from the beginning of this chapter.</p>
<h3>MOON-LION CARROT vs LORD DAIFUKU&rsquo;S GENIE</h3>
<p>The chapter starts off from where the previous chapter ended. Carrot is in her awe-mazing Sulong form which literally translates to moon-lion in kanji (or so I am told by mangastream). The moon pretty much gives her this over-powered ability where she becomes a one-man army and she is wrecking ships left, right and centre.</p>
<p>Carrot has shown that not only is she cute and strong but she has brains to go along with it. She didn&rsquo;t just tag-along with the Straw-hats, she actually is an asset they definitely needed in this situation.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://78.media.tumblr.com/b1d0b47d2bccf070521c47ef8da6a8f5/tumblr_p1dr1nUobT1v2pt3so5_1280.jpg" alt="" width="796" height="438"></p>
<p>Elegantly and smoothly, this little rabbit stole all the helms of the fleet that was looking to take-out the Thousand Sunny and it wasn&rsquo;t without risk as going &ldquo;Full-Moon&rdquo; (my term for becoming a Moon-Lion) a Mink can lose its mind and end up over-exerting and killing one-self.</p>
<p>Daifuku summoned his genie, as granted to him by his lamp-lamp fruit. Unfortunately, this genie has a mind of its own and follows instructions very loosely. He ends up hurting Daifuku&rsquo;s own crew-mates in his chase to stop Carrot. And the whole time, Daifuku has to stand there looking silly, rubbing himself.</p>
<p>Brook does come into save her from herself and takes her away from the light of the moon. If she&rsquo;s not in its view, she can revert back to her normal self. He also helps take out a few ships as well thanks to his super-awesome ice-sword abilities.</p>
<h3>SANJI&rsquo;S HEAVENLY CAKE</h3>
<p>Now we know Sanji is a top notch cook but have we every actually considered that he might actually be the best in the world.</p>
<p>You see, Sanji is confident in his ability to woo Big Mom over with the deliciousness of his cake whilst Bege wants to use the opportunity to poison/blow her up. The plan was after all to defeat a Yonkou right?</p>
<p>Sanji however isn&rsquo;t having it. I doubt he see&rsquo;s Big Mom as a lady but he also has the&nbsp; whole, &ldquo;I must feed those who want to eat&rdquo; and I admire him for it but seriously dude, this is a good opportunity. Logically speaking, I would be with Bege on this one. But this is One Piece and I know Sanji can do it.</p>
<p>In fact, he shoves a bit of cream in Bege and he almost dies out of pure bliss. I actually can&rsquo;t wait to see how Big Mom will react to eating this cake.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://78.media.tumblr.com/aabc76b54b99b7b6e3907fa2b3bad521/tumblr_p1cukcx2lV1th8tuuo4_1280.png" alt="" width="641" height="353"></p>
<h3>BIG MOM IS HERE!!!</h3>
<p>This isn&rsquo;t a drill, I repeat&hellip; This isn&rsquo;t a drill! BIG MOM IS ACTUALLY FRICKIN HERE. She&rsquo;s landed right in front of Nami. This is it. They&rsquo;re going to have to do something or force being eaten. Jinbei isn&rsquo;t scared of shit, we&rsquo;ve seen how bad-ass he is but even he thinks they need to abandon ship.</p>
<p>Big Mom has gone beyond what anybody has lived to see. She has never lasted so long without fulfilling her craving according to Peros. We are heading into unknown territory in regards to Big Mom here. I mean I didn&rsquo;t even realise her hat can turn into a bad-ass sword.</p>
<p>She might do anything. She might break into song and dance or start eating the earth itself. But personally, I think she&rsquo;ll become weaker, the longer this goes on. She might crash after she gets the cake Sanji has prepared for her perhaps.</p>
<p>I&rsquo;m really hoping we get to see Bropper and Jinbei shine here. Brook, Nami and Carrot have done their bit.</p>
<p><em>This chapter gave me the chills and not many chapters do that. Not much was revealed in terms of plot progression and we didn&rsquo;t get to see Luffy but it was epic despite so an almost but not quite 9 for me.</em></p>', CAST(N'2021-05-13T21:15:44.000' AS DateTime), N'0123450007', N'0123450003', N'approved', N'1569319014', N'https://fandom.vn/wp-content/uploads/2019/08/big-mom.jpg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (7, N'Sanji in Wonderland; The Vinsmoke Brothers', N'<h3>SANJI IN WONDERLAND</h3>
<p>I&rsquo;ll admit the title seems weird and a lot of people thought it was one of those one off chapters that explore something that doesn&rsquo;t actually follow the main story. They were mistaken as the comic strip they mention is very relevant although the title still put me off.</p>
<p>I guess it is safe to assume now that the &lsquo;Alice in Wonderland&rsquo; theory that has been on the books for a while now is coming true. All the cards are in place and we&rsquo;re having a story/theme based on the fairy tale.</p>
<p>Sanji seems to be our Alice as he is being taken to see the &lsquo;Queen of Hearts&rsquo;. There are many references here that correspond to &lsquo;Alice in Wonderland&rsquo;. Let&rsquo;s have a look shall we?</p>
<ul style="list-style-type: disc;">
<li>There is a Tea-Party Scheduled.</li>
<li>We have a strange ship that sings and is alive.</li>
<li>Chess pieces carrying spears that look like hearts. A reference to the playing cards in &lsquo;Alice&rsquo;.</li>
</ul>
<p>Now let&rsquo;s look at the different characters involved that resemble those from &lsquo;Alice in Wonderland&rsquo; who could be involved in this plot.</p>
<ul style="list-style-type: disc;">
<li>Big Mom = Queen of Hearts</li>
<li>Pekoms = Mock Turtle/Gryphon</li>
<li>Tomago = Humpty Dumpty</li>
<li>Absalom = Cheshire Cat</li>
<li>Lola/Sister = TweedleDee/TweedleDum (will talk more about this later)</li>
<li>Carrot = White Rabbit</li>
</ul>
<p>As you can see, there are many references there and many more that I have not mentioned as it is obvious where this is going. I could go into detail about Big Mom&rsquo;s similarities to the Queen of Hearts considering her short temper and love for desserts. You could even mention how Absalom can disappear much like the C</p>
<p>heshire cat and how there have been many references to him recently. He is even the reason Sanji has ended up where he is. He made the identification.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://66.media.tumblr.com/4a47961486d85fb636bb321dfd52a70d/tumblr_o6kd09s0yI1swtg25o2_1280.jpg" alt="" width="750" height="417"></p>
<h3>THE GERMA 66 COMIC STORY</h3>
<p>I believe this comic story is very relevant to the plot somehow. Oda wouldn&rsquo;t randomly add it in there and even base the title of the chapter on such a thing. It was a propaganda comic to promote the marines as heroes and the Germa 66 were seen as the big bad villains. What the Germa 66 did or why the marines required a comic to make them look bad is not known yet but they must have had a reason right?</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://67.media.tumblr.com/0f888e31ffde128919a5def7e98fcb39/tumblr_o6k8rpcGEc1th8tuuo2_400.png" alt="" width="340" height="278"></p>
<p>Were the public opinion of marines falling and the Germa 66 seen as heroes amongst parts of the world? Is their opinion now frowned upon due to this comic strip? Vito seems to be a huge fan of the organisation and I believe the Fire-Tanks may only be involved in this due to the Germa 66 alliance that may come out of all of this.</p>
<p>It was interesting to note that the logo used to represent the hero of the story was a combination of the Marine emblem and the Word Government logo. With the seagull on the head of Sora, the protagonist of the comic, I can&rsquo;t help but feel Sengoku was the basis for Sora. The robot could have been the basis of creating the Pacifista&rsquo;s or the initial transformation of Kuma into a cyborg.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://i0.wp.com/www.anivision.org/wp-content/uploads/2010/07/Sengoku-and-Garp.jpg" alt="" width="626" height="323"></p>
<h3>THE SANJI SITUATION</h3>
<p>Sanji is still being a stubborn bastard and refusing to get comfortable and friendly around those that have been charged with bringing him in but they&rsquo;re treating him like an honourable guest rather than keeping him under key and chain like Caesar Clown.</p>
<p>Vito even stopped on of his crewmates from attacking him after Sanji completely disrespected him. Interesting to note even this new character introduced in Bege&rsquo;s crew is based off one of the five mafia families.</p>
<p>It wasn&rsquo;t until the Lola lookalike entered that Gotti calmed down which shows she has more authority over them. This would reaffirm the notion that she is one of Big Mom&rsquo;s daughters and considering Sanji noted the resemblance, it is safe to assume Lola is definitely Big Mom&rsquo;s daughter.</p>
<p>It also seems Sanji is over Purin&rsquo;s beauty and is refusing the marriage again. I guess he can calm his nerves when the beauty is not actually visible to him. I still don&rsquo;t know how this will play out but it seems clear Purin is not happy and Sanji has a duty to every woman to ensure she is not in a position of distress. He will save her but I&rsquo;m not sure how this will work.</p>
<h3>SUNNY ON THE SUNNY</h3>
<p>The Strawhats and the Minks are struggling to survive the heatwave with all the food gone. This whole scene was hilarious. I mean just looking at mummified Luffy, Brook talking about becoming a &lsquo;Mummy&rsquo; and talks of using Chopper as emergency food source.</p>
<p>And then Luffy getting poisoned; that was hilarious. The whole immunity to poison comes in again to make the fight with Magallen relevant. Otherwise Luffy would have died by eating the poisonous skin of a fish. Chopper in this scene stole the show for me though. He&rsquo;s there crying that Luffy would die but kept claiming how tasty the fish was.</p>
<p>Also, the whole don&rsquo;t go into the light situation with Luffy was too funny. I was in stitches reading this chapter.</p>
<h3>ENTER THE VINSMOKES!</h3>
<p>The Sunny finally enters Big Mom&rsquo;s territory and Chopper&rsquo;s eyes light up at the cotton-candy snow that has just started landing upon them. Pekoms has the stupid idea of disguising the Strawhats, despite the fact it is obvious from their ship that they&rsquo;re the Strawhat Pirates.</p>
<p>With the amazing technology of underwater motion detector snails, the Strawhats were detected immediately; so much for sneaking in. The greatest thing about this whole situation was the fact it wasn&rsquo;t Big Mom who intercepts them but the Germa 66 and we get to see the first of the Vinsmokes. I am assuming this is a brother of Sanji. I mean the resembelance and the curly eye-brow gave it away, although we only see the one.</p>
<p>Now whether he&rsquo;s Ichiji, Neji or Yoji&hellip; only time will tell but he seems quite young so a similar age to Sanji I would say. It will be hilarious should Luffy and Chopper mistake him for Sanji. Fortunately Nami will figure it out.</p>
<p>Interesting to note, the whole ship is a huge den-den mushi. I wonder what it is capable of.</p>', CAST(N'2021-06-17T20:15:40.000' AS DateTime), N'0123450007', NULL, N'pending', N'1569319014', N'https://gamek.mediacdn.vn/133514250583805952/2021/11/3/san1-1635937932464879485548.jpeg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (8, N'End of the World!!!', N'<h3>Broken Dreams</h3>
<p>I&rsquo;m extremely glad he&rsquo;s not doing the&nbsp;<em>&ldquo;Hell yeah! Kill &lsquo;em all! Destroy every single one of them: civilians, pregnant women, little children, babies&hellip;yeah, man! Kill! Kill! Kill! Woooh yeah! Die die die! Serves you right, fucking losers!&rdquo;</em>&nbsp;kind of swaggering triumphalism of the video game player on a murderous rampage, complete with fist pumping and maniacal laughter.</p>
<p>So many readers on the fan boards (of a certain age range and gender, might I add) are all so cocky and cavalier about Eren destroying the world. This kind of conceited, gloating attitude to mass murder is a result, I believe, of a&nbsp;<strong>desensitization to violence</strong>. Just because we&rsquo;re talking about a fictional world with fictional characters we think it&rsquo;s perfectly fine to kill everyone in sight, just like a mindless shoot-em-all type of video game. We don&rsquo;t know these people, who cares if they suffer? Kill them all and be truly free! It&rsquo;s just a fucking manga anyway! And so on.</p>
<p>But Isayama shows his skill as a storyteller once again. It&rsquo;s so<strong>&nbsp;easy to drop a bomb on nameless faces and faceless names</strong>, but he makes sure we get a good glimpse of what is happening down below. The little boy we saw in his memory shards, who appears as a pickpocket and is saved by Levi when they arrive at Marley, is seen once again. This time he&rsquo;s give a name, and we get to know the reason why he&rsquo;s stealing. As wise readers we know that he has to steal far, far more than he has in order to afford decent housing in a country that welcomes refugees, but this kid is too young to know the details and is just dreaming of a better life.&nbsp;</p>
<p>It is this kid and his big brother, already missing a left hand as punishment for petty thievery, that are crushed&mdash;very graphically at that&mdash;under the weight of the wall titan&rsquo;s foot. They are crushed like cockroaches when seen from a drone&rsquo;s perspective. But we know these kids had names and lives and emotions and thoughts and dreams and aspirations. Through them we&nbsp;<strong>feel the tragedy of an indiscriminate massacre</strong>.&nbsp;</p>
<p>Isayama&rsquo;s great talent is&nbsp;<strong>showing us what is one the other side</strong>. One of the major reasons I&rsquo;ve grown so hooked on the&nbsp;<em>Attack on Titan</em>&nbsp;manga is that &ldquo;the enemy&rdquo; aren&rsquo;t just evil aliens from outer space or irredeemable psychopath Nazi-type criminals or some easily hateable bunch of wicked people that populate mainstream films and manga. In AoT-verse the enemy is more complicated: they are countries filled with ignorant people, deeply flawed human beings who turn this ignorance into fear, which grows into hatred, and ultimately ends in tragedy. We&rsquo;ve seen the unscrupulous politicians taking advantage of this ignorance, manipulating public perception for their own self-serving ends. In many countries it is the people who elect the politicians. In other words,&nbsp;<strong>the enemy is us</strong>.</p>
<p>I wish Isayama took more time in showing us the lives of the Marleyan Eldians and also the Marleyans themselves. I would have liked to learn more about Magat&rsquo;s family, for instance, and also about the group of (non-Eldian) progressives that are fighting for Eldian human rights. Who are these people? What are their names? What made them take up the fight on behalf of Eldians? Even this group will be crushed under the weight of the marauding wall titans. How ironic, spending your life advocating for the rights of a people whose god (Eren) ends up killing you in the end.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://qph.cf2.quoracdn.net/main-qimg-ad525cea8aaff6bbf2d157a25f4bec66-lq" alt="" width="602" height="430"></p>
<p>We&rsquo;ve seen a glimpse of Pieck&rsquo;s father, and also Reiner&rsquo;s and Gabi&rsquo;s. Reiner&rsquo;s mother in particular was emotionally manipulative and will never win the Mother of the Year award. But what about Falco&rsquo;s family? Their father, a freedom fighter who died for his beliefs, was mentioned briefly. He and his wife must have been kind people and competent parents, having done a great job in raising the good kids, Colt and Falco. Falco in particular has an incredible amount of empathy and emotional intelligence. We could only surmise that he grew up in a family environment that encouraged this kind of growth. But we don&rsquo;t really learn much about any of these people, who are all dead by now. Ignorance breeds fear, fear breeds hatred&hellip;</p>
<p>Once we put names to faces and learn about their lives, it is much easier to feel compassion for others. Our lack of empathy for victims of massacre and mass slaughter is because we don&rsquo;t know who these people are. What&rsquo;s worse, anyone big enough to feel compassion is derided by the rah-rah-massacre-yeah-kill-everyone group, who label them as bleeding hearts or wussies. I personally think it&rsquo;s pathetic how low some people can get, thoroughly enjoying the suffering of others, including small children.</p>
<p>In shoot-em-up fictional narratives, without much consideration we simply side with the protagonist (or person with the biggest gun) and consider everyone else to be&nbsp;<strong>collateral damage</strong>.</p>
<p>Isayama has done a good (albeit belated) job in showing us a&nbsp;<strong>glimpse of the lives of the people being crushed to death</strong>. It&rsquo;s barely enough for me, but I&rsquo;m infinitely glad that he tried.</p>
<p><strong>Eren&rsquo;s crisis of conscience is palpable</strong>. His suffering is immense, the self-hate unmistakable. He weeps openly, apologises profusely to his future victims. We see the depth of his suffering and his cry for help. His decision to do a full rumbling was not an easy one. He suffers greatly but, because he believes there is no other alternative, goes through with it anyway.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://hanasblog.beverlyclaire.com/wp-content/uploads/shingekinokyojin-chapter131-excerpt-01.jpg" alt="" width="755" height="542"></p>
<p>The above panel of a smiling child Eren looking above the dust clouds churned out by the marauding wall titans and calling it freedom can be tied to the last panel of him closing his eyes to the suffering down below. Founder Ymir sees it and he himself knows it is happening. This isn&rsquo;t freedom, nor is it heaven. It&rsquo;s hell on earth, and adult Eren understands this more than anyone. His childhood dream has been crushed, thus the mental suffering.</p>
<p>Yet this chapter has made it obvious that Eren still has a conscience, still has traces of humanity left in him. When (yes, when, not if) someone can come up with an alternative to a full rumbling, we can count on Eren to stop.&nbsp;</p>
<p>That someone, I&rsquo;ve always believed, is Armin. Eren himself had predicted it on that roof in Shiganshina:&nbsp;<strong>Armin will save the world. It&rsquo;s just a matter of time.</strong></p>
<h3>Armin and Annie</h3>
<p>Ah, these two! Aren&rsquo;t they cute? After Annie burst out of her crystal I was wondering why she and Armin didn&rsquo;t have a conversation. I mean, come on! He&rsquo;s been monologuing in front of her frozen form for four years and they have nothing to say to each other? Jesus.</p>
<p>Finally we see them talking in this chapter. It&rsquo;s always been obvious that Armin had a thing for Annie, all the way back during their cadet days. Eren accusing him of having feelings for her as a sign of being manipulated by Bertholdt&rsquo;s memories is patently untrue.&nbsp;<strong>Armin liked Annie even&nbsp;<em>before&nbsp;</em></strong><strong>he devoured Bert.</strong>&nbsp;It was nice that he finally got the chance to tell her at world&rsquo;s end. Not!</p>
<p>We can see Isayama&rsquo;s crazy aversion to romance here. The two&mdash;one is nineteen while the other is a stymied fifteen-year-old&mdash;come off sounding like a pair of third graders. It was really cute, the blushing they did. But c&rsquo;mon, Armin, just say it already! I like you, Annie. If Falco can say it to Gabi then so can you.</p>
<p>Yo aruani, you two might just end up being killed while trying to stop Eren. Go ahead, while you&rsquo;re both still alive, put your heart on your sleeve and out with it! You have nothing to lose, trust me.</p>
<p>It seems to me that Annie felt let down because she had wanted Armin to clearly, verbally express his affection for her. But since he clammed up instead she simply chose to leave. His stopping her was a good thing, but he goes on to discuss morality and his backpacking dreams instead.&nbsp;</p>
<p>Sigh. Since this is Isayama we&rsquo;re talking about, we won&rsquo;t get so much as a friendly hug. I suppose that&rsquo;s where us fanfic writers come in&mdash;ahaha!</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://hanasblog.beverlyclaire.com/wp-content/uploads/shingekinokyojin-chapter131-excerpt-02.jpg" alt="" width="790" height="560"></p>
<p>Annie points out that Armin&rsquo;s desire to have dialogue with his enemies as well as not giving up on dialogue with Eren is a result of his wanting to shrink from a fight, a form of&nbsp;<strong>conflict avoidance</strong>. It&rsquo;s a very perceptive comment, and also highlights the difference in their beliefs. For Annie, armed conflict is inevitable; for Armin, diplomacy should reign supreme. Which of these beliefs will triumph in the end will determine how the manga will go down in history. Will it be an ode to violence, or an ode to discourse? I&rsquo;m looking forward to how Isayama works everything out.&nbsp;</p>
<h3>Signs of Hope</h3>
<p>This chapter further hammers down my belief that Eren deliberately isolated and estranged his friends so that they&rsquo;ll go out of their way to stop him. He can&rsquo;t change his own actions as he&rsquo;s already seen himself doing it in the future, but they can change theirs.&nbsp;</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://hanasblog.beverlyclaire.com/wp-content/uploads/shingekinokyojin-chapter131-excerpt-04.jpg" alt="" width="842" height="830"></p>
<p>When the refugee kids were being crushed, Founder Ymir could be seen watching in the background. What is she thinking? Does she want this to happen? She might just be the key to solving the dilemma. Eren has given her freedom, so she&rsquo;s roaming the world as a free spirit I suppose.&nbsp;<strong>If he can go back in time to save her, then none of this would have happened in the first place.</strong></p>
<p>It&rsquo;s painful to see both Eren and Armin being very disappointed when they find out the true nature of the outside world. It&rsquo;s not just pretty landscape scenery out there, it&rsquo;s filled with horrible people and terrible situations. We always think of the &ldquo;other side&rdquo; in terms of the grass being greener, but once we find out the truth it can be a real letdown. Yet Armin&rsquo;s continuing hope to go to explore the world with Eren gives a hopeful note to the story in general.&nbsp;</p>
<p>The seagull that landed on the ship and looked Armin in the eye is most definitely a symbol of hope. Seagulls symbolise the ocean and seafaring. They&rsquo;re free, adventurous birds because they can fly a long range. I&rsquo;m sure it&rsquo;s an optimistic message for everyone. Armin sees the bird and has come up with an idea of what to do next. I&rsquo;ve been saying this for a long time now but I&rsquo;ll say it again: as Eren himself had predicted, it is Armin and not anyone else who will save the world.</p>', CAST(N'2022-02-17T08:30:33.000' AS DateTime), N'0123450007', NULL, N'pending', N'1646513843', N'https://fictionhorizon.com/wp-content/uploads/2022/01/main-qimg-0950d9e982b53578d780fb5efdd1c41a.jpg')
INSERT [dbo].[blogs] ([id], [title], [content], [posted_time], [author], [staff], [status], [ISBN], [thumbnail]) VALUES (9, N'Blade of Demon Destruction', N'<p>First and foremost, as the title suggests, there will be spoilers for the entirety of the Demon Slayer: Kimetsu no Yaiba series. This is a review about the manga, not the anime adaptation. The manga has been finished for almost 2-years at this point, but I know there are people who may stumble upon this only having watched the anime which is ongoing.</p>
<p>If you&rsquo;re interested in whether or not I liked it without getting into spoilers. The short version of this review is that I&rsquo;d give it a 3.5 out of 5, but expect the anime to be a 4.5 out of 5. I like the story, but there were some missed opportunities to make me love the story. The author seemed uninterested in several key plot threads which leads to an underwhelming conclusion that lacks the impressive visuals that ufotable has brought to the animation.</p>
<p>If you scroll past this image then you enter into spoiler territory.</p>
<h2>The Shonen Manga Grading Curve</h2>
<p>The mission of Words About Books is to read a lot and to read widely for the purpose of analyzing what works and what does not work in storytelling. We focus primarily on novels and short stories, but we also dabble in non-fiction and graphic novels as well. I&rsquo;ve been a fan of manga in particular for a very long time. With that said, I have a kind of complicated relationship with the western anime/manga consuming audience. I think there is a tendency among some readers to fetishize things from Japan, and by that I mean, to accord them some special credibility or status simply because they are &ldquo;exotic.&rdquo; I don&rsquo;t like the idea that its being from Japan is a determining factor in choosing whether or not to read a particular comic book.</p>
<p>When it comes to reviewing a graphic novel; however, I do think it is important to point out the conditions under which it is written. Especially when those conditions are very different from the usual books and short stories that we discuss on Words About Books. Most Shonen Manga is originally serialized and published in weekly or monthly magazines in Japan. Chapters of Kimetsu no Yaiba were usually 24-pages in length. That&rsquo;s 24-pages written, drawn, and inked by a single Mangaka (author/artist) and a small team of assistants, each week.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://ecdn.game4v.com/g4v-content/uploads/2021/01/kimetsu-no-Yaiba-manga-3-game4v.jpg" alt="" width="800" height="451"></p>
<p>All serialized fiction suffers from some of the same problems. There&rsquo;s filler, dropped plot threads, continuity errors, retcons, deus ex machina, etc., etc. Weekly manga magazines put their creators in a special kind of pressure cooker that exacerbates all of these problems. Pacing is all over the place. Retcons become legendary in-jokes amongst fans. To some extent, you have to ignore these things and just kind of enjoy the ride. It&rsquo;s understood among readers that manga authors who write themselves into the occasional hole may not have much time to skillfully dig themselves out. These are hazards of the medium and should be taken into consideration when comparing with stories developed in different environments.</p>
<p>I wanted to make it clear that I understand and accept many of these imperfections when I read manga. For me, what makes a good manga is a pay off that makes me forget about all the stumbles we took along the way. When it comes to Demon Slayer, Gotouge has a talent for plucking heart strings that let&rsquo;s the reader look past the frequent handwaving away of character development and pacing. At least, it does until the last 10 chapters or so. It becomes rapidly apparent that Gotouge wrote many checks that the conclusion was not going to be able to cash. Even with the shonen manga grading curve in mind, I still have some problems with the way Demon Slayer executes its story.</p>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://www.hiepsibaotap.com/wp-content/uploads/2020/05/DS_152-019.png.jpg" alt="" width="1033" height="754"></p>
<p>What makes Demon Slayer refreshing is its protagonist. Tanjiro Kamado is a gentle soul with a high level of emotional intelligence, impeccable manners, and an almost super human capacity for forgiveness and understanding. He encourages and uplifts everyone he meets, friend or foe. While other demon slayers fight with hate in their hearts, Tanjiro fights with sympathy for the human beings the demons once were. In many ways, it is his empathy that allows him to turn the tide in a centuries long stalemate between the Demon Slayers and the evil progenitor demon Muzan Kibutsuji.</p>
<h2>A Loosely Connected Anthology of Short Tragedies</h2>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blog.wordsaboutbooks.ninja/wp-content/uploads/2022/02/itssad.png" alt=""></p>
<p>The emotional core of the series is its main character Tanjiro Kamado. Tanjiro is from a family of humble charcoal sellers living in Taisho Era (Jul 30, 1912 &ndash; Dec 25, 1926) Japan. After an overnight trip into town, Tanjiro returns to find his family brutally slain. The sole survivor is his sister Nezuko, but Nezuko has been turned into a demon. Nezuko now possesses super human strength and healing abilities. She has lost all sense of self and attacks Tanjiro.</p>
<p>Tanjiro is begging Nezuko to come to her senses when a man with a katana shows up claiming to be a demon slayer and demands that Tanjiro stands aside. Tanjiro fights to protect his sister. The demon slayer easily forces Tanjiro aside, but is surprised to find the demon Nezuko step in to protect her older brother. The demon slayer senses something different about these two.</p>
<p>Nezuko, despite struggling at first, seems able to control her urge to consume human flesh. This is something that was once thought impossible for a demon. Tanjiro and Nezuko set off on a quest to join the demon slayers, and with their help, find a cure to Nezuko&rsquo;s affliction. If along the way they should happen to rid the world of the evil Kibutsuji Muzan, the progenitor of all demons, all the better.</p>
<p>The rest of the series will follow Tanjiro and Nezuko as they search for a cure. Along the way they will meet The Hashira, accomplished swordsmen and women who have mastered various breathing techniques that allow them to go toe-to-toe with the most powerful demons. They will do battle with The Twelve Kizuki, unfathomably powerful demons who have survived centuries of war with The Hashira.</p>
<p>What makes Demon Slayer refreshing is its protagonist. Tanjiro Kamado is a gentle soul with a high level of emotional intelligence, impeccable manners, and an almost super human capacity for forgiveness and understanding. He encourages and uplifts everyone he meets, friend or foe. While other demon slayers fight with hate in their hearts, Tanjiro fights with sympathy for the human beings the demons once were. In many ways, it is his empathy that allows him to turn the tide in a centuries long stalemate between the Demon Slayers and the evil progenitor demon Muzan Kibutsuji.</p>
<p>One of the reasons Demon Slayer has been such a mega hit is because of it&rsquo;s heightened emotional awareness in a genre that is overcrowded with manly men screaming and punching each other ever harder until the readers lose interest. But even this more emotionally complex take on a shonen battler starts to have diminishing returns after the formula is repeated too many times.</p>
<p>Every character in Demon Slayer has a tragic backstory. Now, I&rsquo;m afraid that you may have just read that previous sentence and understood it to mean &ldquo;a lot of characters in Demon Slayer have a tragic back story.&rdquo; Let me be very clear.&nbsp;<strong>Every named character in Demon Slayer: Kimetsu no Yaiba has a tragic back story.</strong></p>
<p>Demon Slayer story arcs follow a pattern:</p>
<ol style="list-style-type: decimal;">
<li>Introduce characters</li>
<li>Introduce conflict</li>
<li>Hint at tragic back story</li>
<li>Action</li>
<li>More back story</li>
<li>Climax of action</li>
<li>Climax of tragic back story</li>
<li>Pleasant reunion with relatives in afterlife to make it all better.</li>
</ol>
<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blog.wordsaboutbooks.ninja/wp-content/uploads/2022/02/deathmontage-664x500.png" alt=""></p>
<p>Sometimes the tragic background fits neatly into the story. Sometimes it does not. Sometimes you will get a whole chapter that is nothing but the tragic back story of a villain that was introduced a few chapters earlier. Sometimes you couldn&rsquo;t care less about the demon&rsquo;s life story and you just want to know if a main character survived the battle. I read this manga well after it was completed, and it was incredibly frustrating how often the action would be stopped dead just to share the tragic origin of a character the audience had very little time to form a connection with. I can only imagine if I went into those chapters knowing I would have to wait a week to get the part of the story I cared about.</p>
<p>The tragic back stories are not filler. They don&rsquo;t exist just to tread water while the author works on more complicated chapters. These are obviously parts of the story that Gotouge cared about. They&rsquo;re not even bad stories, they&rsquo;re just so clumsily woven in to the narrative that I came to dread them after a while. Once I figured out the formula I could predict exactly when we would be getting the flashback chapter to the demon&rsquo;s tragic back story. Once you realize that a demon is on the cusp of defeat you know that the story is about to stop dead so that we can learn why you should actually feel bad for that demon and hate Muzan even more than you already do. It begins to feel like an emotional manipulation.</p>', CAST(N'2022-11-14T12:20:23.947' AS DateTime), N'0123450007', N'0123450003', N'approved', N'9123860448', N'https://genk.mediacdn.vn/2019/12/2/photo-1-1575269616397390734337.jpg')
SET IDENTITY_INSERT [dbo].[blogs] OFF
GO
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1421597713', N'Ohba Tsugumi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1427815577', N'Sakae Esuno')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1506707742', N'Hiroya Oku')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1569319014', N'Eiichiro Oda')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1591167531', N'Yoshihiro Togashi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'163236171X', N'Naoshi Arakawa')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1638585717', N'Wakui Ken')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1638585725', N'Wakui Ken')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1638586225', N'Wakui Ken')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1638587345', N'Wakui Ken')
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
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'846794711X', N'Wakui Ken')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'9123860448', N'Koyoharu Gotouge')
GO
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1421597713', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1421597713', N'Paranormal fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1427815577', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1506707742', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1569319014', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1591167531', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1591167531', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1591167531', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'163236171X', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585717', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585717', N'Science fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585717', N'Thriller')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585725', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585725', N'Science fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638585725', N'Thriller')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638586225', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638586225', N'Science fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638586225', N'Thriller')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638587345', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638587345', N'Science fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1638587345', N'Thriller')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'164273215X', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646090349', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646090519', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646091132', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646091280', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646091280', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646091280', N'Slide of life')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646512537', N'Harem')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646512537', N'Romantic comedy')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646512537', N'School life')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646513843', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646513843', N'Fantasy Fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1646513843', N'Horror')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1935429744', N'Horror')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'1935429752', N'School life')
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
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'377042848X', N'School life')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'4092270119', N'Harem')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'846794711X', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'846794711X', N'Science fiction')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'846794711X', N'Thriller')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'9123860448', N'Action')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'9123860448', N'Adventure')
INSERT [dbo].[book_genres] ([ISBN], [name]) VALUES (N'9123860448', N'Fantasy Fiction')
GO
SET IDENTITY_INSERT [dbo].[book_import] ON 

INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (1, N'1427815577', N'Tokyopop', CAST(N'2021-11-01T20:56:31.000' AS DateTime), 1200, 670000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (2, N'4092270119', N'Shougakukan', CAST(N'2022-12-01T20:58:53.000' AS DateTime), 2300, 370000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (3, N'1421597713', N'VIZ Media LLC', CAST(N'2022-02-01T21:00:25.000' AS DateTime), 1000, 1000000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (4, N'1506707742', N'Dark Horse Manga', CAST(N'2022-08-01T21:01:32.000' AS DateTime), 2000, 600000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (5, N'1569319014', N'VIZ Media LLC', CAST(N'2021-07-01T21:02:47.000' AS DateTime), 2000, 200000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (6, N'1591167531', N'VIZ Media LLC', CAST(N'2022-02-01T21:03:54.000' AS DateTime), 3000, 230000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (7, N'163236171X', N'Kodansha Comics', CAST(N'2022-01-01T21:05:17.000' AS DateTime), 2500, 250000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (8, N'1638585725', N'Seven Seas', CAST(N'2022-06-01T21:06:06.000' AS DateTime), 2000, 500000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (9, N'164273215X', N'One Peace Books', CAST(N'2022-01-01T21:07:00.000' AS DateTime), 1000, 300000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (10, N'1646090349', N'Square Enix Manga', CAST(N'2022-07-01T21:07:47.000' AS DateTime), 2000, 300000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (11, N'846794711X', N'Seven Seas', CAST(N'2022-11-13T00:00:00.000' AS DateTime), 1000, 300000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (12, N'1638587345', N'Seven Seas', CAST(N'2022-11-13T00:00:00.000' AS DateTime), 500, 400000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (13, N'1638586225', N'Seven Seas', CAST(N'2022-11-13T00:00:00.000' AS DateTime), 1000, 400000)
INSERT [dbo].[book_import] ([id], [ISBN], [publisher], [import_date], [quantity], [original_price]) VALUES (14, N'1638585717', N'Seven Seas', CAST(N'2022-11-13T00:00:00.000' AS DateTime), 1000, 400000)
SET IDENTITY_INSERT [dbo].[book_import] OFF
GO
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1421597713', N'Death Note (All-in-One Edition)', N'English', N'In our real life, if there is an object "falling from the sky", it has an almost limitless power to control human life.
The object is no less than a judgmental instrument and the user is not much different from a judge.

So, how to use it will be decisive.

For personal gain? Or to change the world?

The position of misleading selfish person and justice judge is only a thin line apart - the sobriety in thinking justice-ideal, can it be decided by only one individual.

Then I will create a world full of honest, gentle people who are accepted by myself.If you do that, the only villain left will be you', N'Amanda Haley', 1000000, 1.5460000038146973, N'4.63x7.13x3.2', 2017, 2000, N'Paperback', N'VIZ Media LLC', N'https://i.ibb.co/VVLb3Nx/51-S7-T9t-Ae6-L-SX354-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1427815577', N'Future Diary, Vol. 1', N'English', N'When Yukiteru, a quiet boy who spends most of his time typing on his cell phone diary, realizes that the entries in his diary are from the future, he must face twelve opponents who all posses Future Diaries in a battle to the death. Original.
', N'unknown', 670000, 0.55500000715255737, N'5.25 x 0.75 x 8', 2009, 210, N'Paperback', N'Tokyopop', N'https://i.ibb.co/XL6pXXR/51-Y-TZjq9g-L-SX334-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1506707742', N'Gantz Omnibus Volume 1', N'English', N'Tokyo teens Kei and Masaru are struck dead by a subway train but awaken in a room with an ominous black orb that gives them weapons, suits . . . and orders. Fighting and endless stream of bizarre alien monstrosities in a deadly game, will they win their freedom or die for the final time?
', N'Matthew Johnson', 600000, 0.544311, N'5.15 x 2.03 x 7.23', 2018, 672, N'Paperback', N'Dark Horse Manga', N'https://m.media-amazon.com/images/I/41aesCLxvHL._SX351_BO1,204,203,200_.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1569319014', N'One Piece, Vol. 1: Romance Dawn', N'English', N'As a child, Monkey D. Luffy dreamed of becoming King of the Pirates. But his life changed when he accidentally gained the power to stretch like rubber…at the cost of never being able to swim again! Years, later, Luffy sets off in search of the “One Piece,” said to be the greatest treasure in the world...', N'unknown', 200000, 0.18143, N'5x7.5x0.7', 2003, 216, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/518KKkmd1fL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1591167531', N'Hunter x Hunter, Vol. 1', N'English', N'Hunters are a special breed, dedicated to tracking down treasures, magical beasts, and even other people. But such pursuits require a license, and less than one in a hundred thousand can pass the grueling qualification exam. Those who do pass gain access to restricted areas, amazing stores of information, and the right to call themselves Hunters.', N'unknown', 230000, 0.1550000011920929, N'5x7.5x0.7', 2005, 184, N'Paperback', N'VIZ Media LLC', N'https://i.ibb.co/mGs5YBc/51sgb4-BNN-L.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'163236171X', N'Your Lie in April Vol. 1', N'English', N'A LIFE IN MONOTONE
Kosei Arima was a piano prodigy until his cruel taskmaster of a mother died suddenly, changing his life forever. Driven by his pain to abandon piano, Kosei now lives in a monotonous, colorless world. Having resigned himself to a bland life, he is surprised when he meets Kaori Miyazono, a violinist with an unorthodox style. Can she bring Kosei back to music, and back to life?

Praise for the hit anime
Your Lie in April is about two things: loss and love. A sight to behold -Kotaku
A happy melody, about the power of music to inspire, to energize, to bring sunshine back into a life thatâs lost it.â - Anime News Network', N'unknown', 250000, 0.23000000417232513, N'4.94 x 0.71 x 7.38', 2015, 226, N'Paperback', N'Kodansha Comics', N'https://i.ibb.co/mFqm7qH/514-I-54d-YL.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1638585717', N'Tokyo Revengers (Omnibus) Vol. 1-2', N'English', N'Watching the news, Hanagaki Takemichi learns his junior-high girlfriend Tachibana Hinata has died. A sudden shove sends him 12 years into the past to face the Tokyo Manji Gang that once made his life hell, which is also responsible for Hinata death in the present. To save Hinata and change the future, Takemichi must rise to the top of Kantoâs most sinister delinquent gang! But things aren so simple when he befriends the gang leader, Mikey. What turned Mikey from a petulant child to the leader of the most infamous gang in Tokyo?', N'', 400000, 0.800000011920929, N'8.66 x 5.51 x 0.28 ', 2022, 392, N'Paperback', N'Seven Seas', N'https://i.ibb.co/6PY7z26/51a-Xa-Kjg-VZL-SX354-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1638585725', N'Tokyo Revengers (Omnibus) Vol. 3-4', N'English', N'After the initial misunderstandings were resolved, the student Ngu Duong gradually became closer to the junior Le Hoan - who had a "fierce" appearance but was actually very gentle and warm. They watch movies together and walk the streets together, and then share their worries with each other all the time.

Le Hoan, who was shunned by friends around, even slandered just because of his taciturn appearance, before a Ngu Duong who always treated him sincerely, began to develop a special emotion that cannot be named. . However, at this time, Yu Yang has too many worries to think about. The family does not understand, relatives speak in and out, the eyes of outsiders and society, making a person who has suffered many injuries like Ngu Duong become panic and insecure.', N'unknown', 500000, 0.36800000071525574, N'5.86x8.24x0.97', 2022, 396, N'Paperback', N'Seven Seas', N'https://i.ibb.co/nQJ22j3/9781638585725.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1638586225', N'Tokyo Revengers (Omnibus) Vol. 5-6', N'English', N'Though Takemichi is convinced he''s fixed the timeline by saving Draken, it turns out that Hinata death in the future was only postponed... and this time he had to watch! His only recourse is to climb the ranks of Toman, and Mikey gives him an ultimatum: Bring Mikey''s best friend Baji back from his new gang, Valhalla, the Headless Angel. But the schism between Baji and Toman is deeper than Takemichi could ever have known! Is Mikey''s order even possible?
', N'unknown', 400000, 0.800000011920929, N'8.66 x 5.51 x 0.28 ', 2022, 392, N'Paperback', N'Seven Seas', N'https://i.ibb.co/QjWKMZN/51xsl4q-Ylo-L-SX354-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1638587345', N'Tokyo Revengers (Omnibus) Vol. 7-8', N'English', N'Takemichi attempts to return Baji to the fold have failed, and when he returns to the future, he discovers things are even worse than he feared. The future has changed, and with it, Takemichi past. He remembers snippets of the upcoming battle between Toman and Valhalla, and he knows it ends with Kazutora killing Baji and Mikey taking bloody revenge. Can Takemichi convince Mikey not to kill the former friend who murdered his brother and now his best friend?! Does he even want to ...?', N'unknown', 400000, 0.800000011920929, N'8.66 x 5.51 x 0.28 ', 2022, 414, N'Paperback', N'Seven Seas', N'https://i.ibb.co/NZjR11d/51b4-SRu-Bex-L-SX354-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'164273215X', N'The Rising of the Shield Hero Volume 19: The Manga Companion', N'Japanese', N'A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom. A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom.', N'unknown', 300000, 0.25499999523162842, N'5x7x1', 2022, 176, N'Paperback', N'One Peace Books', N'https://i.ibb.co/qRY4nkN/615-KYcw6hx-L.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1646090349', N'My Dress-Up Darling 3', N'English', N'Wakana and Marin make it through their very first cosplay event, and not long after, Marin''s heart undergoes a change...?! But that''s not going to stop her cosplaying! To research their next project, the duo decide to watch the anime it''s based on...but on screening night, they wind up alone together...?! And with JuJu, another gorgeous cosplayer, dropping by Wakana''s house...it seems like a love triangle is abrew!
', N'Taylor Engel', 300000, 0.3449999988079071, N'5.78 x 0.62 x 8.24', 2020, 192, N'Paperback', N'Square Enix Manga', N'https://i.ibb.co/Ytjc6Jc/51-Kwrn-Yn-Vq-L-SX346-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1646090519', N'My Dress-Up Darling 04', N'English', N'The preparations for Marin and JuJu''s group cosplay steadily advance...until at long last, the costumes are complete!!
That should just leave the photo shoot...but Wakana has a secret plan the other two don''t know about!!', N'Taylor Engel', 300000, 0.35699999332427979, N'5.7 x 0.6 x 8.2', 2021, 192, N'Paperback', N'Square Enix Manga', N'https://i.ibb.co/mvt43MX/51-VTe-UIEcu-L-SX346-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1646091132', N'My Dress-Up Darling 05', N'English', N'Wakana has spent every summer vacation on his own...until now! With a friend like Marin at his side, he''s about to get a taste of everything summer has to offer and more the pool, fireworks, extra homework and of course, cosplay!

Now that she''s crossed off bronzed fighter Veronica-tya from her to-do list, Marin has set her sights on a succubus from one of her favorite manga series! But when she picks out a questionable location for the photo shoot, Wakana''s the one about to be left red in the face and hot under the collar!', N'Taylor Engel', 300000, 0.36800000071525574, N'5.8 x 0.6 x 8.24', 2022, 192, N'Paperback', N'Square Enix Manga', N'https://i.ibb.co/d20P2XG/511-Lxc-ZVYDL-SX352-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1646091280', N'My Dress-Up Darling 06', N'English', N'A loner boy and a flashy girl find common ground via cosplay in this sweet and spicy romcom! Traumatized by a childhood incident with a friend who took exception to his love of traditional dolls, doll-artisan hopeful Wakana Gojou passes his days as a loner, finding solace in the home ec room at his high school.', N'Taylor Engel', 300000, 0.36800000071525574, N'5.78x8.24x0.6', 2022, 192, N'Paperback', N'Square Enix Manga', N'https://i.ibb.co/4tLtZT4/714-V27e-Bab-L.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1646512537', N'The Quintessential Quintuplets Part 1 Manga Box Set', N'English', N'A poor, straight A student is hired to tutor some rich quintuplets. The story is told as a flashback from a future that shows that he ends up getting married to one of them. A poor, straight A student is hired to tutor some rich quintuplets.', N'unknown', 1400000, 1.4739999771118164, N'5.08x7.69x4.65', 2022, 1344, N'Paperback', N'Kodansha Comics', N'https://i.ibb.co/brNfsWY/51-rl-Dy-WYNL-SY418-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1646513843', N'Attack on Titan The Final Season Part 1 Manga Box Set', N'English', N'The War Hammer Titan defeats the Attack Titan and forces Eren out of its body. Just as she prepares to kill him, Mikasa arrives and attacks the War Hammer nape with Thunder Spears, although it turns out to be ineffective. Meanwhile, Udo is declared dead; a vengeful Gabi heads back to the battlefield. Eren realizes that Lara crystal-covered body is underground, connected by a long white cord. He transforms into the Attack Titan again and severs the cord, preparing to devour her. Porco Jaw Titan leaps onto the Attack Titan nape, but Levi arrives and slices its jaw-joint, much to Porco surprise and horror as the enemy initiates a counterattack against him.', N'unknown', 900000, 1.347000002861023, N'5.1x7.67x4.34', 2021, 1248, N'Hardover', N'Kodansha Comics', N'https://i.ibb.co/jgh5CgH/51-Zl-K-XJa-L-SX453-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1935429744', N'Sailor Moon 1', N'English', N'Usagi Tsukino is a normal girl until she meets up with Luna, a talking cat, who tells her that she is Sailor Moon. As Sailor Moon, Usagi must fight evils and enforce justice, in the name of the Moon and the mysterious Moon Princess. She meets other girls destined to be Sailor Senshi (Sailor Scouts), and together, they fight the forces of evil!

This new edition of Sailor Moon will feature:

- An entirely new, incredibly accurate translation!
- Japanese-style, right-to-left reading!
- New cover art never before seen in the U.S.!
- The original Japanese character names!
- Detailed translation notes!

This version of Sailor Moon will be completely true to original. Join us as Sailor Moon returns to the U.S. for the first time in years!', N'unknown', 250000, 0.3449999988079071, N'5 x 0.65 x 7.5', 2011, 248, N'Paperback', N'Kodansha Comics', N'https://i.ibb.co/FhJSywT/51r-QQISM3y-L-SX331-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1935429752', N'Sailor Moon 2', N'English', N'The mysterious Tuxedo Mask has revealed his identity, forcing Usagi to come to terms with her growing affections for the masked vigilante, all the while defending the people of Earth from renewed attacks by the sinister academy. Everything threatens to overwhelm even Sailor Moon when suddenly a new Sailor Guardian appears. Could this new Guardian be the Moon Princess the Sailor Guardians are sworn to protect?
 
This new edition of Sailor Moon features:

- An entirely new, incredibly accurate translation!
- Japanese-style, right-to-left reading!
- New cover art never before seen in the U.S.!
- The original Japanese character names!
- Detailed translation notes!', N'unknown', 250000, 0.3449999988079071, N'5 x 0.64 x 7.5', 2011, 244, N'Paperback', N'Kodansha Comics', N'https://i.ibb.co/SXwnQfS/51-CCc-6fc-OL-SY291-BO1-204-203-200-QL40-FMwebp.webp')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1974722341', N'Kirby Manga Mania, Vol. 1', N'English', N'Kirby Manga Mania is a comedy manga based on the Kirby series, written and drawn by Hirokazu Hikawa. Its volumes are mainly collections of stories from throughout the 1995 - 2006 run of the series Kirby of the Stars: The Story of Dedede Who Lives In Pupupu, originally serialized in the magazine CoroCoro Comic.', N'Amanda Haley', 280000, 0.14399999380111694, N'5x7.5x0.6', 2021, 160, N'Paperback', N'VIZ Media LLC', N'https://i.ibb.co/hdgf21B/71pf-JRp-QLl-L.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1974725987', N'Kaiju No. 8, Vol. 1', N'English', N'Kafka Hibino, a kaiju-corpse cleanup man, has always dreamed of joining the force. But when he gets another shot at achieving his childhood dream, he undergoes an unexpected transformation. How can he fight kaiju now that he is become one himself?!', N'unknown', 190000, 0.20100000500679016, N'5x7.5x0.7', 2021, 204, N'Paperback', N'VIZ Media LLC', N'https://i.ibb.co/D8vr80H/516-Ctk-Xy-KOL-SX430-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1974732339', N'Jujutsu Kaisen, Vol. 17', N'English', N'Jujutsu Kaisen is the story of Yuji Itadori, an easygoing high school student who joins the occult club at school. When they accidentally summon grotesque creatures by messing with a cursed object, Itadori fights to save his friends lives.', N'John Werry', 300000, 0.085000000894069672, N'4.90x7.40x0.70', 2022, 200, N'Paperback', N'VIZ Media LLC', N'https://i.ibb.co/t8FzH0k/9781974732333.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1974734048', N'The Legend of Zelda: Twilight Princess, Vol. 10', N'English', N'The story focuses on series protagonist Link, who tries to prevent Hyrule from being engulfed by a corrupted parallel dimension known as the Twilight Realm. To do so, he takes the form of both a Hylian and a wolf, and he is assisted by a mysterious creature named Midna.', N'unknown', 350000, 0.10400000214576721, N'5x7.5x0.5', 2022, 160, N'Paperback', N'VIZ Media LLC', N'https://i.ibb.co/WH3fcPM/516-Zv-YYQTr-L-SY291-BO1-204-203-200-QL40-FMwebp.webp')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'1975344855', N'Overlord, Vol. 15', N'English', N'Overlord Manga is based on the light novel series. It is a manga adaptation written by Satoshi Oshio, with art illustrated by Hugin Miyama.', N'Ixxion', 250000, 0.18700000643730164, N'5.05x7.5x0.85', 2022, 178, N'Paperback', N'Yen Press', N'https://i.ibb.co/4fCGxM0/811j-Qdm8-ML.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'377042848X', N'Chainsaw Man 02', N'English', N'Usagi Tsukino is a normal girl until she meets up with Luna, a talking cat, who tells her that she is Sailor Moon. As Sailor Moon, Usagi must fight evils and enforce justice, in the name of the Moon and the mysterious Moon Princess. She meets other girls destined to be Sailor Senshi (Sailor Scouts), and together, they fight the forces of evil!

This new edition of Sailor Moon will feature:

- An entirely new, incredibly accurate translation!
- Japanese-style, right-to-left reading!
- New cover art never before seen in the U.S.!
- The original Japanese character names!
- Detailed translation notes!

This version of Sailor Moon will be completely true to original. Join us as Sailor Moon returns to the U.S. for the first time in years!', N'unknown', 250000, 0.26499998569488525, N'4.88 x 0.59 x 7.09', 2020, 399, N'Paperback', N'Egmont Manga', N'https://i.ibb.co/hB3tL8Z/51w84q-XKp0-L-SY291-BO1-204-203-200-QL40-FMwebp.webp')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'4092270119', N'Doraemon: Gadget Cat from the Future, Vol. 1', N'English', N'Doraemon, a cat robot, traveled back in time from the 22nd century to watch over Noby whoâs a good kid but terrible at sports, never studies, and has an incredible capacity for slacking off. Doraemon tries to help Noby with nice but often unpredictable gadgets from his 4th dimensional pocket as Nobita clumsy and always getting into trouble. Can Doraemon solve the problems and change Nobita fortune for the better?', N'unknown', 370000, 0.35400000214576721, N'5x1x8', 2004, 200, N'Paperback', N'Shougakukan', N'https://i.ibb.co/BzNmp4C/51-M2gzui-Nu-L.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'846794711X', N'Tokyo Revengers (Omnibus) Vol. 9-10', N'English', N'Watching the news, Takemichi Hanagaki learns that his girlfriend from way back in middle school, Hinata Tachibana, has died. The only girlfriend he ever had was just killed by a villainous group known as the Tokyo Manji Gang. He lives in a crappy apartment with thin walls, and his six-years-younger boss treats him like an idiot. Plus, he is a complete and total virgin. At the height of his rock-bottom life, he suddenly time-leaps 12 years back to his middle school days!! To save Hinata, and change the life he spent running away, hopeless part-timer Takemichi ms most sinister delinquent gang!!', N'unknown', 300000, 1.6699999570846558, N'8.66 x 5.51 x 0.28 ', 2022, 374, N'Paperback', N'Seven Seas', N'https://i.ibb.co/vLvLRNc/51k-OFWk-YO1-L-SX351-BO1-204-203-200.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_url]) VALUES (N'9123860448', N'Demon Slayer: Kimetsu no Yaiba Vol-1-5 Books Collection set', N'English', N'In Taisho-era Japan, kindhearted Tanjiro Kamado makes a living selling charcoal. But his peaceful life is shattered when a demon slaughters his entire family. His little sister Nezuko is the only survivor, but she has been transformed into a demon herself! Tanjiro sets out on a dangerous journey to find a way to return his sister to normal and destroy the demon who ruined his life.', N'unknown', 900000, 0.19499999284744263, N'4.41x7.09x0.24', 2019, 216, N'Paperback', N'VIZ Media LLC', N'https://i.ibb.co/2kjMkvv/51sgb4-BNN-L.jpg')
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (39, N'1591167531', N'0123450001', N'Came quick was used but in great shape and shipped and packaged good', N'Active', 4, CAST(N'2022-11-14T09:59:24.170' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (40, N'1591167531', N'0123450006', N'Coming in as a big fan of the anime I wanted to get into the manga. Though I’ll probably just read it on the Shonen app (I’m not spending over 350 bucks for all them), it’s still cool to own a physical copy or two. The print quality is good, the art is awesome, and the story is amazing. There are certain things that differ from the anime so it’s worth experiencing both. I’d recommend it.', N'Active', NULL, CAST(N'2022-11-14T10:00:58.597' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (41, N'4092270119', N'0123450006', N'I bought this book (and the other 2 in the series) to encourage my daughter to do some reading in English.', N'Active', 5, CAST(N'2022-11-14T10:05:28.713' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (42, N'1646513843', N'0123450006', N'The box had a bit of damage ( a rip on the side), although the manga inside was in good condition.', N'Active', 3, CAST(N'2022-11-14T10:06:39.493' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (43, N'1646091280', N'0123450006', N'This is the first volume that the anime isn’t caught up with. 1) that’s sad because it just shows how we won’t get a season 2 of my dress up darling for a couple years, 2) I’m pretty hyped to read this.
', N'Active', 5, CAST(N'2022-11-14T10:07:25.410' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (44, N'1421597713', N'0123450006', N'First of all, the seller R-our books spolied it for me. This epic manga was ruined because of their poor packaging. It had considerable dents on all corners. If available with "u-read" order from them. They have least damage count.
As for the manga, this right here is an absolute beauty without a doubt. All 12 volumes plus a bonus chapter binded into one thick fat spine ( a special and more durable spine developed for this edition as claimed by the publishers). The pages, unlike ordinary manga papers, is a semi glossy finished premium papers. Its definitely the best choice to read it in one go, also at a very attractive price.
', N'Active', 4, CAST(N'2022-11-14T10:08:18.383' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (45, N'1646513843', N'0123450008', N'good quality good set comes with cool poster', N'Active', 5, CAST(N'2022-11-14T10:10:57.350' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (46, N'1974722341', N'0123450008', N'This is a vile manga. Kirby comes across as incredibly annoying, by design! It became a pain to read, even if the art could be cute at times .I''m not the biggest Kirby fan, but honestly, this is a stain on his brand.', N'Active', 2, CAST(N'2022-11-14T10:11:49.517' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (47, N'163236171X', N'0123450008', N'Do not hesitate, but this volume NOW!', N'Active', 5, CAST(N'2022-11-14T10:14:43.700' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (48, N'1506707742', N'0123450008', N'Came with damaged corners :(', N'Active', 4, CAST(N'2022-11-14T10:15:20.083' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (49, N'846794711X', N'0123450008', N'Amazing', N'Active', 5, CAST(N'2022-11-14T10:16:22.787' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (50, N'1974732339', N'0123450008', N'I really hope they animate all these volumes.', N'Active', 3, CAST(N'2022-11-14T10:17:18.010' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (51, N'1646091280', N'0123450005', N'I really like this manga I just wish it came out faster but I can wait but hurry up it is too good', N'Active', 5, CAST(N'2022-11-14T10:26:06.957' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (52, N'1506707742', N'0123450005', N'This manga will have you on your feet, very mysterious and full of action. Highly suggest.', N'Active', 5, CAST(N'2022-11-14T10:26:45.813' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (53, N'846794711X', N'0123450005', N'It is a really good story some points it kind of drags but it is really good', N'Active', 4, CAST(N'2022-11-14T10:27:15.527' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (54, N'1569319014', N'0123450005', N'I got this for a birthday present and it was perfect. Came in perfect condition & delivered on time.', N'Active', 5, CAST(N'2022-11-14T10:28:06.023' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (55, N'1974734048', N'0123450005', N'I don’t read. But my collection is complete. I actually don’t know why I started collecting these. But now I can’t stop. Great quality. Fast shipping.', N'Active', 4, CAST(N'2022-11-14T10:31:27.080' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (56, N'1638585717', N'0123450005', N'I''ve been waiting for the English print of this series FOREVER. I was so happy when I got this in my hands. my purchase was in may of 2022. the paper is white and thicker in this print (tr 1-2), it''s also heavier than the next book (tr 3-4). still great quality and looks amazing on my shelf :)', N'Active', 5, CAST(N'2022-11-14T10:31:57.287' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (57, N'1427815577', N'0123450005', N'Mirai Nikki or Future Diary as known here in America. Is a great series, I got into the manga from watching the anime. It is a great mystery/horror/science fiction series and I would recommend it to anyone.The only down falls were the price which was a bit more than normal . I guess maybe because you cant find it at your local bookstore because of rarity or how old it is. I also bought it used, most manga I buy used comes in wonderful condition actually. This one...not so much...but its still enjoyable and im pretty happy with it :)', N'Active', 3, CAST(N'2022-11-14T10:32:33.860' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (58, N'1646090349', N'0123450005', N'Really funny, a good read and highly recommend for ppl that like a laugh and love cosplay, also watch the anime :)', N'Active', 4, CAST(N'2022-11-14T10:33:28.070' AS DateTime))
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
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1427815577', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1506707742', 10)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1569319014', 30)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1591167531', 500)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'163236171X', 100)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1638585717', 1000)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1638585725', 1000)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1638586225', 1000)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1638587345', 500)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'164273215X', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646090349', 1000)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646090519', 452)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646091132', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646091280', 100)
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
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'846794711X', 1000)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'9123860448', 100)
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (33, 25, N'1646091280', 1, 300000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (34, 25, N'1974722341', 1, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (35, 25, N'1569319014', 1, 189000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (36, 26, N'1646512537', 1, 1400000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (37, 27, N'1591167531', 1, 230000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (38, 27, N'1569319014', 1, 189000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (39, 28, N'1646513843', 1, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (40, 29, N'1974732339', 1, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (41, 29, N'1569319014', 1, 189000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (42, 30, N'846794711X', 2, 600000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (43, 31, N'1646091280', 1, 300000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (44, 31, N'1506707742', 1, 500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (45, 32, N'1569319014', 1, 189000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (46, 33, N'1646513843', 1, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (47, 33, N'1646091280', 1, 300000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (48, 34, N'4092270119', 1, 370000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (49, 35, N'1646513843', 1, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (50, 35, N'1421597713', 1, 949000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (51, 36, N'1974734048', 2, 700000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (52, 36, N'1591167531', 2, 460000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (53, 36, N'9123860448', 1, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (54, 36, N'1974722341', 1, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (55, 37, N'1646513843', 1, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (56, 38, N'1974722341', 1, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (57, 39, N'1569319014', 1, 189000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (58, 40, N'1974732339', 1, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (59, 41, N'846794711X', 3, 900000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (60, 42, N'1506707742', 1, 500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (61, 43, N'163236171X', 1, 250000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (62, 44, N'1638585717', 1, 400000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (63, 45, N'1974734048', 1, 350000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (64, 45, N'1638585717', 1, 400000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (65, 45, N'1427815577', 1, 670000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (66, 45, N'1646090349', 1, 299000)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (25, N'Mai Xuân Quân', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450001', CAST(N'2022-11-14T08:13:50.817' AS DateTime), 739000, N'0123450001', N'0123450003', N'To Receive', NULL, N'COD', CAST(N'2022-11-14T08:31:36.927' AS DateTime), CAST(N'2022-11-14T08:31:53.130' AS DateTime), NULL, NULL, N'Viettle Post', NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (26, N'Mai Xuân Quân', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450001', CAST(N'2022-11-14T08:14:01.377' AS DateTime), 1400000, N'0123450001', N'0123450009', N'To Ship', NULL, N'Paypal', CAST(N'2022-11-14T08:38:03.963' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (27, N'Mai Xuân Quân', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450001', CAST(N'2022-11-14T08:14:50.150' AS DateTime), 419000, N'0123450001', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-10-13T08:33:11.417' AS DateTime), CAST(N'2022-10-13T10:33:11.417' AS DateTime), CAST(N'2022-10-13T12:33:11.417' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-10-14T08:33:11.417' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (28, N'Mai Xuân Quân', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450001', CAST(N'2022-11-14T08:14:58.567' AS DateTime), 900000, N'0123450001', NULL, N'To Confirm', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (29, N'Mai Thế Hùng', N'Trần Duy Hưng, Trung Hoà, Cầu Giấy, Hà Nội', N'0123450005', CAST(N'2022-11-14T08:15:37.800' AS DateTime), 439000, N'0123450005', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-01-11T08:32:09.910' AS DateTime), CAST(N'2022-01-11T09:32:09.910' AS DateTime), CAST(N'2022-01-11T08:32:09.910' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-01-12T08:32:09.910' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (30, N'Mai Thế Hùng', N'Trần Duy Hưng, Trung Hoà, Cầu Giấy, Hà Nội', N'0123450005', CAST(N'2022-11-14T08:15:53.697' AS DateTime), 600000, N'0123450005', N'0123450003', N'Completed', NULL, N'Paypal', CAST(N'2022-08-10T08:33:07.720' AS DateTime), CAST(N'2022-08-10T08:33:07.720' AS DateTime), CAST(N'2022-08-10T08:33:07.720' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-08-14T08:33:07.720' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (31, N'Mai Thế Hùng', N'Trần Duy Hưng, Trung Hoà, Cầu Giấy, Hà Nội', N'0123450005', CAST(N'2022-11-14T08:16:29.137' AS DateTime), 800000, N'0123450005', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-11-14T08:31:32.627' AS DateTime), CAST(N'2022-11-14T08:32:55.437' AS DateTime), CAST(N'2022-11-14T08:33:23.733' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-11-14T08:33:23.733' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (32, N'Mai Thế Hùng', N'Trần Duy Hưng, Trung Hoà, Cầu Giấy, Hà Nội', N'0123450005', CAST(N'2022-11-14T08:18:58.930' AS DateTime), 189000, N'0123450005', NULL, N'To Confirm', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (33, N'Phạm Thiên Nhi', N'Xà Phìn, Đồng Văn, Hà Giang', N'0123450006', CAST(N'2022-11-14T08:20:05.847' AS DateTime), 1200000, N'0123450006', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-06-14T08:33:06.323' AS DateTime), CAST(N'2022-06-14T08:33:06.323' AS DateTime), CAST(N'2022-06-14T08:33:06.323' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-06-14T08:33:06.323' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (34, N'Phạm Thiên Nhi', N'Xà Phìn, Đồng Văn, Hà Giang', N'0123450006', CAST(N'2022-11-14T08:20:12.997' AS DateTime), 370000, N'0123450006', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-11-14T08:31:12.667' AS DateTime), CAST(N'2022-11-14T08:32:59.073' AS DateTime), CAST(N'2022-11-14T08:33:09.903' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-11-14T08:33:09.903' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (35, N'Phạm Thiên Nhi', N'Xà Phìn, Đồng Văn, Hà Giang', N'0123450006', CAST(N'2022-11-14T08:20:26.550' AS DateTime), 1849000, N'0123450006', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-11-14T08:31:18.837' AS DateTime), CAST(N'2022-11-14T10:13:31.287' AS DateTime), CAST(N'2022-11-14T10:13:41.697' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-11-14T10:13:41.697' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (36, N'Nguyễn Công Ngọ', N'Gia Lai', N'0123450008', CAST(N'2022-11-14T08:21:19.580' AS DateTime), 2310000, N'0123450008', N'0123450003', N'Cancelled', N'Sai dia chi', N'COD', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-14T09:51:25.783' AS DateTime), NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (37, N'Nguyễn Công Ngọ', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450008', CAST(N'2022-11-14T08:23:12.730' AS DateTime), 900000, N'0123450008', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-11-14T08:31:27.707' AS DateTime), CAST(N'2022-11-14T08:31:51.100' AS DateTime), CAST(N'2022-11-14T10:13:11.963' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-11-14T10:13:11.963' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (38, N'Nguyễn Công Ngọ', N'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450008', CAST(N'2022-11-14T08:23:23.090' AS DateTime), 250000, N'0123450008', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-11-14T08:27:25.070' AS DateTime), CAST(N'2022-11-14T10:10:10.043' AS DateTime), CAST(N'2022-11-14T10:10:17.873' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-11-14T10:10:17.873' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (39, N'Mai Xuân Quân', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450001', CAST(N'2022-11-14T09:56:17.080' AS DateTime), 189000, N'0123450001', NULL, N'Cancelled', N'Find cheaper prices elsewhere', N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (40, N'Nguyễn Công Ngọ', N'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450008', CAST(N'2022-11-14T10:12:31.860' AS DateTime), 250000, N'0123450008', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-09-13T10:13:39.753' AS DateTime), CAST(N'2022-09-14T10:13:39.753' AS DateTime), CAST(N'2022-09-14T10:13:39.753' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-09-14T10:13:39.753' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (41, N'Nguyễn Công Ngọ', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450008', CAST(N'2022-11-14T10:12:41.397' AS DateTime), 900000, N'0123450008', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-10-13T10:13:38.590' AS DateTime), CAST(N'2022-10-13T10:13:38.590' AS DateTime), CAST(N'2022-10-14T10:13:38.590' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-10-19T10:13:38.590' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (42, N'Nguyễn Công Ngọ', N'ktx khu B, đại học quốc gia', N'0123450008', CAST(N'2022-11-14T10:12:56.447' AS DateTime), 500000, N'0123450008', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-10-10T10:13:36.940' AS DateTime), CAST(N'2022-10-11T10:13:36.940' AS DateTime), CAST(N'2022-10-12T10:13:36.940' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-10-14T10:13:36.940' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (43, N'Nguyễn Công Ngọ', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450008', CAST(N'2022-11-14T10:13:06.610' AS DateTime), 250000, N'0123450008', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-09-09T10:13:35.177' AS DateTime), CAST(N'2022-09-10T10:13:35.177' AS DateTime), CAST(N'2022-09-11T10:13:35.177' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-09-12T10:13:35.177' AS DateTime), NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (44, N'Nguyễn Công Ngọ', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'0123450008', CAST(N'2022-11-14T10:14:07.097' AS DateTime), 400000, N'0123450008', NULL, N'To Confirm', NULL, N'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_username], [status], [status_note], [payment], [to_confirm_date], [to_ship_date], [to_receive_date], [expected_date], [delivery_company], [completed_date], [cancelled_date], [return_refund_date]) VALUES (45, N'Mai Thế Hùng', N'Trần Duy Hưng, Trung Hoà, Cầu Giấy, Hà Nội', N'0123450005', CAST(N'2022-11-14T10:29:01.557' AS DateTime), 1719000, N'0123450005', N'0123450003', N'Completed', NULL, N'COD', CAST(N'2022-11-14T10:30:37.977' AS DateTime), CAST(N'2022-11-14T10:30:42.487' AS DateTime), CAST(N'2022-11-14T10:30:46.410' AS DateTime), NULL, N'Viettle Post', CAST(N'2022-11-14T10:30:46.410' AS DateTime), NULL, NULL)
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
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1569319014', 100000, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Inactive', 26)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1427815577', 670000, CAST(N'2022-10-25T12:55:12.000' AS DateTime), N'Active', 27)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1506707742', 500000, CAST(N'2022-10-25T12:56:44.000' AS DateTime), N'Active', 28)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646090349', 299000, CAST(N'2022-10-25T12:58:17.000' AS DateTime), N'Active', 29)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646090519', 299000, CAST(N'2022-10-25T12:59:06.000' AS DateTime), N'Active', 30)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646091132', 299000, CAST(N'2022-10-25T12:59:46.000' AS DateTime), N'Active', 31)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1646091280', 300000, CAST(N'2022-10-25T13:00:26.000' AS DateTime), N'Active', 32)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'163236171X', 250000, CAST(N'2022-10-25T13:01:35.000' AS DateTime), N'Active', 33)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1935429744', 229000, CAST(N'2022-10-25T13:04:35.000' AS DateTime), N'Active', 34)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1935429752', 250000, CAST(N'2022-10-25T13:04:58.000' AS DateTime), N'Active', 35)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'377042848X', 229000, CAST(N'2022-10-25T13:05:57.000' AS DateTime), N'Active', 36)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'4092270119', 370000, CAST(N'2022-10-25T13:07:28.000' AS DateTime), N'Active', 37)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'846794711X', 300000, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'Active', 38)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1638587345', 400000, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'Active', 39)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1638586225', 400000, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'Active', 40)
INSERT [dbo].[prices] ([ISBN], [price], [applicable_date], [status], [id]) VALUES (N'1638585717', 400000, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'Active', 41)
SET IDENTITY_INSERT [dbo].[prices] OFF
GO
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Dark Horse Manga', N'....com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Egmont Manga', N'dgvdgd.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Kodansha Comics', N'kodansha.us')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Mavel Comics', N'https://www.marvel.com/')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'One Peace Books', N'www.onepeacebooks.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Oni Press', N'https://onipress.com/')
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
INSERT [dbo].[user_roles] ([id], [role_name]) VALUES (6, N'creator')
SET IDENTITY_INSERT [dbo].[user_roles] OFF
GO
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450001', N'Mai Xuân Quân', N'quan01062002@gmail.com', N'Vinhomes Grand Park, Long Thạnh Mỹ, Thủ Đức, HCM', N'male', N'$2a$10$SMGWDizjwBWyyY3fLYyyWu5fJArjBsRkIC3wde4CSI8nBn5InSNDO', 4, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450002', N'Nguyễn Kim Cương', N'kimcuong@gmail.com', N'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thủ Đức, HCM', N'male', N'$2a$10$I8sYWbJEzqUL/fvdSyiEEu6FJlHrvjeEKNqt9sTQUH8.dlOdKAsTW', 1, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450003', N'Nguyễn Hồng Hiệp', N'hiepnhse160001@fpt.edu.vn', N'ktx khu B, đại học quốc gia', N'male', N'$2a$10$Sq5P2M87feBL4DJNu.ht8.KupTa23hSUo03XqRr5TJj2jO2zmjupW', 2, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450004', N'Phan Đăng', N'dangptmse160408@fpt.edu.vn', N'Số 91, phố Xuân Viên, phường Sa Pa', N'male', N'$2a$10$p3Lah6Fc3A9s4Hp1gwWsUuS7HbC0wzsRJ/CZe7uHUgpxt97ML7/V.', 3, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450005', N'Mai Thế Hùng', N'hungmtse160033@fpt.edu.vn', N'Trần Duy Hưng, Trung Hoà, Cầu Giấy, Hà Nội', N'female', N'$2a$10$m4dcF9lxPvkx56.DztBzsupAByPRJg0Cqmu7IUUi99F553NKucCPu', 4, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450006', N'Phạm Thiên Nhi', N'nhiptse150257@fpt.edu.vn', N'Xà Phìn, Đồng Văn, Hà Giang', N'female', N'$2a$10$QZe0uEIQFKjt3gMAxB9bUOKuZkugU0UZKgDzUi07g2ZTsOWJT6SKC', 4, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450007', N'Nguyễn Tiến Sơn', N'sonnguyen@gmail.com', N'Trần Quang Khải, Thọ Quang, Sơn Trà, Đà Nẵng', N'male', N'$2a$10$33E0H5x3vz5JFwdQayAEQeWx.TS6vEwfEjh9bjjsaHyQ.dhwvFdha', 6, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450008', N'Nguyễn Công Ngọ', N'ngonguyen@gmail.com', N'', N'male', N'$2a$10$IeLuPGyyz1oM5VfwexrVjO0iE1zrqZ8u2OEIkr0.PcE6ysE1a0eJG', 4, NULL, NULL)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id], [avatar], [date_of_birth]) VALUES (N'0123450009', N'Trần Văn Nam', N'namtran@gmail.com', N'Lý Thái Tổ, An Hòa, Thành phố Huế, Thừa Thiên Huế', N'male', N'$2a$10$I8sYWbJEzqUL/fvdSyiEEu6FJlHrvjeEKNqt9sTQUH8.dlOdKAsTW', 2, NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_email]    Script Date: 14/11/2022 13:26:49 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD  CONSTRAINT [FK_blogs_books] FOREIGN KEY([ISBN])
REFERENCES [dbo].[books] ([ISBN])
GO
ALTER TABLE [dbo].[blogs] CHECK CONSTRAINT [FK_blogs_books]
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD  CONSTRAINT [FK_blogs_users] FOREIGN KEY([author])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[blogs] CHECK CONSTRAINT [FK_blogs_users]
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD  CONSTRAINT [FK_blogs_users1] FOREIGN KEY([staff])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[blogs] CHECK CONSTRAINT [FK_blogs_users1]
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
ALTER TABLE [dbo].[book_import]  WITH CHECK ADD  CONSTRAINT [FK_book_import_inventory] FOREIGN KEY([ISBN])
REFERENCES [dbo].[inventory] ([ISBN])
GO
ALTER TABLE [dbo].[book_import] CHECK CONSTRAINT [FK_book_import_inventory]
GO
ALTER TABLE [dbo].[book_import]  WITH CHECK ADD  CONSTRAINT [FK_book_import_publishers] FOREIGN KEY([publisher])
REFERENCES [dbo].[publishers] ([name])
GO
ALTER TABLE [dbo].[book_import] CHECK CONSTRAINT [FK_book_import_publishers]
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
