CREATE TABLE TB_PERIODICAL_SURVEY_HAZARDS (
PRESSURE_ID VARCHAR(50) NULL ,--压力容器ID
DATE NVARCHAR(255) NULL ,--检查时间
RESULT NVARCHAR(255) NULL ,--检查结果
SITUATION NVARCHAR(4000) NULL ,--检查情况

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)

ALTER TABLE TB_PERIODICAL_SURVEY_HAZARDS 
ADD CONSTRAINT FK_TB_PERIODICAL_SURVEY_HAZARDS_ID FOREIGN KEY (PRESSURE_ID) 
REFERENCES TB_PRESSURE_VESSEL_HAZARDS ON DELETE CASCADE;