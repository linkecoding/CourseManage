-- 学生登录存储过程
create procedure student_login(@email varchar(40), @password varchar(32) output)
	as
	select @password = student_password
	from
	student
	where student_email = @email

-- 教师登录存储过程
create procedure teacher_login(@email varchar(40), @password varchar(32) output)
	as
	select @password = teacher_password
	from
	teacher
	where teacher_email = @email

