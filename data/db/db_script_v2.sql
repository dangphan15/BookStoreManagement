USE [master]
GO
/****** Object:  Database [BookStoreManagement]    Script Date: 9/26/2022 10:21:47 PM ******/
CREATE DATABASE [BookStoreManagement]

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
/****** Object:  Table [dbo].[authors]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[book_authors]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[book_genres]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[books]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[comments]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[genres]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[inventory]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[order_details]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[prices]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[publishers]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[user_roles]    Script Date: 9/26/2022 10:21:47 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 9/26/2022 10:21:47 PM ******/
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
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Akutami Gege', N'unknown', 1992, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Eiichiro Oda', N'Eiichiro Oda', 1975, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Fukuda Shinichi', N'Fukuda Shinichi', 1955, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Haruba Negi', N'Haruba Negi', 1991, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Hikawa Hirokazu', N'Hikawa Hirokazu', 1967, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Himekawa Akira', N'unknown', 0, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Isayama Hajime', N'Isayama Hajime', 1986, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Koyoharu Gotouge', N'unknown', 1989, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Maruyama Kugane', N'Muchimuchi Puririn', 1950, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Matsumoto Naoya', N'Naoya Matsumoto', 1982, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Ohba Tsugumi', N'Hiroshi Gamo', 1962, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Wakui Ken', N'Wakui Ken', 0, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Yoshihiro Togashi', N'Yoshihiro Togashi', 1966, N'')
INSERT [dbo].[authors] ([alias_name], [name], [year_of_birth], [website]) VALUES (N'Yusagi Aneko', N'Yusagi Aneko', 0, N'')
GO
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1421597713', N'Ohba Tsugumi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1569319014', N'Eiichiro Oda')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1591167531', N'Yoshihiro Togashi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1638585725', N'Wakui Ken')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'164273215X', N'Yusagi Aneko')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646091280', N'Fukuda Shinichi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646512537', N'Haruba Negi')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1646513843', N'Isayama Hajime')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974722341', N'Hikawa Hirokazu')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974725987', N'Matsumoto Naoya')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974732339', N'Akutami Gege')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1974734048', N'Himekawa Akira')
INSERT [dbo].[book_authors] ([ISBN], [author_alias]) VALUES (N'1975344855', N'Maruyama Kugane')
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
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1421597713', N'Death Note (All-in-One Edition)', N'English', N'', N'Amanda Haley', 1000000, 1.54675, N'4.63x7.13x3.2', 2017, 2400, N'Paperback', N'VIZ Media LLC', N'https://salt.tikicdn.com/cache/w1200/ts/product/96/ab/aa/897541eaf5becff293cb329e81179db0.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1569319014', N'One Piece, Vol. 1: Romance Dawn', N'English', N'As a child, Monkey D. Luffy dreamed of becoming King of the Pirates. But his life changed when he accidentally gained the power to stretch like rubber…at the cost of never being able to swim again! Years, later, Luffy sets off in search of the “One Piece,” said to be the greatest treasure in the world...', N'unknown', 200000, 0.18143, N'5x7.5x0.7', 2003, 216, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/518KKkmd1fL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1591167531', N'Hunter x Hunter, Vol. 1', N'English', N'Hunters are a special breed, dedicated to tracking down treasures, magical beasts, and even other people. But such pursuits require a license, and less than one in a hundred thousand can pass the grueling qualification exam. Those who do pass gain access to restricted areas, amazing stores of information, and the right to call themselves Hunters.', N'unknown', 230000, 0.155922, N'5x7.5x0.7', 2005, 184, N'Paperback', N'VIZ Media LLC', N'https://m.media-amazon.com/images/I/51sgb4BNN-L.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1638585725', N'Tokyo Revengers (Omnibus) Vol. 3-4', N'English', N'', N'unknown', 500000, 0.368544, N'5.86x8.24x0.97', 2022, 396, N'Paperback', N'Seven Seas', N'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/6385/9781638585725.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'164273215X', N'The Rising of the Shield Hero Volume 19: The Manga Companion', N'English', N'A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom. A gamer is magically summoned into a parallel universe, where he is chosen as one of four heroes destined to save the world from its prophesied doom.', N'unknown', 300000, 0.255146, N'5x7x1', 2022, 176, N'Paperback', N'One Peace Books', N'https://images-na.ssl-images-amazon.com/images/I/615KYcw6hxL.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1646091280', N'My Dress-Up Darling 06', N'English', N'A loner boy and a flashy girl find common ground via cosplay in this sweet and spicy romcom! Traumatized by a childhood incident with a friend who took exception to his love of traditional dolls, doll-artisan hopeful Wakana Gojou passes his days as a loner, finding solace in the home ec room at his high school.', N'Taylor Engel', 300000, 0.368544, N'5.78x8.24x0.6', 2022, 192, N'Paperback', N'Square Enix Manga', N'https://images-na.ssl-images-amazon.com/images/I/714V27eBabL.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1646512537', N'The Quintessential Quintuplets Part 1 Manga Box Set', N'English', N'A poor, straight A student is hired to tutor some rich quintuplets. The story is told as a flashback from a future that shows that he ends up getting married to one of them. A poor, straight A student is hired to tutor some rich quintuplets.', N'unknown', 1400000, 1.474175, N'5.08x7.69x4.65', 2022, 1344, N'Paperback', N'Kodansha Comics', N'https://images-na.ssl-images-amazon.com/images/I/51+rlDyWYNL._SY418_BO1,204,203,200_.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1646513843', N'Attack on Titan The Final Season Part 1 Manga Box Set', N'English', N'The War Hammer Titan defeats the Attack Titan and forces Eren out of its body. Just as she prepares to kill him, Mikasa arrives and attacks the War Hammer nape with Thunder Spears, although it turns out to be ineffective. Meanwhile, Udo is declared dead; a vengeful Gabi heads back to the battlefield. Eren realizes that Lara crystal-covered body is underground, connected by a long white cord. He transforms into the Attack Titan again and severs the cord, preparing to devour her. Porco Jaw Titan leaps onto the Attack Titan nape, but Levi arrives and slices its jaw-joint, much to Porco surprise and horror as the enemy initiates a counterattack against him.', N'unknown', 900000, 1.347169, N'5.1x7.67x4.34', 2021, 1248, N'Paperback', N'Kodansha Comics', N'https://images-na.ssl-images-amazon.com/images/I/51+ZlK-XJaL._SX453_BO1,204,203,200_.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1974722341', N'Kirby Manga Mania, Vol. 1', N'English', N'Kirby Manga Mania is a comedy manga based on the Kirby series, written and drawn by Hirokazu Hikawa. Its volumes are mainly collections of stories from throughout the 1995 - 2006 run of the series Kirby of the Stars: The Story of Dedede Who Lives In Pupupu, originally serialized in the magazine CoroCoro Comic.', N'Amanda Haley', 280000, 0.144583, N'5x7.5x0.6', 2021, 160, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/71pfJRpQLlL.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1974725987', N'Kaiju No. 8, Vol. 1', N'English', N'Kafka Hibino, a kaiju-corpse cleanup man, has always dreamed of joining the force. But when he gets another shot at achieving his childhood dream, he undergoes an unexpected transformation. How can he fight kaiju now that he is become one himself?!', N'unknown', 190000, 0.201282, N'5x7.5x0.7', 2021, 204, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/516CtkXyKOL._SX430_BO1,204,203,200_.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1974732339', N'Jujutsu Kaisen, Vol. 17', N'English', N'Jujutsu Kaisen is the story of Yuji Itadori, an easygoing high school student who joins the occult club at school. When they accidentally summon grotesque creatures by messing with a cursed object, Itadori fights to save his friends lives.', N'John Werry', 300000, 0.0850486, N'4.90x7.40x0.70', 2022, 200, N'Paperback', N'VIZ Media LLC', N'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/9747/9781974732333.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1974734048', N'The Legend of Zelda: Twilight Princess, Vol. 10', N'English', N'The story focuses on series protagonist Link, who tries to prevent Hyrule from being engulfed by a corrupted parallel dimension known as the Twilight Realm. To do so, he takes the form of both a Hylian and a wolf, and he is assisted by a mysterious creature named Midna.', N'unknown', 350000, 0.104893, N'5x7.5x0.5', 2022, 160, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/516ZvYYQTrL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'1975344855', N'Overlord, Vol. 15', N'English', N'Overlord Manga is based on the light novel series. It is a manga adaptation written by Satoshi Oshio, with art illustrated by Hugin Miyama.', N'Ixxion', 250000, 0.187107, N'5.05x7.5x0.85', 2022, 178, N'Paperback', N'Yen Press', N'https://images-na.ssl-images-amazon.com/images/I/811jQdm8-ML.jpg')
INSERT [dbo].[books] ([ISBN], [name], [language], [description], [translator], [price], [weight], [size], [year_of_publish], [number_of_page], [book_layout], [publisher_name], [image_address]) VALUES (N'9123860448', N'Demon Slayer: Kimetsu no Yaiba Vol-1-5 Books Collection set', N'English', N'In Taisho-era Japan, kindhearted Tanjiro Kamado makes a living selling charcoal. But his peaceful life is shattered when a demon slaughters his entire family. His little sister Nezuko is the only survivor, but she has been transformed into a demon herself! Tanjiro sets out on a dangerous journey to find a way to return his sister to normal and destroy the demon who ruined his life.', N'unknown', 900000, 0.195612, N'4.41x7.09x0.24', 2019, 216, N'Paperback', N'VIZ Media LLC', N'https://images-na.ssl-images-amazon.com/images/I/514ByuCVj8L._SX290_BO1,204,203,200_.jpghttps://m.media-amazon.com/images/I/51sgb4BNN-L.jpg')
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (1, N'1569319014', N'0899903369', N'truyện hay quá!', N'Active', 3.7, CAST(N'2022-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (2, N'1569319014', N'0986425618', N'Em thích đọc sách, đọc truyện từ hồi còn học lớp 2, những cuốn sách, cuốn truyện của em chất cao trên giá sách theo năm tháng. Có những cuốn em đã tặng hoặc cho đi, nhưng có những cuốn sách em vẫn luôn muốn giữ lại, riêng cuốn này thì em muốn vứt vào thùng rác luôn cho rồi.', N'Active', 4.5, CAST(N'2022-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (3, N'9123860448', N'0112345678', N'truyện dở quá.', N'Inactive', 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (4, N'1974734048', N'0899903369', N'Có ai đó đã nói rằng: “Mỗi cuốn sách là một bức tranh kì diệu, mở ra trước mắt chúng ta những chân trời tri thức. Quả thật như vậy, qua mỗi cuốn sách, ta sẽ bắt gặp những câu chuyện, những con người với từng mảnh đời, số phận khác nhau.', N'Active', 5, CAST(N'2022-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (5, N'1974734048', N'0899903369', N'Em tin dù là người mạnh mẽ đến đâu cũng sẽ phải rung động khi đọc cuốn sách này.', N'Active', 3, CAST(N'2022-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (6, N'1421597713', N'0112345678', N'Có thể nói sách là thứ không thể thiếu trong cuộc đời mỗi con người, sách cho ta tri thức, nuôi dạy tâm hồn và trí tuệ của con người. Và chắc hẳn ai cũng có ít nhất một cuốn sách yêu thích của riêng mình và tôi cũng vậy.', N'Active', 4.8, CAST(N'2022-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[comments] ([id], [ISBN], [username], [content], [status], [star], [posted_time]) VALUES (7, N'1421597713', N'0112345678', N'Tôi là một đứa bé mồ côi…
Sinh ra trong một gia đình thiếu đi cái siết chặt từ bàn tay cha, và cái ôm ấm áp của mẹ. tôi đã luôn ước ao có được sự may mắn như bao đứa trẻ khác, nhưng cuộc sống chẳng rộng lòng cho ai tất cả, tôi đã thực sự sụp đổ khi đối diện trước những khổ đau ấy. Nhưng bất ngờ tìm thấy và đồng cảm với cuốn sách của một tác giả nổi tiếng Ohba Tsugumi, trong cuốn sách đã chứa đựng những khoảnh khắc đôi khi làm tôi đau đớn nhưng đôi khi lại thấy mình thật hạnh phúc.', N'Active', 4, CAST(N'2022-11-25T00:00:00.000' AS DateTime))
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
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1569319014', 30)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1591167531', 500)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1638585725', 180)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'164273215X', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646091280', 0)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646512537', 90)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1646513843', 150)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974722341', 50)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974725987', 100)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974732339', 100)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1974734048', 200)
INSERT [dbo].[inventory] ([ISBN], [quantity]) VALUES (N'1975344855', 80)
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
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (10, 8, N'1569319014', 1, 0)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (11, 9, N'1421597713', 1, 949000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (12, 10, N'1569319014', 2, 378000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (13, 11, N'1638585725', 3, 1500000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (14, 12, N'1591167531', 11, 2530000)
INSERT [dbo].[order_details] ([id], [order_id], [ISBN], [quantity], [price]) VALUES (15, 12, N'1638585725', 2, 1000000)
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (1, N'Receiver1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-01-10T00:00:00.000' AS DateTime), 2300000, N'0899903369', N'', N'processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (2, N'customer1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0894603369', CAST(N'2022-09-15T00:00:00.000' AS DateTime), 550000, N'0899903369', N'salestaff1', N'done')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (3, N'customer2', N' Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City', N'1233536890', CAST(N'2022-09-20T00:00:00.000' AS DateTime), 1800000, N'0112345678', N'salestaff1', N'canceled')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (4, N'Receiver2', N'533 Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City', N'1234567890', CAST(N'2023-01-10T00:00:00.000' AS DateTime), 1000000, N'0112345678', N'salestaff2', N'done')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (5, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T21:47:17.237' AS DateTime), 230000, N'0899903369', NULL, N'Processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (6, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T21:56:46.270' AS DateTime), 1000000, N'0899903369', NULL, N'Processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (7, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T21:56:55.220' AS DateTime), 200000, N'0899903369', NULL, N'Processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (8, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:30:49.707' AS DateTime), 189000, N'0899903369', NULL, N'Processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (9, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:37:15.133' AS DateTime), 949000, N'0899903369', NULL, N'Processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (10, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:37:39.933' AS DateTime), 378000, N'0899903369', NULL, N'Processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (11, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-25T22:38:57.250' AS DateTime), 1500000, N'0899903369', NULL, N'Processing')
INSERT [dbo].[orders] ([order_id], [receiver_name], [address], [phone], [order_time], [total], [username], [staff_name], [status]) VALUES (12, N'i am customer 1', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'0899903369', CAST(N'2022-09-26T15:07:18.747' AS DateTime), 3530000, N'0899903369', NULL, N'Processing')
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
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Kodansha Comics', N'kodansha.us')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'One Peace Books', N'www.onepeacebooks.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Seven Seas', N'sevenseasentertainment.com')
INSERT [dbo].[publishers] ([name], [address]) VALUES (N'Square Enix Manga', N'squareenixmangaandbooks.square-enix-games.com')
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
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id]) VALUES (N'0112345678', N'i am customer 2', N'customer2@gmail.com', N'334 Huynh Van Banh Street, Phu Nhuan District, Ho Chi Minh City', N'male', N'$2a$10$nZCfh.svXV.TfJodwIAM3uHRs2dWjoM6sCWwNput8k0lV08oHnEuG', 4)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id]) VALUES (N'0899903369', N'i am customer 1', N'customer1@gmail.com', N'45 Le Duan Street, District 1, Ho Chi Minh City', N'female', N'$2a$10$CygnJAfGdqaFn5cH1B3eBO8YVFmKENFZ2ixwmTeLiYXwrXKjewgFW', 4)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id]) VALUES (N'0986425618', N'i am customer 3', N'customer3@gmail.com', N'61/1 Thang Long Street, Tan Binh District, Ho Chi Minh City', N'male', N'$2a$10$Xubh0xhayLgtppOVDybmYuOyThrP4/IvChTxogeYcTHo..i/XS8wC', 4)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id]) VALUES (N'1233728400', N'i am inventory staff', N'inventorystaff@gmail.com', N'24/491a Le Duc Tho Street, Go Vap District, Ho Chi Minh City', N'male', N'$2a$10$exNKXV7nf4GrQVTmw7cz4uZm7fv2Llvhy6ydQK1xtOV7vV1teSmLi', 3)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id]) VALUES (N'1234567890', N'i am admin', N'admin@gmail.com', N'492 Nguyen Dinh Chieu Street, District 3, Ho Chi Minh City', N'female', N'$2a$10$QcfmHmHBSFbsbNAUMlHR6.X8gR05j2Yb2oe3RXngT7QC5MBaYRqcu', 1)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id]) VALUES (N'1562869061', N'i am sale staff22', N'salestaff2@gmail.com', N'786A Hung Phu Street, District 8, Ho Chi Minh City', N'female', N'$2a$10$9NXi1CAMvAMVWWupIqtgjewtdEEz.JhDCzOXxDJ5VQpiie964ADR6', 2)
INSERT [dbo].[users] ([username], [full_name], [email], [address], [gender], [password], [role_id]) VALUES (N'1739427091', N'i am sale staff21', N'salestaff1@gmail.com', N'14 Tran Huu Thang Street, Phu Nhuan District, Ho Chi Minh City', N'male', N'$2a$10$4MoN1Nce9s338nBLSsE41uunvuESmezBZ4MvZPLqXv9H8YrHfNMuy', 2)
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
