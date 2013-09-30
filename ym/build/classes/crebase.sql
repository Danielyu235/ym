/*菜单表*/
CREATE TABLE dev_menu
( 
   menu_id              int                  NOT NULL,
   menu_name            varchar(200)         NOT NULL,
   menu_jb              int                  NOT NULL,
   menu_sjbh            int                  NOT NULL,
   menu_path            varchar(500)         NOT NULL,
   menu_url             varchar(500)         NULL,
   menu_order           int                  NOT NULL,
   menu_icon            varchar(500)         NOT NULL,
   menu_switch          int                  NULL,
   menu_info            varchar(500)         NULL,
   menu_type            int                  NOT NULL,
   CONSTRAINT pk_dev_menu PRIMARY KEY (menu_id)
);

/*表的依赖关系表*/
create table dev_constraint_entity
(
	id					varchar(32)			not null,
	parentId			varchar(32)			null,
	childId				varchar(32)			null
)
/*菜单权限表*/
CREATE TABLE dev_menu_opt
( 
   id                   varchar(32)          NOT NULL,
   menu_id              int                  NOT NULL,
   opt_code             varchar(50)          NOT NULL,
   opt_name             varchar(50)          NOT NULL,
   opt_url              varchar(200)         NULL,
   opt_type             char(1)              NOT NULL,
   opt_order            int                  NULL,
   func_name			varchar(50)			 null,
   func_para			varchar(200)		 null,
   func_content			varchar(4000)		 null,
   open_type			char(1)			 	 null,
   display_type			char(1)				 null,
   design_page_url		varchar(2000)		 null,
   form_id              varchar(32)          null,
   url_para             varchar(200)         null,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_dev_menu_opt PRIMARY KEY (id)
);
/*实体表*/
CREATE TABLE dev_entity
(
	id 					varchar(32) 		NOT NULL,
	entity_code 		varchar(50) 		NOT NULL,
	entity_name 		varchar(50) 		NOT NULL,
	entity_type 		char(1) 			NOT NULL,
	view_sql 			varchar(4000)		NULL,
	parent_id			varchar(32)			NULL,
	status              char(1)             NULL DEFAULT '1',
	created 			varchar(32)		    NULL,
	create_time 		datetime			NULL,
	updated 			varchar(32)		    NULL,
	update_time 		datetime			NULL,
	CONSTRAINT pk_dev_entity PRIMARY KEY (id)
);
/*实体属性表*/
CREATE TABLE dev_entity_field
(
	id					varchar(32)			NOT NULL,
	entity_id			varchar(32)			NOT NULL,
	field_code			varchar(50)			NOT NULL,
	field_name			varchar(50)			NOT NULL,
    entity_order		int					NOT NULL,
	default_value		varchar(200)		NULL,
	field_type			varchar(32)			NULL,
	field_length		int				    NULL,
	is_pk				char(1)				NULL,
	control_type		varchar(30)			NULL,
	data_type_id		varchar(32)			NULL,
	is_null				char(1)				NULL,
	status				char(1)				NULL,
	created				varchar(32)			NULL,
	create_time			datetime			NULL,
	updated				varchar(32)			NULL,
	update_time			datetime			NULL,
	CONSTRAINT pk_dev_entity_field PRIMARY KEY(id)
);


/*表单表*/
CREATE TABLE dev_form
(
	id					varchar(32)			not null,
	menu_id			    varchar(32)			null,
	entity_id			varchar(32)			not null,
	form_name			varchar(50)			not null,
	init_type			varchar(1)			not null,
	is_relation			char(1)				null,
	parent_code			varchar(50)			null,
	status				char(1)				NULL,
	created				varchar(32)			NULL,
	create_time			datetime			NULL,
	updated				varchar(32)			NULL,
	update_time			datetime			NULL,
	CONSTRAINT pk_dev_form PRIMARY KEY(id)
);
/*表单属性表*/
CREATE TABLE dev_form_property (
   id                   varchar(32)          not null,
   form_id              varchar(32)          not null,
   field_id				varchar(32)			 not null,
   view_name            varchar(50)          not null,
   default_value        varchar(50)          null,
   edit_type            char(1)              null,
   required             char(1)              null,
   is_view              char(1)              null,
   order_type           char(1)              null,
   width                varchar(10)          null,
   algin                char(1)              null,
   is_search            char(1)              null,
   search_type          char(1)              null,
   filter_type          char(1)              null,
   filter_value         varchar(50)          null,
   form_order           int                  null,
   is_relation			char(1)				 null,
   related_code			varchar(50)			 null,
   status               char(1)              null,
   created              varchar(32)          null,
   create_time          datetime             null,
   updated              varchar(32)          null,
   update_time          datetime             null,
   CONSTRAINT PK_DEV_FORM_PROPERTY PRIMARY KEY (id)
);
/*图标表*/
CREATE TABLE dev_icon
( 
   icon_id              varchar(50)          NOT NULL,
   icon_name            varchar(100)         NULL,
   icon_url             varchar(100)         NULL,
   icon_remark          varchar(400)         NULL,
   creation_date        datetime             NULL,
   icon_type            varchar(20)          NULL,
   icon_leibie          varchar(100)         NULL,
   CONSTRAINT pk_dev_icon PRIMARY KEY (icon_id)
);
/*元数据类别表*/
CREATE TABLE dev_data_type
( 
   id                   varchar(32)          NOT NULL,
   type_name            varchar(50)          NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_dev_data_type PRIMARY KEY (id)
);
/*元数据表*/
CREATE TABLE dev_data
( 
   id                   varchar(32)          NOT NULL,
   parent_id            varchar(32)          NULL,
   type_id              varchar(32)          NOT NULL,
   data_code            varchar(50)          NOT NULL,
   data_name            varchar(50)          NOT NULL,
   data_order           int                  NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_dev_data PRIMARY KEY (id)
);
/*用户表*/
CREATE TABLE sys_user
( 
   id                   varchar(32)          NOT NULL,
   account              varchar(50)          NOT NULL,
   password             varchar(100)         NOT NULL,
   user_name            varchar(50)          NOT NULL,
   dept_id              varchar(32)          NOT NULL,
   user_type            varchar(2)           NOT NULL,
   skin_type            varchar(2)           NULL,
   login_time           datetime             NULL,
   last_login_time      datetime             NULL,
   lose_count           int                  NULL,
   salt                 varchar(20)          NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_user PRIMARY KEY (id)
);
/*用户组表*/
CREATE TABLE sys_group
( 
   id                   varchar(32)          NOT NULL,
   group_name           varchar(50)          NOT NULL,
   description          varchar(200)         NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_group PRIMARY KEY (id)
);
/*用户组关系表*/
CREATE TABLE sys_user_group
( 
   id                   varchar(32)          NOT NULL,
   user_id              varchar(32)          NOT NULL,
   group_id             varchar(32)          NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_user_group PRIMARY KEY (id)
);
/*部门表*/
CREATE TABLE sys_dept
( 
   id                   varchar(32)          NOT NULL,
   parent_id            varchar(32)          NOT NULL,
   dept_name            varchar(50)          NOT NULL,
   dept_order           int                  NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_dept PRIMARY KEY (id)
);

