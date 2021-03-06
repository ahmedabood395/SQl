USE [master]
GO
/****** Object:  Database [project]    Script Date: 5/12/2020 12:26:42 AM ******/
CREATE DATABASE [project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project] SET ARITHABORT OFF 
GO
ALTER DATABASE [project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project] SET  MULTI_USER 
GO
ALTER DATABASE [project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project] SET QUERY_STORE = OFF
GO
USE [project]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[crs_id] [int] IDENTITY(1,1) NOT NULL,
	[crs_duration] [int] NOT NULL,
	[crs_name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_id] [int] NOT NULL,
	[Dept_name] [varchar](30) NOT NULL,
	[Dept_manager] [int] NOT NULL,
	[Dept_description] [varchar](100) NOT NULL,
	[manager_hiredate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Ex_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_degree] [int] NOT NULL,
	[model_ans] [varchar](500) NOT NULL,
	[crs_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ins_course]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ins_course](
	[evaluation] [varchar](50) NOT NULL,
	[crs_id] [int] NOT NULL,
	[ins_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC,
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[ins_id] [int] IDENTITY(1,1) NOT NULL,
	[ins_name] [varchar](30) NOT NULL,
	[salary] [float] NOT NULL,
	[ins_degree] [varchar](30) NOT NULL,
	[Dept_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[qs_id] [int] IDENTITY(1,1) NOT NULL,
	[qs_ans] [varchar](500) NOT NULL,
	[qs_content] [varchar](500) NOT NULL,
	[qs_type] [varchar](100) NOT NULL,
	[crs_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[qs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stud_course]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stud_course](
	[grade] [int] NOT NULL,
	[st_id] [int] NOT NULL,
	[crs_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC,
	[crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stud_exam]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stud_exam](
	[grade] [int] NOT NULL,
	[st_ans] [varchar](500) NOT NULL,
	[st_id] [int] NOT NULL,
	[Ex_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC,
	[Ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[st_id] [int] IDENTITY(1,1) NOT NULL,
	[st_fname] [varchar](30) NOT NULL,
	[st_lname] [varchar](30) NOT NULL,
	[st_age] [int] NOT NULL,
	[st_address] [varchar](100) NOT NULL,
	[st_super] [int] NOT NULL,
	[Dept_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 5/12/2020 12:26:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[topic_name] [varchar](50) NOT NULL,
	[crs_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([crs_id], [crs_duration], [crs_name]) VALUES (1, 5, N'C#')
INSERT [dbo].[Course] ([crs_id], [crs_duration], [crs_name]) VALUES (2, 7, N'SQL')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[questions] ON 

INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (1, N'false', N' The C# language is not case sensitive.', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (2, N'true', N' In the statement this.Close(); the keyword this refers to the current object ? ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (3, N'true', N'Comment statements begin with //. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (4, N'false', N' Each class of controls has the same set of properties. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (5, N'true', N' plus sign (+) character  : is used to concatenate one string to the end of another string?', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (6, N'false', N' The data type of a variable or constant must be the same for all variables and constants in that program . ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (7, N'true', N' C# gives the programmer the ability to set up locations in memory and give each location a name.', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (12, N'true', N'The scope of a variable is determined by where it is declared. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (13, N'false', N' Calculations cannot be performed in assignment statements. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (14, N'true', N'The statement countDownInteger = countDownInteger - 1; is the same as countDownInteger = 1 .', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (15, N'true', N'You cannot implicitly convert from float to decimal data types. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (18, N'false', N'Compound conditions are created by joining conditions with relational operators. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (19, N'true', N'A program that has a logic error will run but produce incorrect results. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (20, N'false', N'Only one catch block can be written for each program. ', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (21, N'true', N'8 Bytes are stored by ‘Long’ Data type in C# .net?', N'True_False', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (22, N'a', N' Which data type should be more preferred for storing a simple number like 35 to improve execution speed of a program? a) sbyte b) short c) int d) long ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (23, N'b', N' Arrange the following data type in order of increasing magnitude sbyte, short, long, int. a) long < short < int < sbyte b) sbyte < short < int < long c) short < sbyte < int < long d) short < int < sbyte < long ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (24, N'c', N' What is the Size of ‘Char’ datatype? a) 8 bit b) 12 bit c) 16 bit d) 20 bit ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (25, N'c', N'Select a convenient declaration and initialization of a floating point number: a) float somevariable = 12.502D b) float somevariable = (Double) 12.502D c) float somevariable = (float) 12.502D d) float somevariable = (Decimal)12.502D ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (26, N'c', N' Storage location used by computer memory to store data for usage by an application is? a) Pointers b) Constants c) Variable d) None of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (27, N'c', N' Correct order of priorities are: a) ‘/’ > ‘%’ > ‘*’ > ‘+’ b) ‘/’ > ‘*’ > ‘%’ > ‘+’ c) ‘*’ > ‘/’ > ‘%’ > ‘+’ d) ‘%’ > ‘*’ > ‘/’ > ‘+’ ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (28, N'd', N' Which of the following options is not a Bitwise Operator in C#? a) &, | b) ^, ~ c) <<, >> d) +=, -= ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (29, N'b', N' Which of the following is not infinite loop?17 a) for( ;’0''; ) b) for( ;’0''; ) c) for( ;’1''; ) d) for( ;’1''; ) ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (30, N'b', N' Which of the following is used to define the member of a class 23 a) : b) :: c) # d) none of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (31, N'd', N' Which of the following statements about objects in “C#” is correct?24 a) Everything you use in C# is an object, including Windows Forms and controls events that allow them to perform actionsb) Objects have methods and  c) All objects created from a class will occupy equal number of bytes in memory d) All of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (32, N'c', N' Number of constructors a class can define is?29 a) 1 b) 2 c) Any number d) None of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (33, N'd', N' 30 a) Constructors can be overloaded b) Constructors are never called explicitly 
c) Constructors have same name as name of the class d) All of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (34, N'c', N' Which method has the same name as  a) delete b) class c) constructor d) none of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (35, N'c', N' Operator used to free the memory when memory is allocated? a) new b) free c) delete d) none of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (36, N'd', N' What is the return type of  a) int b) void c) float d) none of the mentioned ', N'Multiple_Choice', 1)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (37, N'false', N'The condition in a WHERE clause can refer to only one value.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (38, N'false', N'The ADD command is used to enter one row of data or to add multiple rows as a result of a query.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (39, N'true', N'SQL provides the AS keyword, which can be used to assign meaningful column names to the results of queries using the SQL built-in functions.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (40, N'true', N'The SELECT command, with its various clauses, allows users to query the data contained in the tables and ask many different questions or ad hoc queries.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (41, N'false', N'A SELECT statement within another SELECT statement and enclosed in square brackets ([...]) is called a subquery.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (42, N'false', N'The rows of the result relation produced by a SELECT statement can be sorted, but only by one column.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (43, N'false', N'There is an equivalent join expression that can be substituted for all subquery expressions.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (44, N'true', N'A dynamic view is one whose contents materialize when referenced.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (45, N'false', N'SQL is a programming language.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (46, N'false', N'SELECT DISTINCT is used if a user wishes to see duplicate columns in a query.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (47, N'true', N'Indexes can usually be created for both primary and secondary keys.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (48, N'true', N'Each index consumes extra storage space and also requires overhead maintenance time whenever indexed data change value.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (49, N'true', N'The HAVING clause acts like a WHERE clause, but it identifies groups that meet a criterion, rather than rows', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (50, N'true', N'SQL is a data sublanguage', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (51, N'true', N'The qualifier DISTINCT must be used in an SQL statement when we want to eliminate duplicate rows.', N'True_False', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (52, N'c', N'You can add a row using SQL in a database with which of the following?
A.
ADD
B.
CREATE
C.
INSERT
D.
MAKE

', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (53, N'c', N'The command to remove rows from a table ''CUSTOMER'' is:
	A.
REMOVE FROM CUSTOMER ...
B.
DROP FROM CUSTOMER ...
C.
DELETE FROM CUSTOMER WHERE ...
D.
UPDATE FROM CUSTOMER ...', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (54, N'b', N'The SQL WHERE clause:
A.
limits the column data that are returned.
B.
limits the row data are returned.
C.
Both A and B are correct.
D.
Neither A nor B are correct.', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (55, N'd', N'Which of the following is the original purpose of SQL?
	A.
To specify the syntax and semantics of SQL data definition language
B.
To specify the syntax and semantics of SQL manipulation language
C.
To define the data structures
D.
All of the above.', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (56, N'b', N'The wildcard in a WHERE clause is useful when?
A.
An exact match is necessary in a SELECT statement.
B.
An exact match is not possible in a SELECT statement.
C.
An exact match is necessary in a CREATE statement.
D.
An exact match is not possible in a CREATE statement.

', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (57, N'a', N'A view is which of the following?
	A.
A virtual table that can be accessed via SQL commands
B.
A virtual table that cannot be accessed via SQL commands
C.
A base table that can be accessed via SQL commands
D.
A base table that cannot be accessed via SQL commands
', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (58, N'b', N'The command to eliminate a table from a database is:
	A.
REMOVE TABLE CUSTOMER;
B.
DROP TABLE CUSTOMER;
C.
DELETE TABLE CUSTOMER;
D.
UPDATE TABLE CUSTOMER;', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (59, N'b', N'ON UPDATE CASCADE ensures which of the following?
A.
Normalization
B.
Data Integrity
C.
Materialized Views
D.
All of the above.

', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (60, N'a', N'SQL data definition commands make up a(n) ________ .
	A.
DDL
B.
DML
C.
HTML
D.
XML', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (61, N'a', N'Which of the following is valid SQL for an Index?
	A.
CREATE INDEX ID;
B.
CHANGE INDEX ID;
C.
ADD INDEX ID;
D.
REMOVE INDEX ID;', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (63, N'a', N'The SQL keyword(s) ________ is used with wildcards.
	A.
LIKE only
B.
IN only
C.
NOT IN only
D.
IN and NOT IN
12. 	Which of the following is the correct order of keywords for SQL SELECT statements?
	A.
SELECT, FROM, WHERE
B.
FROM, WHERE, SELECT
C.
WHERE, FROM,SELECT
	D.  SELECT,WHERE,FROM', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (65, N'a', N'Which of the following is the correct order of keywords for SQL SELECT statements?
	A.
SELECT, FROM, WHERE
B.
FROM, WHERE, SELECT
C.
WHERE, FROM,SELECT
	D.  SELECT,WHERE,FROM
', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (66, N'c', N'A subquery in an SQL SELECT statement is enclosed in:
	A.
braces -- {...}.
B.
CAPITAL LETTERS.
C.
parenthesis -- (...) .
D.
brackets -- [...].', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (67, N'd', N'The result of a SQL SELECT statement is a(n) ________ .
	A.
report
B.
form
C.
file
D.
table', N'Multiple_Choice', 2)
INSERT [dbo].[questions] ([qs_id], [qs_ans], [qs_content], [qs_type], [crs_id]) VALUES (68, N'a', N'Which of the following are the five built-in functions provided by SQL?
A.
COUNT, SUM, AVG, MAX, MIN
B.
SUM, AVG, MIN, MAX, MULT
C.
SUM, AVG, MULT, DIV, MIN
D.
SUM, AVG, MIN, MAX, NAME

', N'Multiple_Choice', 2)
SET IDENTITY_INSERT [dbo].[questions] OFF
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[ins_course]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[ins_course]  WITH CHECK ADD FOREIGN KEY([ins_id])
REFERENCES [dbo].[instructor] ([ins_id])
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD FOREIGN KEY([Dept_id])
REFERENCES [dbo].[Department] ([Dept_id])
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[stud_course]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[stud_course]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[Student] ([st_id])
GO
ALTER TABLE [dbo].[stud_exam]  WITH CHECK ADD FOREIGN KEY([Ex_id])
REFERENCES [dbo].[Exam] ([Ex_id])
GO
ALTER TABLE [dbo].[stud_exam]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[Student] ([st_id])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([Dept_id])
REFERENCES [dbo].[Department] ([Dept_id])
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
USE [master]
GO
ALTER DATABASE [project] SET  READ_WRITE 
GO
