create proc Exam_correction @Ex_id int,@stud_id int
as
declare @Exam_Q_Num int,@Student_Ans_Fail int
set @Exam_Q_Num=(select count(qs_id)from Exam where @Ex_id=Ex_id)
set @Student_Ans_Fail=(select count(e.qs_id)from Exam e,Stud_Exam s
						where s.Ex_id=e.Ex_id and
							  @Ex_id=e.Ex_id and
							  @stud_id=s.st_id and
							  e.st_ans!=e.model_ans)
update Stud_Exam
set Ex_grade=@Exam_Q_Num-@Student_Ans_Fail
select Ex_grade from Stud_Exam


Exam_correction 18,2
