USE [master]
GO
/****** Object:  Database [BookStoreManagement]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[authors]    Script Date: 9/25/2022 10:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[alias_name] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[year_of_birth] [int] NULL,
	[website] [varchar](200) NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[alias_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_authors]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[book_genres]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[books]    Script Date: 9/25/2022 10:54:42 AM ******/
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
	[image_address] [nvarchar](150) NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[genres]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[inventory]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[order_details]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 9/25/2022 10:54:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[receiver_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](250) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[order_time] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[username] [varchar](11) NOT NULL,
	[staff_name] [nvarchar](30) NULL,
	[status] [varchar](30) NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prices]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[publishers]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 9/25/2022 10:54:42 AM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 9/25/2022 10:54:42 AM ******/
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
	[password] [nvarchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
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



use BookStoreManagement

/* dbo.inventory */
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1974732339', 100) 
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('164273215X', 200)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1974722341', 50)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1421597713', 10)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1646091280', 0)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1646513843', 150)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1974734048', 200)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1638585725', 180)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1975344855', 80)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1646512537', 90)
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1974725987', 100) 
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1591167531', 500) 
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('9123860448', 100) 
INSERT INTO dbo.inventory([ISBN], [quantity]) VALUES('1569319014', 30) 

/* dbo.publishers */
INSERT INTO [dbo].[publishers]([name], [address]) VALUES('Seven Seas','sevenseasentertainment.com')
INSERT INTO [dbo].[publishers]([name], [address]) VALUES('Kodansha Comics','kodansha.us')
INSERT INTO [dbo].[publishers]([name], [address]) VALUES('Yen Press','yenpress.com')
INSERT INTO [dbo].[publishers]([name], [address]) VALUES('Square Enix Manga','squareenixmangaandbooks.square-enix-games.com')
INSERT INTO [dbo].[publishers]([name], [address]) VALUES('VIZ Media LLC','www.viz.com')
INSERT INTO [dbo].[publishers]([name], [address]) VALUES('One Peace Books','www.onepeacebooks.com')

