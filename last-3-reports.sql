--report 4
create proc exam_qs (@ex_id int)
as
select qs_content from Exam where Ex_id=@ex_id
return
--test
exec exam_qs 18

--report 5
create proc st_answer(@Ex_id int,@st_id int)
as
select e.qs_content,e.st_ans from Exam e ,Stud_Exam s
where e.Ex_id=s.Ex_id and s.Ex_id=@Ex_id and s.st_id=@st_id
return
--test
exec st_answer 19, 2

--report 6
create proc crs_topics(@crs_id int)
as
select topic_name from  Topics where crs_id=@crs_id
return
--test
exec crs_topics 1
-----------------------------
alter proc exam_qs (@ex_id int)
as
select Ex_id,qs_content from Exam where Ex_id=@ex_id
return
-------------------
alter proc st_answer(@Ex_id int,@st_id int)
as
select s.Ex_id,e.qs_content,e.st_ans from Exam e ,Stud_Exam s
where e.Ex_id=s.Ex_id and s.Ex_id=@Ex_id and s.st_id=@st_id
return
------------------------
alter proc crs_topics(@crs_id int)
as
select crs_id,topic_name from  Topics where crs_id=@crs_id
return




