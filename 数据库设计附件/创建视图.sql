-- 学生信息视图
create view student_info(
	student_id,
	student_name,
	student_email
	)
as
select 
	student_id, 
	student_name, 
	student_email
from 
student

-- 学生课程相关信息视图
create view student_learn_info(
	student_id,
	lr_time,
	course_name,
	wr_time,
	video_section
	)
as
select 
	learning_record.student_id, 
	lr_time,
	course_name, 
	wr_time, 
	video_section.vs_name
from 
watch_record, video_section, learning_record, course
where 
learning_record.student_id = watch_record.student_id 
and
learning_record.course_id = course.course_id
and
video_section.vs_id = watch_record.vs_id



-- 教师信息视图
create view teacher_info(
	teacher_id,
	teacher_name,
	teacher_email,
	department_name
	)
as
select
	teacher.teacher_id,
	teacher_name,
	teacher_email,
	department.department_name
from
teacher, department
where
teacher.department_id = department.department_id

-- 课程信息视图
create view course_info(
	teacher_id,
	course_id,
	course_name,
	course_start_time,
	course_introduction,
	course_label,
	course_img_path,
	cc_name,
	rm_content)
as
select
	teacher.teacher_id,
	course_id,
	course_name,
	course_start_time,
	course_introduction,
	course_label,
	course_img_path,
	course_category.cc_name,
	reference_material.rm_content
from
teacher, course, course_category, reference_material
where
teacher.teacher_id = course.teacher_id
and
course.rm_id = reference_material.rm_id
and
course_category.cc_id = course.cc_id 

-- 视频章节信息视图
create view video_chapter_section_info(
	course_id,
	vc_id,
	vc_number,
	vc_name,
	vs_id,
	vs_number,
	vs_name,
	vs_file_path,
	vs_watch_times)
as
select
	video_chapter.course_id,
	video_chapter.vc_id,
	vc_number,
	vc_name,
	video_section.vs_id,
	vs_number,
	vs_name,
	vs_file_path,
	vs_watch_times
from
video_chapter, video_section
where
video_chapter.vc_id = video_section.vc_id

-- 视频节附件视图
create view video_section_attachment(
	vs_id,
	ca_id,
	ca_name,
	ca_remark,
	ca_file_path
)
as
select
	video_section.vs_id,
	ca_id,
	ca_name,
	ca_remark,
	ca_file_path
from
video_section, course_attachment
where
video_section.vs_id = course_attachment.vs_id

-- 视频评论视图
create view video_comment(
	vs_id,
	vsc_id,
	vsc_time,
	vsc_content,
	student_name
)
as
select
	video_section_comment.vs_id,
	vsc_id,
	vsc_time,
	vsc_content,
	student_name
from
student, video_section_comment
where
student.student_id = video_section_comment.student_id