/* dbo.book */
INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1974732339' ,
	'Jujutsu Kaisen, Vol. 17' ,
	'English' ,
	'Jujutsu Kaisen is the story of Yuji Itadori, an easygoing high school student who joins the occult club at school. When they accidentally summon grotesque creatures by messing with a cursed object, Itadori fights to save his friends lives.',
	'John Werry' ,
	250000 ,
	0.0850486 ,
	'4.90x7.40x0.70' ,
	2022,
	200 ,
	'Paperback',
	'VIZ Media LLC' ,
	'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/9747/9781974732333.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '164273215X' ,
	'The Rising of the Shield Hero Volume 19: The Manga Companion' ,
	'English' ,
	'A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom. A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom.',
	'unknown' ,
	300000 ,
	0.255146 ,
	'5x7x1' ,
	2022,
	176 ,
	'Paperback',
	'One Peace Books' ,
	'https://images-na.ssl-images-amazon.com/images/I/615KYcw6hxL.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1974722341' ,
	'Kirby Manga Mania, Vol. 1' ,
	'English' ,
	'Kirby Manga Mania is a comedy manga based on the Kirby series, written and drawn by Hirokazu Hikawa. Its volumes are mainly collections of stories from throughout the 1995 - 2006 run of the series Kirby of the Stars: The Story of Dedede Who Lives In Pupupu, originally serialized in the magazine CoroCoro Comic.',
	'Amanda Haley' ,
	250000 ,
	0.144583 ,
	'5x7.5x0.6' ,
	2021,
	160 ,
	'Paperback',
	'VIZ Media LLC' ,
	'https://images-na.ssl-images-amazon.com/images/I/71pfJRpQLlL.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1421597713' ,
	'Death Note (All-in-One Edition)' ,
	'English' ,
	'',
	'Amanda Haley' ,
	930000 ,
	1.54675 ,
	'4.63x7.13x3.2' ,
	2017,
	2400 ,
	'Paperback',
	'VIZ Media LLC' ,
	'https://salt.tikicdn.com/cache/w1200/ts/product/96/ab/aa/897541eaf5becff293cb329e81179db0.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1646091280' ,
	'My Dress-Up Darling 06' ,
	'English' ,
	'A loner boy and a flashy girl find common ground via cosplay in this sweet and spicy romcom! Traumatized by a childhood incident with a friend who took exception to his love of traditional dolls, doll-artisan hopeful Wakana Gojou passes his days as a loner, finding solace in the home ec room at his high school.',
	'Taylor Engel' ,
	300000 ,
	0.368544 ,
	'5.78x8.24x0.6' ,
	2022,
	192 ,
	'Paperback',
	'Square Enix Manga' ,
	'https://images-na.ssl-images-amazon.com/images/I/714V27eBabL.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1975344855' ,
	'Overlord, Vol. 15' ,
	'English' ,
	'Overlord Manga is based on the light novel series. It is a manga adaptation written by Satoshi Oshio, with art illustrated by Hugin Miyama.',
	'Ixxion' ,
	250000 ,
	0.187107 ,
	'5.05x7.5x0.85' ,
	2022,
	178 ,
	'Paperback',
	'Yen Press' ,
	'https://images-na.ssl-images-amazon.com/images/I/811jQdm8-ML.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1646513843' ,
	'Attack on Titan The Final Season Part 1 Manga Box Set' ,
	'English' ,
	'The War Hammer Titan defeats the Attack Titan and forces Eren out of its body. Just as she prepares to kill him, Mikasa arrives and attacks the War Hammer nape with Thunder Spears, although it turns out to be ineffective. Meanwhile, Udo is declared dead; a vengeful Gabi heads back to the battlefield. Eren realizes that Lara crystal-covered body is underground, connected by a long white cord. He transforms into the Attack Titan again and severs the cord, preparing to devour her. Porco Jaw Titan leaps onto the Attack Titan nape, but Levi arrives and slices its jaw-joint, much to Porco surprise and horror as the enemy initiates a counterattack against him.',
	'unknown' ,
	900000 ,
	1.347169 ,
	'5.1x7.67x4.34' ,
	2021,
	1248 ,
	'Paperback',
	'Kodansha Comics' ,
	'https://images-na.ssl-images-amazon.com/images/I/51+ZlK-XJaL._SX453_BO1,204,203,200_.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1974734048' ,
	'The Legend of Zelda: Twilight Princess, Vol. 10' ,
	'English' ,
	'The story focuses on series protagonist Link, who tries to prevent Hyrule from being engulfed by a corrupted parallel dimension known as the Twilight Realm. To do so, he takes the form of both a Hylian and a wolf, and he is assisted by a mysterious creature named Midna.',
	'unknown' ,
	350000 ,
	0.104893 ,
	'5x7.5x0.5' ,
	2022,
	160 ,
	'Paperback',
	'VIZ Media LLC' ,
	'https://images-na.ssl-images-amazon.com/images/I/516ZvYYQTrL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1646512537' ,
	'The Quintessential Quintuplets Part 1 Manga Box Set' ,
	'English' ,
	'A poor, straight A student is hired to tutor some rich quintuplets. The story is told as a flashback from a future that shows that he ends up getting married to one of them. A poor, straight A student is hired to tutor some rich quintuplets.',
	'unknown' ,
	1400000 ,
	1.474175 ,
	'5.08x7.69x4.65' ,
	2022,
	1344 ,
	'Paperback',
	'Kodansha Comics' ,
	'https://images-na.ssl-images-amazon.com/images/I/51+rlDyWYNL._SY418_BO1,204,203,200_.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1638585725' ,
	'Tokyo Revengers (Omnibus) Vol. 3-4' ,
	'English' ,
	'',
	'unknown' ,
	500000 ,
	0.368544 ,
	'5.86x8.24x0.97' ,
	2022,
	396 ,
	'Paperback',
	'Seven Seas' ,
	'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/6385/9781638585725.jpg'
)


INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1974725987' ,
	'Kaiju No. 8, Vol. 1' ,
	'English' ,
	'Kafka Hibino, a kaiju-corpse cleanup man, has always dreamed of joining the force. But when he gets another shot at achieving his childhood dream, he undergoes an unexpected transformation. How can he fight kaiju now that he is become one himself?!',
	'unknown' ,
	190000 ,
	0.201282 ,
	'5x7.5x0.7' ,
	2021,
	204 ,
	'Paperback',
	'VIZ Media LLC' ,
    'https://images-na.ssl-images-amazon.com/images/I/516CtkXyKOL._SX430_BO1,204,203,200_.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1591167531' ,
	'Hunter x Hunter, Vol. 1' ,
	'English' ,
	'Hunters are a special breed, dedicated to tracking down treasures, magical beasts, and even other people. But such pursuits require a license, and less than one in a hundred thousand can pass the grueling qualification exam. Those who do pass gain access to restricted areas, amazing stores of information, and the right to call themselves Hunters.',
	'unknown' ,
	230000 ,
	0.155922 ,
	'5x7.5x0.7' ,
	2005,
	184 ,
	'Paperback',
	'VIZ Media LLC' ,
    'https://m.media-amazon.com/images/I/51sgb4BNN-L.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '9123860448' ,
	'Demon Slayer: Kimetsu no Yaiba Vol-1-5 Books Collection set' ,
	'English' ,
	'In Taisho-era Japan, kindhearted Tanjiro Kamado makes a living selling charcoal. But his peaceful life is shattered when a demon slaughters his entire family. His little sister Nezuko is the only survivor, but she has been transformed into a demon herself! Tanjiro sets out on a dangerous journey to find a way to return his sister to normal and destroy the demon who ruined his life.',
	'unknown' ,
	900000 ,
	0.195612 ,
	'4.41x7.09x0.24' ,
	2019,
	216 ,
	'Paperback',
	'VIZ Media LLC' ,
    'https://images-na.ssl-images-amazon.com/images/I/514ByuCVj8L._SX290_BO1,204,203,200_.jpghttps://m.media-amazon.com/images/I/51sgb4BNN-L.jpg'
)

INSERT INTO [dbo].[books](
    [ISBN] ,
	[name] ,
	[language] ,
	[description],
	[translator] ,
	[price] ,
	[weight] ,
	[size] ,
	[year_of_publish] ,
	[number_of_page] ,
	[book_layout] ,
	[publisher_name],
	[image_address]
) 
VALUES(
    '1569319014' ,
	'One Piece, Vol. 1: Romance Dawn' ,
	'English' ,
	'As a child, Monkey D. Luffy dreamed of becoming King of the Pirates. But his life changed when he accidentally gained the power to stretch like rubber…at the cost of never being able to swim again! Years, later, Luffy sets off in search of the “One Piece,” said to be the greatest treasure in the world...',
	'unknown' ,
	180000 ,
	0.18143,
	'5x7.5x0.7' ,
	2003,
	216 ,
	'Paperback',
	'VIZ Media LLC' ,
    'https://images-na.ssl-images-amazon.com/images/I/518KKkmd1fL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg')

/* dbo.genres*/

