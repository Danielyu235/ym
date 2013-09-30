create table TB_PEOPLEINFO(
 id varchar(10) not null primary key,
 name varchar(10) not null,
 age  int not null,
 sex  varchar(10) not null,
 mobilenumber varchar(11) not null,
 phonenumber varchar(20),
 officephonenumber varchar(20),
 unit varchar(100),
 duty varchar(10) not null,
 deparment varchar(20) not null,
 profession varchar(20),
 address varchar(100) not null,
 workexperience varchar(5000)
 
)