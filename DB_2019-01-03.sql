USE [master]
GO
/****** Object:  Database [LibraryManager]    Script Date: 1/3/2019 6:33:27 AM ******/
CREATE DATABASE [LibraryManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LibraryManager.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LibraryManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryManager] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManager] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManager] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManager', N'ON'
GO
USE [LibraryManager]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Author]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] NOT NULL,
	[GenreName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Media]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[AuthorID] [int] NULL,
	[Release] [date] NULL,
	[GenreID] [int] NULL,
	[SubGenreID] [int] NULL,
	[PublisherID] [int] NULL,
	[Length] [int] NULL,
	[QtyTotal] [int] NULL,
	[QtyChecked] [int] NULL,
	[ISBN] [nvarchar](13) NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[request]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[user_id] [nvarchar](128) NOT NULL,
	[timestamp] [datetime] NOT NULL CONSTRAINT [DF_request_timestamp]  DEFAULT (getdate()),
 CONSTRAINT [PK_request] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubGenre]    Script Date: 1/3/2019 6:33:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubGenre](
	[SubGenreID] [int] NOT NULL,
	[SubGenre] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubGenre] PRIMARY KEY CLUSTERED 
(
	[SubGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201812311433432_InitialCreate', N'LibraryManager.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE336167E2FB0FF41D0D36E915AB9EC0CA681DD2275926ED0DC30CE14FB36A025DA1146A2548ACA2428FACBFAB03F69FF420F254A9678D1C5566CA728508C45F23B87871FC9C3C3C3FCFFCFFF8D7F7C0E03EB09D3C48FC8C43E1A1DDA16266EE4F96439B153B6F8EE83FDE30FFFF8667CE185CFD6AF45BD135E0F5A9264623F32169F3A4EE23EE21025A3D0776994440B3672A3D0415EE41C1F1E7EEF1C1D3918206CC0B2ACF1C794303FC4D90FF8398D888B6396A2E026F2709088EF5032CB50AD5B14E224462E9ED8D7FE9C22FA7283085A623ACA1BD8D659E02350668683856D2142228618A87AFA29C1334623B29CC5F001050F2F31867A0B14245874E17455BD6B6F0E8F796F9C55C302CA4D1316853D018F4E84791CB9F95A46B64BF381012FC0D0EC85F73A33E2C4BEF270F6E9631480016481A7D380F2CA13FBA6147196C4B7988D8A86A31CF29202DCD7887E1955110FACCEED0E4A3A1D8F0EF97F07D6340D584AF184E09451141C58F7E93CF0DD5FF0CB43F40593C9C9D17C71F2E1DD7BE49DBCFF373E7957ED29F415EAD53EC0A77B1AC598826E7851F6DFB69C7A3B476E5836ABB4C9AD025C8299615B37E8F91A93257B843973FCC1B62EFD67EC155F04B93E111F2612346234859FB76910A07980CB72A75126FF7F83D4E377EF07917A8B9EFC6536F4927C983814E6D5471C64A5C9A31FE7D3AB36DE9F45B54B1A85FC779D5F79E9E7599452977726325679407489595DBBB1B3226F274A73A8E1695DA0EE3FB5B9A62ABDB5557987D6990985886DCF8642DFD795DB997167710C8397518B5BA48970DAFD6A24011C58F56A2B021D752510818EFD9DD7C38B10F9C1000B620729E08E2C7C1AE2B2973F45403F447AEB7C8F9204D603EF3F28796C501DFE3980EA33ECA614683A63288C5F5DDAFD6344F06D1ACE39FBB7276BB0A179F81A5D229745F482F0561BE35D47EE97286517C43B470C7F626E01C87F3EF861778041D439735D9C24974066EC4D23F0B60BC02BC24E8E7BC3F1356AD70EC934407EA8F748A4D5F4735175E595E86B289E89A19ACE3B6952F53A5AFAA49BAA4555B3AA798D565545B5BEAA72B06E9A8A9A6645B30AAD7AE6B506F3F7B2111ADEE1CB60F7DFE3DB6CF336AD051533CE6085C43F6382292C63DE3D620C53B21A812EEBC62E9C856CF8B8D057DF9B3249BFA2201D5AD45AB3215B04869F0D19ECFECF864C4DF8FCE47BDC2BE9700C2A2A037CA7FAFA1356FB9C9334DBF674A87573DBC2B7B30698A6CB599244AE9FCD024D004C842FEAFA830F67B5C732F2DEC8F110E81810DDE75B1E7C81BED932A9EEC8390E30C3D6999B0708A7287191A79A113AE4F550ACD851358AADE22275E5BE556402D331E58D103F042530537DC2D469E113D78F51D06A25A965C72D8CF7BD9421979CE318132EB0D5125D84EBC3205C81528E34286D161A3B15C63513D1E0B59AC6BCCD855D8DBB129DD80A275B7C67032F85FFF62AC46CB6D816C8D96C922E0A18437ABB20A838AB7425807C70D937824A27260341854BB51582D62DB60382D64DF2E6089A1F51BB8EBF745EDD377AD60FCADBDFD61BCDB5036ED6ECB167D4CC7D4F68C3A005A62A3DCFE7BC103F33CDE10CF414E7B344B8BA324538F80CB37AC866E5EF6AFD50A71944265113E08A682DA0E23250015226540FE58A585EA376C28BE8015BC4DD1A61C5DA2FC15638A062572F452B15CD57A732393B9D3ECA9E956C5048DEE9B050C1D110425EBCEA1DEF6014535C56354C175FB88F375CE998188C0603B578AE0623159D19DC4A0535DBADA473C8FAB8641B5949729F0C562A3A33B8950447DB8DA4710A7AB8051B99A8BE850F34D98A4847B9DB946563274F97121FC68E21AF6A7C83E2D827CB4A9E95F862CDF224ABE977B3FEA947618EE1B8892603A9D4B694C4228A96582A05D1A0E9A54F13768E189A231EE7997AA1524DBBB71A96FF426475FB5407B1D8078ADAFCDF227AA7BDC2AF6DB7AA3F22602EA19321776AB248BA8602FAE6164F7D4301A29AE0FD340AD290987D2C73EBFC0AAFDA3EFFA2228C1D497FC587520CA678BA75EB771A1B755E0C374EA517B3FE5899214C162F7CD0AACD4D7EA919A5085355514CA1AB9D8D9DC99DE93B5EB2B3D87FB85A115E6776890C952A80F8D413A392E4A08055CABAA3D6F350AA98F592EE8852B24915522AEAA16535A5A4A664B5602D3C8345F535BA4B509348AAE86A6977644D3A49155A53BC06B64667B9AC3BAA26E3A40AAC29EE8EBD4A3F91D7D13DDEBF8C47984D36B0FCA0BBD90E66C0789D4571980DB0729F5F05AA7CEE89256EEC1530F17D2F09653CED6D42A83CC4B119A10C18E6F5A776195E5F7E1A6FF0CD98B51BEEDA12DF74C36FC6EB47DB57258772DE93AB94D2CB739F74BE1B8BB356FBE31AE5F09557B1ADC28CB0BDBF240C87235E6134FB2D98063EE68B795101A8E62F70C2F2AC0EFBF8F0E8587A9CB33F0F659C24F102CD59D5F45AA63E665B48D0224F88BA8F88AAE9121B3C2659812A91E82BE2E1E789FD7BD6EA340B6AF07F659F0FACABE413F17F4BA1E081A6D8FA434DFF1C26B9BEF9B4B5A74F21BA5BF5EABF9FF3A607D61D8519736A1D4AB65C6784EB0F247A699337DD409BB59F4DBCDD09557B8DA0459526C4FA8F0FE63E1BE4E141A1E53F43F4FCAFBEAA691F176C84A879403014DE2026343D105807CBF838C0839F2C7B1CD0AFB3FAC702EBA8667C28E093FE60F23381EECB50D172875B8DE658B48D2529B3736B9AF5463997BBDE9B946CEC8D26BA9A71DD036E83ACEA3598F1C6129207DB1D35F9C68361EF92DAAF9E64BC2F79C5AB8C8FDDA6136F3383B8E17EE86F9538BC07A96E9AD49DDDA7076F9B6BA650EE9EE758F64B02DE33B28984AEDDA7FA6E9B6CA630EF9E93AD5742EF9E716D57FBE78E99D6790BDD797AAE9A6964B892D1C582DBD26FF3C0399CF0E7119020F728F35793FA7CAFA65CD51681AB2A66A1E6443359B0327114B94A8D66B1FDFA2A36FCC6CE8A3ACD620DE9994DB2C5FADF285BD469966D487ADC45E2B036ED5097CCDDB28E356543BDA544E15A4F5AF2D2DB7CD6C6FBF5B794173C88516AB3C77047FC76D2800731C99053A747DAAF7ADD0B7B67E52F2EC2FE9DF8CB1504FFFB8B04BBB55DB3AC73451651B1794B1A1555A408CD0D66C8832DF58C327F815C06C53CC69C3DFBCEE276FCA6638EBD2B7297B23865D0651CCE835AC08B3B014DF2B3DCE6BACEE3BB38FB0B26437401D4F4796CFE8EFC94FA8157EA7DA989091920B8772122BA7C2C198FEC2E5F4AA4DB88740412E62B9DA2071CC60180257764869EF03ABA01FDAEF112B92FAB08A009A47D20EA661F9FFB68495198088C557BF8091CF6C2E71FFE021681D62378540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'091a8b8a-7161-4603-b51f-9d58a94b0ae3', N'user@library.com', 0, N'AJ7qJLnzZvpp06kt1icz1wfwEgVK3DtGr64KYSPowRhYco5guftQ/Ow7uuv5AUbxFQ==', N'4ecbc77f-87ac-46c0-9892-ff3c9259d57d', NULL, 0, 0, NULL, 1, 0, N'user@library.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0fc85433-af91-4b29-b1fe-6aad9487a644', N'test_20190103_0432@library.com', 0, N'AM1wTO8re4XxDYfdWyiCA+Y4jU8Mmlo3tHviks+1LJHvxsMfy5U6dG1etEAiTD/xBQ==', N'f83ca5f5-7433-4ac3-9b09-8d7064d519bd', NULL, 0, 0, NULL, 1, 0, N'test_20190103_0432@library.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2d4a4134-a6b1-4cc5-8486-384e3be0fd06', N'test_20190103_0431@library.com', 0, N'ABEPBXgi8S5iBahlaC3KnL1BdOIVc9Ylwt4IxEA7s8uH6QYmYlTVLGtFuoiNXDnWmA==', N'ffa17c1a-0d4d-4bc0-b9e1-cc17870e8d95', NULL, 0, 0, NULL, 1, 0, N'test_20190103_0431@library.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'83c75e54-4eb0-4c19-b0ff-fbb6c7c69110', N'test_20190103_0500@library.com', 0, N'AJgGzj/dSjEvP+p+G5e9BJ6FMH8flgILSF74p0UCmxm8EoClMnriU72TUhrdJajf5Q==', N'5d05f6e2-9bd1-4544-bb7f-a97bc641eef4', NULL, 0, 0, NULL, 1, 0, N'test_20190103_0500@library.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9a78afae-4681-4078-a749-d4334c4115d3', N'test_20190103_0514@library.com', 0, N'AAaRMSSgO1qQGEsD/s+8AXL4+QLyOuRcIz7+KImTkOCYymapXUYNeetQSVMbAtHZkA==', N'09d5569b-e506-4e17-988d-176a401c6dc6', NULL, 0, 0, NULL, 1, 0, N'test_20190103_0514@library.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b39548fe-a0d9-4a8a-8663-b271f9ffda30', N'test_20190103_0515@library.com', 0, N'AIoXB/aPg+zDAgRIEOIKf2sLpK4huDmgr5q7eMKMHRWi+DbkzHnxXMqQQTrSvqNIyQ==', N'46927e45-e21a-4b45-9fe4-60dd460b42dc', NULL, 0, 0, NULL, 1, 0, N'test_20190103_0515@library.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c6cac969-6202-46cb-b531-4d36db6b2e20', N'jenna@jenna.com', 0, N'AGmdplO5DOmA0XOKhubI7Wgn+L2fyiNTRwhwQiRGsCDK+bZL5ecnvddG5UZLh3AxAA==', N'b54e71ae-2fb8-4c26-aa01-fd110bca34ee', NULL, 0, 0, NULL, 1, 0, N'jenna@jenna.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f175ae87-2543-4fab-ae86-a673abdd4f9c', N'test_20190103_0528@library.com', 0, N'ANs13a9o5AKielEJ8McFl6by0RuxEbtw6xPKh/fxJrdfqKXi9jU8EEcAuC2fXYNgTQ==', N'e585cf19-1461-42d5-9735-c39bf6a12de1', NULL, 0, 0, NULL, 1, 0, N'test_20190103_0528@library.com')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (1, N'J.K.', N'Rowling')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (2, N'J.R.R.', N'Tolkien')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (3, N'Stephen', N'King')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (4, N'Cassandra', N'Clare')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (5, N'Holly', N'Black')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (6, N'Rick', N'Riordan')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (7, N'Stan', N'Lee')
INSERT [dbo].[Author] ([AuthorID], [FirstName], [LastName]) VALUES (8, N'Stephanie', N'Meyer')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (1, N'Fiction')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (2, N'Non-fiction')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (3, N'Reference')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (4, N'Biography')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (5, N'Children''s')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (101, N'Harry Potter and the Sorcerer''s Stone', 1, NULL, 1, 5, 1, 300, 5, 1, N'9780590353403')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (102, N'Harry Potter and the Chamber of Secrets', 1, NULL, 1, 5, 1, 320, 5, 3, N'9780439064866')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (103, N'Harry Potter and the Prisoner of Azkaban', 1, NULL, 1, 5, 1, 360, 5, 1, N'9787020033454')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (104, N'Harry Potter and the Goblet of Fire', 1, NULL, 1, 5, 1, 480, 5, 2, N'9781594130038')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (105, N'Harry Potter and the Order of the Phoenix', 1, NULL, 1, 5, 1, 510, 5, 3, N'9780439358064')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (106, N'Harry Potter and the Half-Blood Prince', 1, NULL, 1, 5, 1, 530, 5, 0, N'9780439784542')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (107, N'Harry Potter and the Deathly Hallows', 1, NULL, 1, 5, 1, 580, 5, 2, N'9780545010221')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (127, N'Encyclopedia Brittanica ', 7, NULL, 3, 8, 1, 1000000, 1, 0, N'9780852294437')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (201, N'The Hobbit', 2, NULL, 1, 2, 2, 300, 2, 0, N'9780091884888')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (202, N'The Lord of the Rings: The Fellowship of the RIng', 2, NULL, 1, 2, 2, 325, 2, 0, N'9780618129034')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (203, N'The Lord of the Rings : The Two Towers', 2, NULL, 1, 2, 2, 335, 2, -1, N'9780618129089')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (204, N'The Lord of the Rings : Return of the King', 2, NULL, 1, 2, 2, 350, 2, 0, N'9780395312681')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (222, N'Twilight', 8, NULL, 2, 10, 3, 400, 4, 1, N'9780316015844')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (223, N'New Moon', 8, NULL, 2, 10, 3, 420, 4, 0, N'9780316024969')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (224, N'Eclipse', 8, NULL, 2, 10, 3, 450, 4, 3, N'9780316160209')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (225, N'Breaking Dawn', 8, NULL, 2, 10, 3, 490, 4, 3, N'9780316067928')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (280, N'City of Bones', 4, NULL, 1, 9, 1, 300, 1, 0, N'9781416914280')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (281, N'City of Ashes', 4, NULL, 1, 9, 1, 350, 1, 0, N'9781416914297')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (282, N'City of Glass', 4, NULL, 1, 9, 1, 350, 1, 0, N'9781416914303')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (345, N'Percy Jackson: The Lightning Thief', 6, NULL, 5, 2, 3, 200, 3, 0, N'9780786838653')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (346, N'Percy Jackson: The Sea of Monsters', 6, NULL, 5, 2, 3, 210, 3, 0, N'9781423103349')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (347, N'Percy Jackson: The Titan''s Curse', 6, NULL, 5, 2, 3, 230, 3, 0, N'9781423101482')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (348, N'Percy Jackson: The Battle of the Labyrinth', 6, NULL, 5, 2, 3, 250, 3, 0, N'9781423101499')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (349, N'Percy Jackson: The Last Olympian', 6, NULL, 5, 2, 3, 265, 3, 0, N'9781423101505')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (664, N'The Shining', 3, NULL, 4, 4, 2, 321, 3, 0, N'9788371802072')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (665, N'Dreamcatcher', 3, NULL, 4, 4, 2, 358, 2, 1, N'9780613502993')
INSERT [dbo].[Media] ([ID], [Title], [AuthorID], [Release], [GenreID], [SubGenreID], [PublisherID], [Length], [QtyTotal], [QtyChecked], [ISBN]) VALUES (666, N'It', 3, NULL, 4, 3, 2, 666, 6, 6, N'9788401499968')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Country]) VALUES (1, N'Scholastic', N'USA')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Country]) VALUES (2, N'Penguin', N'UK')
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Country]) VALUES (3, N'Hyperion', N'China')
SET IDENTITY_INSERT [dbo].[request] ON 