INSERT INTO [dbo].[genres]([name], [description]) VALUES('Fantasy Fiction', 'Fantasy fiction is a genre of writing in which the plot could not happen in real life (as we know it, at least). Often, the plot involves magic or witchcraft and takes place on another planet or in another — undiscovered — dimension of this world.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Paranormal fiction', 'Paranormal fiction is a genre of fiction whose story lines revolve around the paranormal.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Science fiction', 'Science fiction is a genre of speculative fiction which typically deals with imaginative and futuristic concepts such as advanced science and technology, space exploration, time travel, parallel universes, ...')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Thriller', 'Thriller is a genre of fiction, having numerous, often overlapping subgenres. Thrillers are characterized and defined by the moods they elicit, giving viewers heightened feelings of suspense, excitement, surprise, anticipation and anxiety. Successful examples of thrillers are the films of Alfred Hitchcock.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Action','Action is about conflict. Whether with guns, blades, fists, or mysterious powers, these manga feature characters in combat - either to protect themselves or the things or people they value, or simply as a way of life.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Romantic comedy','Romantic comedy is a subgenre of comedy and slice of life fiction, focusing on lighthearted, humorous plot lines centered on romantic ideas, such as how true love is able to surmount most obstacles.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Slide of life','Slice of life is a depiction of mundane experiences in art and entertainment. In theater, slice of life refers to naturalism, while in literary parlance it is a narrative technique in which a seemingly arbitrary sequence of events in a character life is presented, often lacking plot development, conflict and exposition, as well as often having an open ending.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('School life','School life is a genre which has the majority of the storyline taking place in a school.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Harem','Harem is a kind of story in Japanese anime and manga where a male character is surrounded and loved by many female characters.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Horror', 'Horror is a genre of fiction which is intended to frighten, scare, or disgust. Horror is often divided into the sub-genres of psychological horror and supernatural horror, which is in the realm of speculative fiction.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Comedy', 'Comedy is a genre of fiction that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Adventure', 'Adventure fiction is a type of fiction that usually presents danger, or gives the reader a sense of excitement. Some adventure fiction also satisfies the literary definition of romance fiction.')
INSERT INTO [dbo].[genres]([name], [description]) VALUES('Supernatural', 'Supernatural fiction or supernaturalist fiction is a genre of speculative fiction that exploits or is centered on supernatural themes, often contradicting naturalist assumptions of the real world.')


/* dbo.book_genres */

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1421597713', 'Fantasy Fiction')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1421597713', 'Paranormal fiction')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1638585725', 'Action')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1638585725', 'Thriller')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1638585725', 'Science fiction')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('164273215X', 'Fantasy Fiction')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646091280', 'Romantic comedy')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646091280', 'Slide of life')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646512537', 'Romantic comedy')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646512537', 'School life')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646512537', 'Harem')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646513843', 'Action')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646513843', 'Fantasy Fiction')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1646513843', 'Horror')


INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974722341', 'Comedy')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974722341', 'Fantasy Fiction')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974732339', 'Adventure')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974732339', 'Supernatural')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974732339', 'Fantasy Fiction')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974734048', 'Action')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974734048', 'Adventure')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1975344855', 'Fantasy Fiction')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974725987', 'Fantasy Fiction')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1974725987', 'Science fiction')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1591167531', 'Fantasy Fiction')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1591167531', 'Adventure')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1591167531', 'Action')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('9123860448', 'Fantasy Fiction')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('9123860448', 'Adventure')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('9123860448', 'Action')

INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1569319014', 'Fantasy Fiction')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1569319014', 'Adventure')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1569319014', 'Action')
INSERT INTO [dbo].[book_genres]([ISBN], [name]) VALUES('1569319014', 'comedy')


/* dbo.authors */

INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Ohba Tsugumi', 'Hiroshi Gamo', 1962,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Wakui Ken', 'Wakui Ken', 0,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Yusagi Aneko', 'Yusagi Aneko', 0,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Fukuda Shinichi', 'Fukuda Shinichi', 1955,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Haruba Negi', 'Haruba Negi', 1991,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Isayama Hajime', 'Isayama Hajime', 1986,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Hikawa Hirokazu', 'Hikawa Hirokazu', 1967,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Akutami Gege', 'unknown', 1992,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Himekawa Akira', 'unknown', 0,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Maruyama Kugane', 'Muchimuchi Puririn', 1950,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Matsumoto Naoya', 'Naoya Matsumoto', 1982,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Yoshihiro Togashi', 'Yoshihiro Togashi', 1966,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Koyoharu Gotouge', 'unknown', 1989,'')
INSERT INTO [dbo].[authors]([alias_name], [name], [year_of_birth], [website]) VALUES('Eiichiro Oda', 'Eiichiro Oda', 1975,'')

