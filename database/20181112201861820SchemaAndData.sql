USE [master]
GO
/****** Object:  Database [Bangazon]    Script Date: 11/12/2018 6:18:58 PM ******/
CREATE DATABASE [Bangazon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bangazon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bangazon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bangazon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bangazon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bangazon] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bangazon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bangazon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bangazon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bangazon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bangazon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bangazon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bangazon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bangazon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bangazon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bangazon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bangazon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bangazon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bangazon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bangazon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bangazon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bangazon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bangazon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bangazon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bangazon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bangazon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bangazon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bangazon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bangazon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bangazon] SET RECOVERY FULL 
GO
ALTER DATABASE [Bangazon] SET  MULTI_USER 
GO
ALTER DATABASE [Bangazon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bangazon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bangazon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bangazon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bangazon] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bangazon', N'ON'
GO
ALTER DATABASE [Bangazon] SET QUERY_STORE = OFF
GO
USE [Bangazon]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Bangazon]
GO
/****** Object:  Table [dbo].[computer]    Script Date: 11/12/2018 6:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[computer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[purchase_date] [datetime] NOT NULL,
	[decommissioned] [datetime] NULL,
	[employee_id] [int] NULL,
	[in_use] [bit] NOT NULL,
	[is_malfunctioning] [bit] NOT NULL,
 CONSTRAINT [PK__computer__3213E83FCBD1F7B0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[date_joined] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__customer__3213E83F85423B68] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[name] [varchar](255) NOT NULL,
	[expense_budget] [int] NOT NULL,
	[supervisor_id] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__departme__3213E83F9F8D443F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[name] [varchar](255) NOT NULL,
	[is_supervisor] [bit] NOT NULL,
	[department_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__employee__3213E83FEA1746C8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_training_program_pair]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_training_program_pair](
	[training_program_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__employee__3213E83F8599B7FD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_product_pair]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_product_pair](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__order_pr__3213E83F5FC92363] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[customer_id] [int] NOT NULL,
	[order_status] [bit] NOT NULL,
	[can_complete] [bit] NOT NULL,
	[payment_type_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__orders__3213E83F4CF09FF0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_type]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_type](
	[account_number] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__payment___3213E83FD0F55F83] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[category] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[quantity] [int] NOT NULL,
	[owner_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__product__3213E83F9BE391B5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_types]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_types](
	[category] [varchar](255) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__product___3213E83FD4D7E369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_programs]    Script Date: 11/12/2018 6:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_programs](
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[max_attendees] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__training__3213E83F6BB37FB3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[computer]  WITH CHECK ADD  CONSTRAINT [FK__computer__employ__160F4887] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[computer] CHECK CONSTRAINT [FK__computer__employ__160F4887]
GO
ALTER TABLE [dbo].[department]  WITH CHECK ADD  CONSTRAINT [FK__departmen__super__0C85DE4D] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[department] CHECK CONSTRAINT [FK__departmen__super__0C85DE4D]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK__employee__depart__0B91BA14] FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK__employee__depart__0B91BA14]
GO
ALTER TABLE [dbo].[employee_training_program_pair]  WITH CHECK ADD  CONSTRAINT [FK__employee___emplo__0D7A0286] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[employee_training_program_pair] CHECK CONSTRAINT [FK__employee___emplo__0D7A0286]
GO
ALTER TABLE [dbo].[employee_training_program_pair]  WITH CHECK ADD  CONSTRAINT [FK__employee___train__0E6E26BF] FOREIGN KEY([training_program_id])
REFERENCES [dbo].[training_programs] ([id])
GO
ALTER TABLE [dbo].[employee_training_program_pair] CHECK CONSTRAINT [FK__employee___train__0E6E26BF]
GO
ALTER TABLE [dbo].[order_product_pair]  WITH CHECK ADD  CONSTRAINT [FK__order_pro__order__123EB7A3] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_product_pair] CHECK CONSTRAINT [FK__order_pro__order__123EB7A3]
GO
ALTER TABLE [dbo].[order_product_pair]  WITH CHECK ADD  CONSTRAINT [FK__order_pro__produ__1332DBDC] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_product_pair] CHECK CONSTRAINT [FK__order_pro__produ__1332DBDC]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__customer__114A936A] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__customer__114A936A]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__payment___151B244E] FOREIGN KEY([payment_type_id])
REFERENCES [dbo].[payment_type] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__payment___151B244E]
GO
ALTER TABLE [dbo].[payment_type]  WITH CHECK ADD  CONSTRAINT [FK__payment_t__custo__10566F31] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[payment_type] CHECK CONSTRAINT [FK__payment_t__custo__10566F31]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__categor__0F624AF8] FOREIGN KEY([category])
REFERENCES [dbo].[product_types] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__categor__0F624AF8]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__owner_i__14270015] FOREIGN KEY([owner_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__owner_i__14270015]
GO
USE [master]
GO
ALTER DATABASE [Bangazon] SET  READ_WRITE 
GO
