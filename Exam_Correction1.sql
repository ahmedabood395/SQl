
create proc Exam_Correction(@Ex_id int,@Stud_id int)
as
create function Model_Ans(@Ex_id , @Stud_id)
returns table
as
return
(
select e.model_ans from Exam e,Stud_Exam s
where s.Ex_id=e.Ex_id and @Ex_id=e.Ex_id and @Stud_id=s.st_id
)

create function Stud_Ans(@Ex_id , @Stud_id)
returns table
as
return
(
select e.st_ans from Exam e,Stud_Exam s
where s.Ex_id=e.Ex_id and @Ex_id=e.Ex_id and @Stud_id=s.st_id
)


declare @numofmodel int
select @numofmodel=count(*)from Model_Ans(@Ex_id,@Stud_id)

declare @numofstudans int
select @numofstudans=count(*)from Model_Ans(@Ex_id,@Stud_id) m, Stud_Ans(@Ex_id,@Stud_id) s
where m.model_ans!=s.st_ans

update Stud_Exam
set Ex_grade=@numofmodel-@numofstudans
where @Ex_id=Ex_id and @Stud_id=st_id
