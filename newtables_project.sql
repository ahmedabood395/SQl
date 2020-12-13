create TABLE Exam
(
	[Ex_id] [int]  NOT NULL FOREIGN KEY REFERENCES Stud_Exam(Ex_id) ,
	[qs_id] [int]  NOT NULL FOREIGN KEY REFERENCES questions([qs_id]),
	[qs_content] [varchar] (500)  NULL,
    [model_ans] [varchar](500)  NULL,
	[st_ans] [varchar](500)  NULL,
	[qs_grade] [int]  NULL,
	
primary key (Ex_id, qs_id)
);
create TABLE Stud_Exam
(
  [Ex_id] [int]  NOT NULL IDENTITY(1,1) ,
  [st_id] [int]  NOT NULL FOREIGN KEY REFERENCES Student(st_id),
  [crs_id] [int]  NOT NULL FOREIGN KEY REFERENCES Course(crs_id),
  [Ex_grade] [int]  NULL,
   primary key (Ex_id)
);

--drop table Exam
--drop TABLE Stud_Exam