/* dbo.book_authors */

INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1421597713', 'Ohba Tsugumi')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1638585725', 'Wakui Ken')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('164273215X', 'Yusagi Aneko')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1646091280', 'Fukuda Shinichi')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1646512537', 'Haruba Negi')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1646513843', 'Isayama Hajime')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1974722341', 'Hikawa Hirokazu')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1974732339', 'Akutami Gege')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1974734048', 'Himekawa Akira')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1975344855', 'Maruyama Kugane')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1974725987', 'Matsumoto Naoya')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1591167531', 'Yoshihiro Togashi')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('9123860448', 'Koyoharu Gotouge')
INSERT INTO [dbo].[book_authors]([ISBN], [author_alias]) VALUES('1569319014', 'Eiichiro Oda')

/* dbo.user_roles */

/*DELeTE FROM [dbo].[user_roles] where id=4*/

INSERT INTO [dbo].[user_roles]([role_name]) VALUES ('admin')
INSERT INTO [dbo].[user_roles]([role_name]) VALUES ('sale staff')
INSERT INTO [dbo].[user_roles]([role_name]) VALUES ('inventory staff')
INSERT INTO [dbo].[user_roles]([role_name]) VALUES ('customer')
INSERT INTO [dbo].[user_roles]([role_name]) VALUES ('guest')

/*DBCC CHECKIDENT(user_roles, NORESEED)
DBCC CHECKIDENT(user_roles, RESEED, 0)*/

/* dbo.users */

INSERT INTO [dbo].[users]([username], [full_name], [email], [address], [gender], [password], [role_id])
VALUES('1234567890', 'i am admin', 'admin@gmail.com', '492 Nguyen Dinh Chieu Street, District 3, Ho Chi Minh City', 'female', '12345', 1)

INSERT INTO [dbo].[users]([username], [full_name], [email], [address], [gender], [password], [role_id])
VALUES('1739427091', 'i am sale staff21', 'salestaff1@gmail.com', '14 Tran Huu Thang Street, Phu Nhuan District, Ho Chi Minh City', 'male', '12345', 2)

INSERT INTO [dbo].[users]([username], [full_name], [email], [address], [gender], [password], [role_id])
VALUES('1562869061', 'i am sale staff22', 'salestaff2@gmail.com', '786A Hung Phu Street, District 8, Ho Chi Minh City', 'female', '12345', 2)

INSERT INTO [dbo].[users]([username], [full_name], [email], [address], [gender], [password], [role_id])
VALUES('1233728400', 'i am inventory staff', 'inventorystaff@gmail.com', '24/491a Le Duc Tho Street, Go Vap District, Ho Chi Minh City', 'male', '12345', 3)

INSERT INTO [dbo].[users]([username], [full_name], [email], [address], [gender], [password], [role_id])
VALUES('0899903369', 'i am customer 1', 'customer1@gmail.com', '45 Le Duan Street, District 1, Ho Chi Minh City', 'female', '12345', 4)

INSERT INTO [dbo].[users]([username], [full_name], [email], [address], [gender], [password], [role_id])
VALUES('0112345678', 'i am customer 2', 'customer2@gmail.com', '334 Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City', 'male', '12345', 4)

INSERT INTO [dbo].[users]([username], [full_name], [email], [address], [gender], [password], [role_id])
VALUES('0986425618', 'i am customer 3', 'customer3@gmail.com', '61/1 Thang Long Street, Tan Binh District, Ho Chi Minh City', 'male', '12345', 4)

/* [dbo].[orders] */

