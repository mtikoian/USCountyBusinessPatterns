USE [USCountyBusinessPatternsOLTP]
GO
/****** Object:  Table [dbo].[County]    Script Date: 10/31/2013 2:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[County](
	[CountyID] [char](5) NOT NULL,
	[State] [char](2) NULL,
	[County] [char](3) NULL,
	[StateName] [varchar](250) NULL,
	[CountyName] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[CountyBusinessPattern]    Script Date: 10/31/2013 2:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountyBusinessPattern](
	[CountyBusinessPatternID] [int] IDENTITY(1,1) NOT NULL,
	[CountyID] [char](5) NOT NULL,
	[Naics] [varchar](50) NOT NULL,
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
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CountyBusinessPatternID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Naics]    Script Date: 10/31/2013 2:01:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Naics](
	[Naics] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Naics] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[CountyBusinessPattern]  WITH CHECK ADD  CONSTRAINT [FK_Naics_Naics] FOREIGN KEY([Naics])
REFERENCES [dbo].[Naics] ([Naics])
GO
ALTER TABLE [dbo].[CountyBusinessPattern] CHECK CONSTRAINT [FK_Naics_Naics]
GO
ALTER TABLE [dbo].[CountyBusinessPattern]  WITH CHECK ADD  CONSTRAINT [FK_StateCounty_StateCountyID] FOREIGN KEY([CountyID])
REFERENCES [dbo].[County] ([CountyID])
GO
ALTER TABLE [dbo].[CountyBusinessPattern] CHECK CONSTRAINT [FK_StateCounty_StateCountyID]
GO
