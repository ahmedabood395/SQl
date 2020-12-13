create proc Exam_Correction @Ex_id int,@Stud_id int
as
declare @ans varchar(500)
select @ans=e.st_ans from Exam e,Stud_Exam s
where s.Ex_id=e.Ex_id and @Ex_id=e.Ex_id and @Stud_id=s.st_id

declare @n int
select @n=count(qs_id) from Exam e,Stud_Exam s
where s.Ex_id=e.Ex_id and @Ex_id=e.Ex_id and @Stud_id=s.st_id
group by e.Ex_id

declare @num int=1
while @n>=@num
begin
	if @n=@num
		update Stud_Exam
		set Ex_grade=@num
		break
	if @ans=(select model_ans from Exam)
		set @num=@num+1
		continue
	if @ans!=(select model_ans from Exam)
		set @n=@n-1
			continue
	
end