/*DBCC CHECKIDENT(orders, RESEED, 0)

DELETE FROM [dbo].[orders] where order_id=8*/

INSERT INTO [dbo].[orders](
	[receiver_name] ,
	[address] ,
	[phone] ,
	[order_time] ,
	[total] ,
	[username],
	[staff_name],
	[status]
	)
VALUES(
    'Receiver1',
	'45 Le Duan Street, District 1, Ho Chi Minh City',
	'0899903369',
	'01/10/2022',
	2300000,
	'0899903369',
	'',
	'processing'
)

INSERT INTO [dbo].[orders](
	[receiver_name] ,
	[address] ,
	[phone] ,
	[order_time] ,
	[total] ,
	[username],
	[staff_name],
	[status])
VALUES(
    'customer1',
	'45 Le Duan Street, District 1, Ho Chi Minh City',
	'0894603369',
	'09/15/2022',
	550000,
	'0899903369',
	'salestaff1',
	'done'
)

INSERT INTO [dbo].[orders](
	[receiver_name] ,
	[address] ,
	[phone] ,
	[order_time] ,
	[total] ,
	[username],
	[staff_name],
	[status]
	)
VALUES(
    'customer2',
	' Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City',
	'1233536890',
	'09/20/2022',
	1800000,
	'0112345678',
	'salestaff1',
	'canceled'
)

INSERT INTO [dbo].[orders](
	[receiver_name] ,
	[address] ,
	[phone] ,
	[order_time] ,
	[total] ,
	[username],
	[staff_name],
	[status]
	)
VALUES(
    'Receiver2',
	'533 Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City',
	'1234567890',
	'1/10/2023',
	1000000,
	'0112345678',
	'salestaff2',
	'done'
)

/* [dbo].[order_details] */

INSERT INTO [dbo].[order_details](
	[ISBN],
	[order_id],
	[price],
	[quantity])
VALUES(
    '1646512537',
	1,
	1400000,
	1
)

INSERT INTO [dbo].[order_details](
	[ISBN],
	[order_id],
	[price],
	[quantity])
VALUES(
    '1646513843',
	1,
	900000,
	1
)

INSERT INTO [dbo].[order_details](
	[ISBN],
	[order_id],
	[price],
	[quantity])
VALUES(
    '164273215X',
	2,
	250000,
	1
)

INSERT INTO [dbo].[order_details](
	[ISBN],
	[order_id],
	[price],
	[quantity])
VALUES(
    '1638585725',
	3,
	500000,
	3
)

INSERT INTO [dbo].[order_details](
	[ISBN],
	[order_id],
	[price],
	[quantity])
VALUES(
    '1646091280',
	3,
	300000,
	1
)

INSERT INTO [dbo].[order_details](
	[ISBN],
	[order_id],
	[price],
	[quantity])
VALUES(
    '1974722341',
	4,
	250000,
	4
)

/*dbo.prices*/

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1974732339', 
	250000,
	'09/15/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1974732339', 
	300000,
	'09/25/2022',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '164273215X', 
	300000,
	'08/01/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '164273215X', 
	200000,
	'10/01/2022',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '164273215X', 
	250000,
	'11/11/2022',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1974722341', 
	250000,
	'08/11/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1974722341', 
	280000,
	'10/31/2022',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1421597713', 
	930000,
	'08/31/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1421597713', 
	1000000,
	'09/30/2022',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1646091280', 
	300000,
	'08/15/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1646091280', 
	250000,
	'11/15/2022',
	'Inative'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1975344855', 
	250000,
	'01/05/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1646513843', 
	900000,
	'01/05/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1646513843', 
	700000,
	'01/05/2023',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1974734048', 
	350000,
	'07/10/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1974734048', 
	300000,
	'11/10/2022',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1646512537', 
	1400000,
	'09/20/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1638585725', 
	500000,
	'09/01/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1638585725', 
	550000,
	'12/01/2022',
	'Inative'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1974725987', 
	190000,
	'08/31/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1591167531', 
	230000,
	'08/31/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1591167531', 
	280000,
	'10/31/2022',
	'Inactive'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '9123860448', 
	900000,
	'07/17/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1569319014', 
	180000,
	'07/17/2022',
	'Active'
)