INSERT [dbo].[request] ([id], [title], [author], [user_id], [timestamp]) VALUES (1, N'test', N'testAuthor', N'091a8b8a-7161-4603-b51f-9d58a94b0ae3', CAST(N'2019-01-03 02:21:45.167' AS DateTime))
INSERT [dbo].[request] ([id], [title], [author], [user_id], [timestamp]) VALUES (2, N'test', N'testAuthor', N'091a8b8a-7161-4603-b51f-9d58a94b0ae3', CAST(N'2019-01-03 02:26:25.017' AS DateTime))
INSERT [dbo].[request] ([id], [title], [author], [user_id], [timestamp]) VALUES (3, N'test3', N'testauthor3', N'091a8b8a-7161-4603-b51f-9d58a94b0ae3', CAST(N'2019-01-03 02:26:59.953' AS DateTime))
INSERT [dbo].[request] ([id], [title], [author], [user_id], [timestamp]) VALUES (4, N'', N'', N'091a8b8a-7161-4603-b51f-9d58a94b0ae3', CAST(N'2019-01-03 05:45:17.757' AS DateTime))
INSERT [dbo].[request] ([id], [title], [author], [user_id], [timestamp]) VALUES (5, N'The Hitchhiker''s Guide to the Galaxy', N'Douglas Adams', N'091a8b8a-7161-4603-b51f-9d58a94b0ae3', CAST(N'2019-01-03 05:48:20.070' AS DateTime))
SET IDENTITY_INSERT [dbo].[request] OFF
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (1, N'Sci-Fi')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (2, N'Adventure')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (3, N'Autobiography')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (4, N'Biography')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (5, N'Fantasy')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (6, N'Picture Book')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (7, N'Textbook')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (8, N'Encyclopedia')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (9, N'Young Adult')
INSERT [dbo].[SubGenre] ([SubGenreID], [SubGenre]) VALUES (10, N'Historical')
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/3/2019 6:33:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 1/3/2019 6:33:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 1/3/2019 6:33:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 1/3/2019 6:33:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 1/3/2019 6:33:27 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/3/2019 6:33:27 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Media] FOREIGN KEY([ID])
REFERENCES [dbo].[Media] ([ID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Media]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_authorID_FK] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_authorID_FK]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_genreID_FK] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_genreID_FK]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_PublisherID_FK] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_PublisherID_FK]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [media_subgenreID_FK] FOREIGN KEY([SubGenreID])
REFERENCES [dbo].[SubGenre] ([SubGenreID])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [media_subgenreID_FK]
GO
USE [master]
GO
ALTER DATABASE [LibraryManager] SET  READ_WRITE 
GO
