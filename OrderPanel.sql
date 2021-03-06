USE [master]
GO
/****** Object:  Database [OrderPanel]    Script Date: 3/14/2018 6:44:29 PM ******/
CREATE DATABASE [OrderPanel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderPanel1', FILENAME = N'C:\SQLDATA\OrderPanel.mdf' , SIZE = 10240KB , MAXSIZE = 20480KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'OrderPanel1_log', FILENAME = N'C:\SQLDATA\OrderPanel_log.ldf' , SIZE = 10240KB , MAXSIZE = 204800KB , FILEGROWTH = 20%)
GO
ALTER DATABASE [OrderPanel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderPanel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderPanel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderPanel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderPanel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderPanel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderPanel] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderPanel] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OrderPanel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderPanel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderPanel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderPanel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderPanel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderPanel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderPanel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderPanel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderPanel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OrderPanel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderPanel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderPanel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderPanel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderPanel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderPanel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderPanel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderPanel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OrderPanel] SET  MULTI_USER 
GO
ALTER DATABASE [OrderPanel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderPanel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderPanel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderPanel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrderPanel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrderPanel] SET QUERY_STORE = OFF
GO
USE [OrderPanel]
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
USE [OrderPanel]
GO
/****** Object:  Table [dbo].[AuthGuard]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthGuard](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[userPassword] [varchar](50) NULL,
 CONSTRAINT [PK_AuthGuard] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [varchar](50) NULL,
	[OrderTime] [datetime] NULL,
	[OrderAmount] [int] NULL,
	[OrderPrice] [int] NULL,
	[IsComplete] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[ProductPrice] [int] NULL,
	[AvailableAmount] [int] NULL,
	[Url] [varchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddOrder]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AddOrder] @OrderName varchar(50), @OrderTime datetime, @OrderAmount int, @OrderPrice int, @IsComplete int
as
begin
	INSERT INTO Orders (OrderName, OrderTime, OrderAmount, OrderPrice, IsComplete)
	VALUES (@OrderName, @OrderTime, @OrderAmount, @OrderPrice, @IsComplete)
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AddProduct] @ProductName varchar(50), @ProductPrice int, @AvailableAmount int, @Url varchar(50)
as
begin
    INSERT INTO Products (ProductName, ProductPrice, AvailableAmount, Url)
	VALUES (@ProductName, @ProductPrice, @AvailableAmount,  @Url);
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOrder]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DeleteOrder] @OrderId int
as
begin
    delete from dbo.Orders where OrderId = @OrderId;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProduct]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DeleteProduct] @ProductId int
as
begin
    delete from dbo.Products where ProductId = @ProductId;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrder]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetOrder] @OrderId int
as
begin
    select * from dbo.Orders where OrderId = @OrderId;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrders]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetOrders]
as
begin
    select * from dbo.Orders;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProduct]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetProduct] @ProductId int
as
begin
    select * from dbo.Products where ProductId = @ProductId;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProducts]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetProducts]
as
begin
    select * from dbo.Products;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSignIn]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetSignIn] @UserName varchar(50)
as
begin
    select * from dbo.AuthGuard where userName = @UserName
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOrder]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_UpdateOrder] @OrderId int, @OrderName varchar(50), @OrderTime datetime, @OrderAmount int, @OrderPrice int, @IsComplete int
as
begin
	UPDATE Orders
    SET OrderName = @OrderName, OrderTime = @OrderTime, OrderAmount = @OrderAmount, OrderPrice = @OrderPrice, IsComplete = @IsComplete
	WHERE OrderId = @OrderId
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProduct]    Script Date: 3/14/2018 6:44:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_UpdateProduct] @ProductId int, @ProductName varchar(50), @ProductPrice int, @AvailableAmount int, @Url varchar(50)
as
begin
	UPDATE Products
    SET ProductName = @ProductName, ProductPrice = @ProductPrice, AvailableAmount = @AvailableAmount, Url = @Url
	WHERE ProductId = @ProductId
end;
GO
USE [master]
GO
ALTER DATABASE [OrderPanel] SET  READ_WRITE 
GO
