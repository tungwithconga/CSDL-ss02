CREATE TABLE Teacher (
    teacher_id VARCHAR(10)  PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(150) NOT NULL UNIQUE
);

ALTER TABLE Subject
ADD COLUMN teacher_id VARCHAR(10) NOT NULL;

ALTER TABLE Subject
ADD CONSTRAINT fk_subject_teacher
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id);