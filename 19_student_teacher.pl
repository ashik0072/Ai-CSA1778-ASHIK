% Facts: student(StudentID, StudentName)
student(s1, john).
student(s2, susan).
student(s3, david).
student(s4, emily).
student(s5, michael).

% Facts: teacher(TeacherID, TeacherName)
teacher(t1, professor_smith).
teacher(t2, professor_jones).
teacher(t3, professor_doe).

% Facts: subject(SubjectCode, SubjectName)
subject(math101, mathematics).
subject(cs101, computer_science).
subject(phy101, physics).
subject(eng101, english).

% Facts: enrollment(StudentID, SubjectCode)
enrollment(s1, math101).
enrollment(s1, cs101).
enrollment(s2, math101).
enrollment(s2, phy101).
enrollment(s3, cs101).
enrollment(s4, eng101).
enrollment(s5, phy101).

% Facts: teaches(TeacherID, SubjectCode)
teaches(t1, math101).
teaches(t2, cs101).
teaches(t3, phy101).