INSERT INTO [dbo].[prices](
    [ISBN], 
	[price], 
	[applicable_date], 
	[status])
VALUES(
    '1569319014', 
	200000,
	'12/17/2022',
	'Inactive'
)

/* dbo.Comment */

INSERT INTO [dbo].[comments]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1569319014','0899903369','truyện hay quá!','Active',3.7,'09/22/2022')
INSERT INTO [dbo].[comments]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1569319014','0986425618','Em thích đọc sách, đọc truyện từ hồi còn học lớp 2, những cuốn sách, cuốn truyện của em chất cao trên giá sách theo năm tháng. Có những cuốn em đã tặng hoặc cho đi, nhưng có những cuốn sách em vẫn luôn muốn giữ lại, riêng cuốn này thì em muốn vứt vào thùng rác luôn cho rồi.','Active',4.5,'09/25/2022')
INSERT INTO [dbo].[comments]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('9123860448','0112345678','truyện dở quá.','Inactive',1.0,'10/10/2022')
INSERT INTO [dbo].[comments]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1974734048','0899903369','Có ai đó đã nói rằng: “Mỗi cuốn sách là một bức tranh kì diệu, mở ra trước mắt chúng ta những chân trời tri thức. Quả thật như vậy, qua mỗi cuốn sách, ta sẽ bắt gặp những câu chuyện, những con người với từng mảnh đời, số phận khác nhau.','Active',5.0,'09/30/2022')
INSERT INTO [dbo].[comments]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1974734048','0899903369','Em tin dù là người mạnh mẽ đến đâu cũng sẽ phải rung động khi đọc cuốn sách này.','Active',3.0,'09/25/2022')
INSERT INTO [dbo].[comments]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1421597713','0112345678','Có thể nói sách là thứ không thể thiếu trong cuộc đời mỗi con người, sách cho ta tri thức, nuôi dạy tâm hồn và trí tuệ của con người. Và chắc hẳn ai cũng có ít nhất một cuốn sách yêu thích của riêng mình và tôi cũng vậy.','Active',4.8,'09/12/2022')
INSERT INTO [dbo].[comments]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1421597713','0112345678','Tôi là một đứa bé mồ côi…
Sinh ra trong một gia đình thiếu đi cái siết chặt từ bàn tay cha, và cái ôm ấm áp của mẹ. tôi đã luôn ước ao có được sự may mắn như bao đứa trẻ khác, nhưng cuộc sống chẳng rộng lòng cho ai tất cả, tôi đã thực sự sụp đổ khi đối diện trước những khổ đau ấy. Nhưng bất ngờ tìm thấy và đồng cảm với cuốn sách của một tác giả nổi tiếng Ohba Tsugumi, trong cuốn sách đã chứa đựng những khoảnh khắc đôi khi làm tôi đau đớn nhưng đôi khi lại thấy mình thật hạnh phúc.','Active',4.0,'11/25/2022')
INSERT INTO [dbo].[Comment]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1421597713','0986425618','Mỗi câu chuyện cổ là cả một thế giới kì diệu. Có thể nói đây là một khẳng định định đúng đắn và có nội dung khá sâu sắc và triết lí.','Inactive',3.7,'09/23/2022')
INSERT INTO [dbo].[Comment]([ISBN],[username],[content],[status], [star], [posted_time]) 
VALUES ('1975344855','0899903369','Có những câu chuyện đọc rồi sẽ quên. Nhưng cũng không ít quyển sách đã để lại ấn tượng khó phai, là tiền đề, mục đích, lí tưởng và là bệ phóng hướng con người tới những chân trời tương lai tươi mới.','Inactive',4.7,'10/12/2022')

