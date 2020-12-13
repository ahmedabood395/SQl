create proc student_grades (@st_id int)
as
begin
select crs_name,grade from stud_course sc ,Course c
where st_id=@st_id
end

--------------
exec student_grades 2
alter proc student_grades (@st_id int)
as
begin
select st_id,crs_name,grade from stud_course sc ,Course c
where st_id=@st_id and sc.crs_id=c.crs_id
end