/*角色表*/
CREATE TABLE sys_role
( 
   id                   varchar(32)          NOT NULL,
   role_name            varchar(50)          NOT NULL,
   description          varchar(200)         NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_role PRIMARY KEY (id)
);

/*角色菜单权限表*/
CREATE TABLE sys_role_menu_opt
( 
   id                   varchar(32)          NOT NULL,
   role_id              varchar(32)          NOT NULL,
   menu_opt_id          varchar(32)          NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_role_menu_opt PRIMARY KEY (id)
);
/*角色用户表*/
CREATE TABLE sys_role_user
( 
   id                   varchar(32)          NOT NULL,
   role_id              varchar(32)          NOT NULL,
   user_id              varchar(32)          NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_role_user PRIMARY KEY (id)
);
/*角色用户组表*/
CREATE TABLE sys_role_group
( 
   id                   varchar(32)          NOT NULL,
   role_id              varchar(32)          NOT NULL,
   group_id             varchar(32)          NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_role_group PRIMARY KEY (id)
);

/*角色部门表*/
CREATE TABLE sys_role_dept
( 
   id                   varchar(32)          NOT NULL,
   role_id              varchar(32)          NOT NULL,
   dept_id              varchar(32)          NOT NULL,
   status               char(1)              NULL DEFAULT '1',
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT pk_sys_role_dept PRIMARY KEY (id)
);
/*系统参数表*/
CREATE TABLE sys_parameter (
   id                   varchar(32)          NOT NULL,
   para_code            varchar(50)          NOT NULL,
   para_name            varchar(50)          NOT NULL,
   para_value           varchar(100)         NOT NULL,
   status               char(1)              NULL,
   created              varchar(32)          NULL,
   create_time          datetime             NULL,
   updated              varchar(32)          NULL,
   update_time          datetime             NULL,
   CONSTRAINT PK_SYS_PARAMETER PRIMARY KEY (id)
);
/*初始化系统参数表脚本*/
insert into dbo.sys_parameter(id,para_code,para_name,para_value,status,created,create_time,updated,update_time) values ('1','login_limit_times','登录限制次数','6','1','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24')
insert into dbo.sys_parameter(id,para_code,para_name,para_value,status,created,create_time,updated,update_time) values ('2','login_limit_period','登录限制时长','30','1','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24')
insert into dbo.sys_parameter(id,para_code,para_name,para_value,status,created,create_time,updated,update_time) values ('3','login_limit_switch','登录限制开关','1','1','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24')
insert into dbo.sys_parameter(id,para_code,para_name,para_value,status,created,create_time,updated,update_time) values ('4','login_onlyone_switch','不允许账号多处同时登录开关','1','1','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24')
insert into dbo.sys_parameter(id,para_code,para_name,para_value,status,created,create_time,updated,update_time) values ('5','login_authcode_digit','登录验证码位数','1','1','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24')
insert into dbo.sys_parameter(id,para_code,para_name,para_value,status,created,create_time,updated,update_time) values ('6','login_authcode_type','登录验证码类型','0','1','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24')
insert into dbo.sys_parameter(id,para_code,para_name,para_value,status,created,create_time,updated,update_time) values ('7','login_authcode_switch','登录验证码开关','1','1','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24','2df56a9a48ac4d8894312ee58702a974','2012-11-01 15:42:24')

