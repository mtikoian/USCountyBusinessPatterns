USE [USCountyBusinessPatternsDW]
GO
/****** Object:  Table [dbo].[DimCounty]    Script Date: 10/31/2013 2:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimCounty](
	[CountySK] [int] IDENTITY(1,1) NOT NULL,
	[CountyAK] [varchar](5) NOT NULL,
	[StateName] [varchar](250) NOT NULL,
	[CountyName] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[DimNaics]    Script Date: 10/31/2013 2:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimNaics](
	[NaicsSK] [int] IDENTITY(1,1) NOT NULL,
	[NaicsAK] [varchar](50) NOT NULL,
	[Description] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NaicsSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[DimYear]    Script Date: 10/31/2013 2:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimYear](
	[YearSK] [int] NOT NULL,
	[YearAK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[YearSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactCountyBusinessPattern]    Script Date: 10/31/2013 2:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCountyBusinessPattern](
	[FactCountyBusinessPatternSK] [int] IDENTITY(1,1) NOT NULL,
	[CountyBusinessPatternAK] [int] NOT NULL,
	[NaicsSK] [int] NOT NULL,
	[YearSK] [int] NOT NULL,
	[CountySK] [int] NOT NULL,
	[TotalMidMarchEmployees] [int] NULL,
	[Q1PayRoll] [bigint] NULL,
	[AnnualPayRoll] [bigint] NULL,
	[TotalEstablishments] [bigint] NULL,
	[NumberEST_1To4] [int] NULL,
	[NumberEST_5To9] [int] NULL,
	[NumberEST_10To19] [int] NULL,
	[NumberEST_20To49] [int] NULL,
	[NumberEST_50To99] [int] NULL,
	[NumberEST_100To249] [int] NULL,
	[NumberEST_250To499] [int] NULL,
	[NumberEST_500To999] [int] NULL,
	[NumberEST_1000_OR_More] [int] NULL,
	[NumberEST_1000To1499] [int] NULL,
	[NumberEST_1500To2499] [int] NULL,
	[NumberEST_2500To4999] [int] NULL,
	[NumberEST_5000_OR_More] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FactCountyBusinessPatternSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FactCountyBusinessPattern]  WITH CHECK ADD  CONSTRAINT [FK_FactCountyBusinessPattern_DimCounty] FOREIGN KEY([CountySK])
REFERENCES [dbo].[DimCounty] ([CountySK])
GO
ALTER TABLE [dbo].[FactCountyBusinessPattern] CHECK CONSTRAINT [FK_FactCountyBusinessPattern_DimCounty]
GO
ALTER TABLE [dbo].[FactCountyBusinessPattern]  WITH CHECK ADD  CONSTRAINT [FK_FactCountyBusinessPattern_DimNaics] FOREIGN KEY([NaicsSK])
REFERENCES [dbo].[DimNaics] ([NaicsSK])
GO
ALTER TABLE [dbo].[FactCountyBusinessPattern] CHECK CONSTRAINT [FK_FactCountyBusinessPattern_DimNaics]
GO
ALTER TABLE [dbo].[FactCountyBusinessPattern]  WITH CHECK ADD  CONSTRAINT [FK_FactCountyBusinessPattern_DimYear] FOREIGN KEY([YearSK])
REFERENCES [dbo].[DimYear] ([YearSK])
GO
ALTER TABLE [dbo].[FactCountyBusinessPattern] CHECK CONSTRAINT [FK_FactCountyBusinessPattern_DimYear]
GO
