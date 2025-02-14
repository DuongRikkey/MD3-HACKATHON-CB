create database quanlydiemthi2023;
use quanlydiemthi2023;
create table subject(
subjectId varchar(4) primary key not null,
subjectName varchar(45) not null,
priority int not null
);
create table student(
studentId varchar(4) primary key not null,
studentName varchar(45) not null,
birthday date not null,
gender bit(1) not null,
address text not null,
phoneNumber varchar(45)
);
create table if not exists mark(
subjectId varchar(4) not null,
studentId varchar(4) not null,
point double not null,
constraint lk_01 foreign key(subjectId) references subject(subjectId),
constraint lk_02 foreign key(studentId) references student(studentId)
);

insert into student (studentid, studentname, birthday, gender, address, phonenumber) values
('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274678'),
('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');

insert into subject (subjectid, subjectname, priority) values
('MH01', 'Toán', 2),
('MH02', 'Vật Lý', 2),
('MH03', 'Hoá Học', 1),
('MH04', 'Ngữ Văn', 1),
('MH05', 'Tiếng Anh', 2);

insert into mark (subjectid, studentid, point) values
-- Marks for Nguyễn Thế Anh (S001)
('MH01', 'S001', 8.5),
('MH02', 'S001', 7),
('MH03', 'S001', 9),
('MH04', 'S001', 9),
('MH05', 'S001', 5),

-- Marks for Đặng Bảo Trâm (S002)
('MH01', 'S002', 9),
('MH02', 'S002', 8),
('MH03', 'S002', 6.5),
('MH04', 'S002', 8),
('MH05', 'S002', 6),

-- Marks for Trần Hà Phương (S003)
('MH01', 'S003', 7.5),
('MH02', 'S003', 8),
('MH03', 'S003', 8),
('MH04', 'S003', 7),
('MH05', 'S003', 7.5),

-- Marks for Đỗ Tiến Mạnh (S004)
('MH01', 'S004', 6),
('MH02', 'S004', 7),
('MH03', 'S004', 6.5),
('MH04', 'S004', 6.5),
('MH05', 'S004', 8),

-- Marks for Phạm Duy Nhất (S005)
('MH01', 'S005', 5.5),
('MH02', 'S005', 6),
('MH03', 'S005', 8),
('MH04', 'S005', 7.5),
('MH05', 'S005', 5),

-- Marks for Mai Văn Thái (S006)
('MH01', 'S006', 8),
('MH02', 'S006', 10),
('MH03', 'S006', 9),
('MH04', 'S006', 7.5),
('MH05', 'S006', 6.5),

-- Marks for Giang Gia Hân (S007)
('MH01', 'S007', 9.5),
('MH02', 'S007', 9),
('MH03', 'S007', 8.5),
('MH04', 'S007', 9),
('MH05', 'S007', 9),

-- Marks for Nguyễn Ngọc Bảo My (S008)
('MH01', 'S008', 8),
('MH02', 'S008', 8),
('MH03', 'S008', 8.5),
('MH04', 'S008', 9.5),
('MH05', 'S008', 9.5),

-- Marks for Nguyễn Tiến Đạt (S009)
('MH01', 'S009', 7.5),
('MH02', 'S009', 9),
('MH03', 'S009', 6),
('MH04', 'S009', 8),
('MH05', 'S009', 10),

-- Marks for Nguyễn Thiều Quang (S010)
('MH01', 'S010', 6.5),
('MH02', 'S010', 8),
('MH03', 'S010', 5.5),
('MH04', 'S010', 4),
('MH05', 'S010', 7);

-- 2.Sửa tên học sinh có mã là S001
update Student set studentName='Đỗ Đức Mạnh' where studentId='S004';
-- Sửa tên môn học và hệ số 
update Subject set subjectName='Ngữ Văn',priority=1 where subjectId='M005';
-- Cập nhật lại điểm của mã S008
-- Cập nhật điểm ngẫu nhiên cho sinh viên S008
update Mark set point = 8.5 where subjectId = 'MH01' and studentId = 'S009';
update Mark set point = 7 where subjectId = 'MH02' and studentId = 'S009';
update Mark set point = 5.5 where subjectId = 'MH03' and studentId = 'S009';
update Mark set point = 6 where subjectId = 'MH04' and studentId = 'S009';
update Mark set point = 9 where subjectId = 'MH05' and studentId = 'S009';
-- 3. Xoá toàn bộ thông tin của học sinh có mã `S010` 
-- bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT
delete from Mark where studentId = 'S010';
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student 
select*from Student;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1
select subjectId,subjectName from subject where priority=1;
-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ 
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
select student.studentId,student.studentName,
year(curdate())-year(student.birthday) as Age from student ;
-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần
select s.studentName,sb.subjectName,m.point from student as s 
join mark as m on m.studentId=s.studentId
join subject as sb on m.subjectId=sb.subjectId
where sb.subjectName like 'Toán'
order by m.point desc;
-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng). 
select 
case 
 when gender = 0 Then 'Nữ' else 'Name' end as gender,
 count(*) as quantity
 from student
 group by gender;
 -- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm 
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
select s.studentId,
	   s.studentName,
       sum(m.point) as Total_score,
	   avg(m.point) as Avg_score
from student as s 
join mark as m 
on m.studentId=s.studentId
group by s.studentId,s.studentName;   
-- B4: Tạo view, Index, Procedure
-- 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, 
-- tên học sinh, giới tính , quê quán .
create view  STUDENT_VIEW as 
select studentId,studentName,
CASE 
  WHEN gender=1 then 'Nam'
  Else 'Nữ' 
END as gender,
address 
from student;  

select*from STUDENT_VIEW;
-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, 
-- tên học sinh, điểm trung bình các môn học .
create view AVERAGE_MARK_VIEW as
select s.studentId,s.studentName, avg(m.point)
from student as s
join mark as m
on m.studentId=s.studentId
group by s.studentId,s.studentName;
select*from AVERAGE_MARK_VIEW;
-- 3. Đánh Index cho trường phoneNumber của bảng STUDENT.
create index index_phoneNumber on student(phoneNumber);

-- 4. Tạo các PROCEDURE sau: 
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó.
DELIMITER //
  create procedure PROC_INSERTSTUDENT(
   in new_studentId varchar(4),
   in new_studentName varchar(100),
   in new_birthday date,
   in new_gender bit(1),
   in new_address text,
   in new_phoneNumber varchar(45)
  )
  begin 
   inserT into student (studentId,studentName,birthday,gender,address,phoneNumber)
   values (new_studentId,new_studentName,new_birthday,new_gender,new_address,new_phoneNumber);
   end //
   DELIMITER ;
   
   call PROC_INSERTSTUDENT('S011', 'Đinh Hai', '2002-02-28', 1, 'Hà Nội', '0828973921');
   select * from student;
   
    -- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học. 
   DELIMITER //
   create procedure PROC_UPDATESUBJECT(in idUpdate varchar(4),in new_subjectName varchar(45))
   begin
    update subject set subjectName=new_subjectName where subjectId=idUpdate;
    end //
    DELIMITER ;
    
    call PROC_UPDATESUBJECT('M005','Triết học');
   select * from subject;
    -- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh
   DELIMITER //
   create procedure PROC_DELETEMARK (in idDelete varchar(4))
   begin
   delete from mark where studentId=idDelete;
   end //
   DELIMITER ;
   call PROC_DELETEMARK('S010');
   select*from mark 
