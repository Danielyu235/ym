CREATE TABLE [dbo].[TB_DANGEROUSCARGO](
	[id] [varchar](50) NOT NULL primary key,
	[status] [char](1) NULL,
	[created] [varchar](50) NULL,
	[create_time] [datetime] NULL,
	[updated] [varchar](50) NULL,
	[fid] [varchar](50) NULL,
	[materials_id] [varchar](50) NULL,
	[update_time] [datetime] NULL,
	[dangercargoname] [varchar](1000) NULL,
	[dangernumber] [varchar](1000) NULL,
	[dangeruse] [varchar](1000) NULL,
	[dangertech] [varchar](1000) NULL,
	[physical] [varchar](1000) NULL,
	[dangertem] [varchar](1000) NULL,
	[dangermpa] [varchar](1000) NULL,
	[dangerstore] [varchar](1000) NULL,
	[dangerunitstore] [varchar](1000) NULL
	)