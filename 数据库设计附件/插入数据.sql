
-- 插入数据
insert into department(
	department_name) 
values('物联网工程学院');
insert into department(
	department_name) 
values('机电工程学院');
insert into department(
	department_name) 
values('企业管理学院');

-- ///////////////
insert into teacher(
	teacher_name, 
	teacher_email, 
	teacher_password, 
	department_id) 
values('李威', '123456@qq.com', '25d55ad283aa400af464c76d713c07ad', 1);
insert into teacher(
	teacher_name,
	teacher_email, 
	teacher_password, 
	department_id) 
values('张三', '234567@qq.com', '25d55ad283aa400af464c76d713c07ad', 2);
insert into teacher(
	teacher_name, 
	teacher_email, 
	teacher_password, 
	department_id) 
values('李四', '5678123@qq.com', '25d55ad283aa400af464c76d713c07ad', 3);

-- //////////
insert into student(
	student_name, 
	student_password, 
	student_email) 
values('张三丰', '25d55ad283aa400af464c76d713c07ad', '9087123@qq.com');

-- ////////////
insert into course_category(
	cc_name) 
values('人文社科');
insert into course_category(
	cc_name) 
values('英语');

insert into reference_material(
	rm_content)
values('这是本课的参考资料');

-- /////////
insert into course(
	course_name, 
	course_introduction, 
	course_label, 
	course_start_time,
	course_img_path, 
	rm_id, 
	cc_id, 
	teacher_id)
values('论语解读', '这是一门读论语的课程', '论语;孔子;', '2017-01-02', '127.0.0.1:8080/VideoManager/course/1/xx.png', 1, 1, 1);


-- ////////////////
insert into learning_record(
	lr_time, 
	student_id, 
	course_id) 
values('2017-01-02', 1, 1);

-- //////////////
insert into video_chapter(
	vc_number, 
	vc_name, 
	course_id) 
values(1, '初读论语', 1);

-- /////////////
insert into video_section(
	vs_number,
	vs_name,
	vs_file_path,
	vs_watch_times,
	vc_id)
values(1, '论语解读第一章', '127.0.0.1:8080/VideoManager/video/1/1/1/xxx.mp4', '10', 1);

-- ////////////////
insert into course_attachment(
	ca_name,
	ca_file_path,
	ca_remark,
	vs_id)
values('第一章第一节附件', '127.0.0.1:8080/VideoManager/attachment/1/1/1/xxx.doc', '课程附件备注', 1);

-- /////////
insert into watch_record(
	wr_time,
	student_id,
	vs_id)
values('2017-01-02', 1, 1);


-- ////////////
insert into video_section_comment(
	vsc_time,
	vsc_content,
	student_id,
	vs_id)
values('2017-01-02', '评论内容', 1, 1);