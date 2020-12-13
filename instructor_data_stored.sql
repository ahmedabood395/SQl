create proc instructor_data (@ins_id int)
as
begin
select c.crs_name , count(Distinct sc.st_id) 'No_Of_Students'
from ins_course ic, Course c, stud_course sc
where ic.ins_id=@ins_id and ic.crs_id=c.crs_id and c.crs_id=sc.crs_id
group by c.crs_name
end
----------------

exec instructor_data 10

alter proc instructor_data (@ins_id int)
as
begin
select ic.ins_id,c.crs_name , count(Distinct sc.st_id) 'Number_Of_Students'
from ins_course ic, Course c, stud_course sc
where ic.ins_id=@ins_id and ic.crs_id=c.crs_id and c.crs_id=sc.crs_id
group by c.crs_name,ic.ins_id
end
----------------

exec instructor_data 10

