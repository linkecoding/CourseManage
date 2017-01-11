-- 建数据库
create database  keshe
-- 学生表
create table student(
	student_id   integer   identity(1,1)  not null,
	student_name  nvarchar(32)  not null,
	student_password  varchar(32)   not null,
	student_email  varchar(40)   not null,
	primary key(student_id)
);

-- 参考资料表
create  table reference_material(
	rm_id   integer   identity(1,1)  not null,
	rm_content   nvarchar(800),
	primary key(rm_id)
);


-- 课程类别表
create table  course_category(
	cc_id  integer   identity(1,1)  not null,
	cc_name  nvarchar(20)   not null,
	primary key(cc_id)
);

-- 院系表
create table department(
	department_id   integer   identity(1,1)  not null,
	department_name  nvarchar(20) not null,
	primary key(department_id)
);

-- 教师表
create table  teacher(
	teacher_id  integer   identity(1,1)  not null,
	teacher_name  nvarchar(20) not null,
	teacher_email  varchar(40) not null,
	teacher_password  varchar(32) not null,
	department_id integer not null,
	primary key(teacher_id),
	foreign key(department_id) references department
);

-- 课程表
create table course(
	course_id   integer   identity(1,1)  not null,
	course_name  nvarchar(32)   not null,
	course_introduction   nvarchar(500),
	course_label  nvarchar(32)  not null,
	course_start_time   date,
	course_img_path varchar(100) not null,

	rm_id   integer   not null, 
	cc_id   integer   not null,
	teacher_id integer not null,
	
	primary key(course_id),
	foreign key(rm_id) references reference_material,
	foreign key(cc_id) references course_category,
	foreign key(teacher_id) references teacher
);

-- 视频章表
create table  video_chapter(
	vc_id   integer   identity(1,1)  not null,
	vc_number  smallint  not null,
	vc_name   nvarchar(32) not null,
	course_id integer  not null,

	primary key(vc_id),
	foreign key(course_id) references course
);

-- 视频节表
create  table  video_section(
	vs_id  integer  identity(1,1)  not null,
	vs_number  smallint not null,
	vs_name   nvarchar(32)  not null,
	vs_file_path  varchar(100)   not null,
	vs_watch_times  varchar(12),

	vc_id  integer not null,

	primary key(vs_id),
	foreign key(vc_id) references video_chapter
);

-- 课程附件表
create table  course_attachment(
	ca_id   integer   identity(1,1)  not null,
	ca_name   nvarchar(32)  not null,
	ca_file_path   varchar(100)   not null,
	ca_remark   nvarchar(100),
	
	vs_id  integer  not null,
	
	primary key(ca_id),
	foreign key(vs_id) references video_section
);

-- 学习记录表
create table learning_record(
	lr_id  integer   identity(1,1)  not null,
	lr_time  date  not null,
	student_id integer not null,
	course_id  integer not null,

	primary key(lr_id),
	foreign key(student_id)  references student,
	foreign key(course_id) references course
);

-- 观看记录表
create table watch_record(
	wr_id  integer   identity(1,1)  not null,
	wr_time  date  not null,
	student_id integer not null,
	vs_id integer not null,

	primary key(wr_id),
	foreign key(student_id) references student,
	foreign key(vs_id) references video_section
);

-- 视频节评论表
create table  video_section_comment(
	vsc_id  integer   identity(1,1)  not null,
	vsc_time date not null,
	vsc_content   nvarchar(100)  not null,

	student_id integer not null,
	vs_id integer not null,

	primary key(vsc_id),
	foreign key(student_id) references student,
	foreign key(vs_id) references video_section
);
