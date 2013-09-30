CREATE TABLE TB_EMPLOYEES (
JOB_NUM NVARCHAR(255) NULL ,--工号
NAME NVARCHAR(255) NULL ,--姓名
GENDER NVARCHAR(255) NULL ,--性别
IDNUMBER NVARCHAR(255) NULL ,--身份证号
NATION NVARCHAR(255) NULL ,--民族
DATA_OF_BIRTH NVARCHAR(255) NULL ,--出生年月
HOME_ADDRESS NVARCHAR(255) NULL ,--家庭住址
EDUCATION NVARCHAR(255) NULL ,--学历
WORK_TIME NVARCHAR(255) NULL ,--参工时间
UNIT NVARCHAR(255) NULL ,--先单位
LEN_OF_SERVICE NVARCHAR(255) NULL ,--增减工龄
WORKERS_NO NVARCHAR(255) NULL ,--工别
WORK_TYPE NVARCHAR(255) NULL ,--工种
SKILL NVARCHAR(255) NULL ,--技能
POST NVARCHAR(255) NULL ,--岗位
ONLY NVARCHAR(255) NULL ,--独生
AGED NVARCHAR(255) NULL ,--养老
MEDICAL NVARCHAR(255) NULL ,--医保
FILL_NO NVARCHAR(255) NULL ,--档案号
COMPOSITION NVARCHAR(255) NULL ,--本人成份
HOME_TOWN NVARCHAR(255) NULL ,--籍贯
PERMANENT_RESIDENCE NVARCHAR(255) NULL ,--户口所在地
BUREAU_TIME NVARCHAR(255) NULL ,--入局时间
CONTRACT_PERIOD NVARCHAR(255) NULL ,--合同期限
CONTRACT_STATUS_TIME NVARCHAR(255) NULL ,--合同开始时间
POLITICAL_STATUS NVARCHAR(255) NULL ,--政治面貌
OFFICIAL_RANK NVARCHAR(255) NULL ,--职别
CONTRACT_CONCLUSION_TIME NVARCHAR(255) NULL ,--合同结束时间
SFBZZ NVARCHAR(255) NULL ,--是否班组长
RZSJ NVARCHAR(255) NULL ,--入职时间
DWBH NVARCHAR(255) NULL ,--单位编号
BLOOD_TYPE NVARCHAR(255) NULL ,--血型
PARTY_TIME NVARCHAR(255) NULL ,--入党团时间
PHYSICLAL_STATUS NVARCHAR(255) NULL ,--身体状况
SECONDARY_OCCUPATION NVARCHAR(255) NULL ,--第二职业
CHARACTER_TRAIT NVARCHAR(255) NULL ,--性格特征
RELIGION NVARCHAR(255) NULL ,--宗教信仰
LEISURE_ACTIVITIES NVARCHAR(255) NULL ,--业务活动
MILITARY_LEN NVARCHAR(255) NULL ,--军龄
COUNTRYSIDE NVARCHAR(255) NULL ,--下乡
WAIT_FOR_EMPLOYMENT NVARCHAR(255) NULL ,--待业
PERSONNEL_QUALITY NVARCHAR(255) NULL ,--人员性质
WORK_LICENSE NVARCHAR(255) NULL ,--上岗证
SFGLRY NVARCHAR(255) NULL ,--是否管理人员
POSITION NVARCHAR(255) NULL ,--岗位职务
CELLPHONE_NUMBER NVARCHAR(255) NULL ,--手机号码
PLATE_NUMBER NVARCHAR(255) NULL ,--私家车牌号
RELATIVES_NAME NVARCHAR(255) NULL ,--亲属姓名
RELATIONS NVARCHAR(255) NULL ,--与本人关系
RELATIVES_CELLPHONE_NUMBER NVARCHAR(255) NULL ,--亲属手机号码
CARD_NUMBER NVARCHAR(255) NULL ,--卡号
PASSPORT NVARCHAR(255) NULL ,--照片
DEPARTMENTF NVARCHAR(255) NULL ,--部门
DEPARTMENTS NVARCHAR(255) NULL ,--部门职位
MAJOR NVARCHAR(255) NULL ,--专业
PHONE_NUMBER NVARCHAR(255) NULL ,--座机号码

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)