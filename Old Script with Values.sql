USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 8/6/2019 12:16:28 PM ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Bank.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Bank_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bank', N'ON'
GO
USE [Bank]
GO
/****** Object:  StoredProcedure [dbo].[addCustomer]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[addCustomer]
@custName varchar(30),
@gender varchar(3),
@dob varchar(20),
@address varchar(60),
@state varchar(20),
@city varchar(20),
@pincode varchar(10),
@phoneNo varchar(10),
@email varchar(30),
@createdDate varchar(20),
@editedDate varchar(20),
@userId varchar(20),
@branchId varchar(20),
@managerId int
as
insert into Customer values(@custName, @gender, @dob, @address, @state, @city, @pincode, @phoneNo, @email, @createdDate, @editedDate, @userId,@branchId,@managerId)
 
GO
/****** Object:  StoredProcedure [dbo].[addDetails]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[addDetails]
@customerId int,
@accounttype varchar(10),
@DateOfOpen varchar(15),
@status varchar(10),
@dateOfEdited varchar(15),
@ClosingDate varchar(15),
@amount int,
@type varchar(10)
as
insert into Account values(@customerId,@accounttype,@DateOfOpen,@status,@dateOfEdited,@ClosingDate,@amount,@type)

GO
/****** Object:  StoredProcedure [dbo].[addLogin]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addLogin]
@userId varchar(20),
@password varchar(20),
@role varchar(10)
as
insert into Login values(@userId, @password, @role)


GO
/****** Object:  StoredProcedure [dbo].[addManager]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[addManager]
@managerName varchar(50),
@branchId varchar(50),
@address varchar(50),
@phoneNo varchar(50),
@email varchar(50)
as
insert into Manager values(@managerName, @branchId, @address, @phoneNo, @email);
update Branch set assigned = 1 where branchId=@branchId
GO
/****** Object:  StoredProcedure [dbo].[balanceEnq]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[balanceEnq]
@acc bigint
as
select amount from Account where accountNo=@acc;


GO
/****** Object:  StoredProcedure [dbo].[changeMedal]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[changeMedal]
@amt int,
@acc bigint
as
update account  set type = (select type from CustomerMedal where @amt between min and max) where accountNo= @acc; 

GO
/****** Object:  StoredProcedure [dbo].[changePass]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[changePass]
@uid varchar(20)
as
select [password] from Login where userId=@uid;


GO
/****** Object:  StoredProcedure [dbo].[checkAcc]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkAcc]
@acc bigint
as 
select customerId from Account where accountNo=@acc;


GO
/****** Object:  StoredProcedure [dbo].[checkAmo]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkAmo]
@acc bigint
as
select amount from Account where accountNo=@acc;


GO
/****** Object:  StoredProcedure [dbo].[checkCre]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkCre]
@uid varchar(20)
as
select [password],role from Login where userId=@uid;  



GO
/****** Object:  StoredProcedure [dbo].[checkCust]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkCust]
@customerID int
as 
select userId from Customer where customerId=@customerID;


GO
/****** Object:  StoredProcedure [dbo].[checkMedal]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkMedal]
@amt int 
as
select type from CustomerMedal where @amt between min and max; 

GO
/****** Object:  StoredProcedure [dbo].[datecheck]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[datecheck] 
@acc bigint,
@start varchar(50),
@end varchar(50)
as 
select transactionId,fromAccountNo,toAccountNo,transactionDate,amount,transactionType,comments from [Transaction] where transactionDate between @start and @end;


GO
/****** Object:  StoredProcedure [dbo].[deleteCustomer]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[deleteCustomer]
@custId int
as
declare @email varchar(20)
select @email = (select email from Customer where customerId = @custId)
delete from Account where customerId = @custId
delete from Customer where customerId = @custId
delete from Login where userId = @email



GO
/****** Object:  StoredProcedure [dbo].[deleteDetails]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteDetails]
@accountNo int
as
delete from Account where accountNo=@accountNo




GO
/****** Object:  StoredProcedure [dbo].[deleteManager]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[deleteManager]
@managerId varchar(50)
as
delete from Manager where managerId=@managerId
 
GO
/****** Object:  StoredProcedure [dbo].[deposit]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deposit]
@acc bigint,
@amt int
as
update Account set amount=amount+@amt where accountNo=@acc


GO
/****** Object:  StoredProcedure [dbo].[editedDetails]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[editedDetails]
@accountNo bigint,

@accounttype varchar(10),
@type varchar(50),
@status varchar(10),
@dateOfEdited varchar(15),
@ClosingDate varchar(15),
@amount int
as
update Account set accounttype=@accounttype,[status]=@status,dateOfEdited=@dateOfEdited,Closingdate=@ClosingDate,amount=@amount,[type]=@type 
where accountNo=@accountNo



GO
/****** Object:  StoredProcedure [dbo].[editManager]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[editManager]
@managerId int,
@managerName varchar(50),
@address varchar(50),
@phoneNo varchar(50),
@emailId varchar(50),
@branchId varchar(50)
as
update Branch set assigned = 1 where branchId = @branchId
update Manager set managerName=@managerName, address=@address, phoneNo=@phoneNo, userId=@emailId, branchId=@branchId where managerId = @managerId
GO
/****** Object:  StoredProcedure [dbo].[getAllCustomers]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllCustomers]
as
select * from Customer


GO
/****** Object:  StoredProcedure [dbo].[getBranch]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getBranch]
@userId varchar(20)
as
select branchId from Manager where userId=@userId;
GO
/****** Object:  StoredProcedure [dbo].[getCustomerName]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getCustomerName]
@uid varchar(30)
as
select customerName from Customer where userId=@uid;



GO
/****** Object:  StoredProcedure [dbo].[getMedal]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getMedal]
@acc bigint
as
select type from account where accountNo=@acc;
GO
/****** Object:  StoredProcedure [dbo].[getSpecificCustomer]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getSpecificCustomer]
@custId int
as
select * from Customer where customerId = @custId


GO
/****** Object:  StoredProcedure [dbo].[insTrans]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insTrans]
@acc1 bigint,
@acc2 bigint,
@amt int,
@type varchar(20),
@comment varchar(30),
@Date varchar(20)
as 
insert into [Transaction] values(@acc1,@acc2,@Date,@amt,@type,@comment);


GO
/****** Object:  StoredProcedure [dbo].[ministategen]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ministategen]
@acc bigint
as
select top 10 * from [Transaction] where fromAccountNo=@acc or toAccountNo=@acc order by transactionDate desc;


GO
/****** Object:  StoredProcedure [dbo].[prints]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prints]
@id varchar(20)
as
select accountNo,accountType,[status] from Account where customerId in(select customerId from Customer where userId=@id)



GO
/****** Object:  StoredProcedure [dbo].[transferAdd]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[transferAdd]
@amt int,
@acc varchar(20)
as
update Account set amount=@amt+amount where accountNo=@acc;



GO
/****** Object:  StoredProcedure [dbo].[transferSub]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[transferSub]
@amt int,
@acc varchar(20)
as
update Account set amount=amount-@amt where accountNo=@acc;


GO
/****** Object:  StoredProcedure [dbo].[updateCustomer]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateCustomer]
@custId int,
@custName varchar(30),
@gender varchar(3),
@dob varchar(20),
@address varchar(60),
@state varchar(20),
@city varchar(20),
@pincode varchar(10),
@phoneNo varchar(10),
@editedDate varchar(20)
as
update Customer set customerName = @custName, gender = @gender, dob = @dob, address = @address, state = @state,
city = @city, pincode = @pincode, phoneNo = @phoneNo,editedDate = @editedDate
where customerId = @custId
GO
/****** Object:  StoredProcedure [dbo].[updatePass]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updatePass]
@uid varchar(20),
@pass varchar(20)
as
update Login set password=@pass where userId=@uid;


GO
/****** Object:  StoredProcedure [dbo].[updateUserID]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateUserID]
@newuserId varchar(20),
@olduserId varchar(20)
as
update Login set userId = @newuserId where userId = @olduserId


GO
/****** Object:  StoredProcedure [dbo].[withdraw]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[withdraw]
@acc bigint,
@amt int
as
update Account set amount=amount-@amt where accountNo=@acc


GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[accountNo] [bigint] IDENTITY(1504000000,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[accountType] [varchar](10) NOT NULL,
	[DateOfOpen] [varchar](15) NOT NULL,
	[status] [varchar](10) NOT NULL,
	[dateOfEdited] [varchar](15) NULL,
	[ClosingDate] [varchar](15) NULL,
	[amount] [int] NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[branchName] [varchar](50) NULL,
	[branchId] [varchar](50) NOT NULL,
	[assigned] [int] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[branchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [int] IDENTITY(1000,1) NOT NULL,
	[customerName] [varchar](30) NOT NULL,
	[gender] [varchar](3) NOT NULL,
	[dob] [varchar](20) NOT NULL,
	[address] [varchar](60) NOT NULL,
	[state] [varchar](20) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[pincode] [varchar](10) NOT NULL,
	[phoneNo] [varchar](10) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[createdDate] [varchar](20) NOT NULL,
	[editedDate] [varchar](20) NOT NULL,
	[userId] [varchar](20) NOT NULL,
	[branchId] [varchar](50) NULL,
	[managerId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerMedal]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerMedal](
	[type] [varchar](50) NOT NULL,
	[min] [int] NULL,
	[max] [int] NULL,
 CONSTRAINT [PK_CustomerMedal] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[userId] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manager](
	[managerName] [varchar](50) NULL,
	[branchId] [varchar](50) NOT NULL,
	[managerId] [int] IDENTITY(8000,1) NOT NULL,
	[address] [varchar](50) NULL,
	[phoneNo] [varchar](50) NULL,
	[userId] [varchar](20) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[managerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 8/6/2019 12:16:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaction](
	[transactionId] [bigint] IDENTITY(6524000000,1) NOT NULL,
	[fromAccountNo] [bigint] NOT NULL,
	[toAccountNo] [bigint] NOT NULL,
	[transactionDate] [varchar](50) NOT NULL,
	[amount] [int] NOT NULL,
	[transactionType] [varchar](15) NOT NULL,
	[comments] [varchar](50) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountNo], [customerId], [accountType], [DateOfOpen], [status], [dateOfEdited], [ClosingDate], [amount], [type]) VALUES (1504000000, 1000, N'Savings', N'7/19/2019', N'Open', N'8/5/2019 3:58:2', N'', 7813, N'Bronze')
INSERT [dbo].[Account] ([accountNo], [customerId], [accountType], [DateOfOpen], [status], [dateOfEdited], [ClosingDate], [amount], [type]) VALUES (1504000001, 1000, N'Current', N'7/19/2019', N'Open', N'7/19/2019', NULL, 11963, N'Bronze')
INSERT [dbo].[Account] ([accountNo], [customerId], [accountType], [DateOfOpen], [status], [dateOfEdited], [ClosingDate], [amount], [type]) VALUES (1504000006, 1000, N'Current', N'7/23/2019 6:25:', N'Close', N'8/5/2019 4:27:1', N'', 285200, N'Gold')
INSERT [dbo].[Account] ([accountNo], [customerId], [accountType], [DateOfOpen], [status], [dateOfEdited], [ClosingDate], [amount], [type]) VALUES (1504010004, 1000, N'Current', N'8/5/2019 4:26:3', N'Close', N'8/5/2019 4:26:5', N'', 10000, N'Bronze')
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Branch] ([branchName], [branchId], [assigned]) VALUES (N'Gachibowli', N'GCB', 0)
INSERT [dbo].[Branch] ([branchName], [branchId], [assigned]) VALUES (N'Kukatpally', N'KKP', 0)
INSERT [dbo].[Branch] ([branchName], [branchId], [assigned]) VALUES (N'Kondapur', N'KPR', 0)
INSERT [dbo].[Branch] ([branchName], [branchId], [assigned]) VALUES (N'Mehdipatnam', N'MHD', 0)
INSERT [dbo].[Branch] ([branchName], [branchId], [assigned]) VALUES (N'Uppal', N'UPL', 1)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerId], [customerName], [gender], [dob], [address], [state], [city], [pincode], [phoneNo], [email], [createdDate], [editedDate], [userId], [branchId], [managerId]) VALUES (1000, N'Raj', N'M', N'07/29/2019', N'07/22/2010', N'Telangana', N'Hyderabad', N'500072', N'8686869430', N'soma@123', N'7/19/2019', N'8/5/2019', N'raj', N'KKP', 8000)
INSERT [dbo].[Customer] ([customerId], [customerName], [gender], [dob], [address], [state], [city], [pincode], [phoneNo], [email], [createdDate], [editedDate], [userId], [branchId], [managerId]) VALUES (1001, N'Vineth', N'M', N'25/8/1998', N'ss', N'Telangana', N'Hyderabad', N'500017', N'98989898', N'vin@gmail', N'7/25/2019', N'7/25/2019', N'vineeth', N'GCB', 8001)
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[CustomerMedal] ([type], [min], [max]) VALUES (N'Bronze', 0, 10000)
INSERT [dbo].[CustomerMedal] ([type], [min], [max]) VALUES (N'Gold', 200001, 500000)
INSERT [dbo].[CustomerMedal] ([type], [min], [max]) VALUES (N'Platinum', 500001, 1000000)
INSERT [dbo].[CustomerMedal] ([type], [min], [max]) VALUES (N'Silver', 10001, 200000)
INSERT [dbo].[Login] ([userId], [password], [role]) VALUES (N'gsyhuj', N'MTIzNDU2', N'Manager')
INSERT [dbo].[Login] ([userId], [password], [role]) VALUES (N'raj', N'MTIz', N'Customer')
INSERT [dbo].[Login] ([userId], [password], [role]) VALUES (N'ram', N'MTIzNDU2', N'Manager')
INSERT [dbo].[Login] ([userId], [password], [role]) VALUES (N'soma123', N'MTIzNDU=', N'Manager')
INSERT [dbo].[Login] ([userId], [password], [role]) VALUES (N'vinay', N'MTIz', N'Manager')
INSERT [dbo].[Login] ([userId], [password], [role]) VALUES (N'vineeth', N'MTIz', N'BankManager')
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([managerName], [branchId], [managerId], [address], [phoneNo], [userId]) VALUES (N'Soma', N'KKP', 8000, N'jjdjsj', N'852568562', N'soma123')
INSERT [dbo].[Manager] ([managerName], [branchId], [managerId], [address], [phoneNo], [userId]) VALUES (N'Vinay', N'GCB', 8001, N'as', N'852114585', N'vinay')
INSERT [dbo].[Manager] ([managerName], [branchId], [managerId], [address], [phoneNo], [userId]) VALUES (N'ram', N'UPL', 8008, N'abchi', N'7415863', N'ram')
INSERT [dbo].[Manager] ([managerName], [branchId], [managerId], [address], [phoneNo], [userId]) VALUES (N'grfa', N'UPL', 8009, N'gsdycgy', N'sjchuj', N'gsyhuj')
SET IDENTITY_INSERT [dbo].[Manager] OFF
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000000, 1504000006, 1504000000, N'8/1/2019 12:50:37 PM', 40000, N'FundTransfer', N'aa')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000001, 1504000000, 1504000006, N'8/1/2019 12:55:19 PM', 40000, N'FundTransfer', N'aa')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000002, 1504000000, 1504000006, N'8/1/2019 1:03:35 PM', -10000, N'FundTransfer', N'aa')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000003, 1504000000, 1504000006, N'8/1/2019 2:46:43 PM', 200, N'FundTransfer', N'xx')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000004, 1504000001, 1504000006, N'8/1/2019 4:15:44 PM', 5000, N'FundTransfer', N'soma')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000005, 1504000001, 1504000006, N'8/2/2019 12:47:30 PM', 240000, N'FundTransfer', N's')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000006, 1504000000, 1504000001, N'8/2/2019 2:20:36 PM', 5000, N'FundTransfer', N'jas')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000007, 1504000000, 1504000001, N'8/2/2019 4:19:52 PM', 699, N'FundTransfer', N'jfgdf')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000008, 1504000000, 1504000000, N'8/2/2019 4:30:08 PM', 1000, N'withdraw', N'withdraw done')
INSERT [dbo].[Transaction] ([transactionId], [fromAccountNo], [toAccountNo], [transactionDate], [amount], [transactionType], [comments]) VALUES (6524000009, 1504000000, 1504000000, N'8/2/2019 4:35:13 PM', 5876, N'deposit', N'deposit done')
SET IDENTITY_INSERT [dbo].[Transaction] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_CustomerMedal] FOREIGN KEY([type])
REFERENCES [dbo].[CustomerMedal] ([type])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_CustomerMedal]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer] FOREIGN KEY([branchId])
REFERENCES [dbo].[Branch] ([branchId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Manager] FOREIGN KEY([managerId])
REFERENCES [dbo].[Manager] ([managerId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Manager]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Branch] FOREIGN KEY([branchId])
REFERENCES [dbo].[Branch] ([branchId])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Branch]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Login] FOREIGN KEY([userId])
REFERENCES [dbo].[Login] ([userId])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Login]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account] FOREIGN KEY([fromAccountNo])
REFERENCES [dbo].[Account] ([accountNo])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account1] FOREIGN KEY([toAccountNo])
REFERENCES [dbo].[Account] ([accountNo])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account1]
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
