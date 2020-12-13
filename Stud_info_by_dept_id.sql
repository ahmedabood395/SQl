create proc student_info_by_dep_id (@Dept_id int)
as
begin
select * from Student
where Dept_id=@Dept_id
end

-------------------------
exec student_info_by_dep_id 1