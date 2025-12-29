CREATE TABLE Class (
    class_id     VARCHAR(10)  NOT NULL,
    class_name   VARCHAR(50)  NOT NULL,
    school_year  INT          NOT NULL,

    PRIMARY KEY (class_id),
    UNIQUE (class_name, school_year),
    CHECK (school_year BETWEEN 2000 AND 2100)
);

CREATE TABLE Student (
    student_id    VARCHAR(10)   NOT NULL,
    full_name     VARCHAR(100)  NOT NULL,
    date_of_birth DATE          NOT NULL,
    class_id      VARCHAR(10)   NOT NULL,

    PRIMARY KEY (student_id),
    CHECK (date_of_birth <= '2025-12-29'),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

CREATE TABLE Teacher (
    teacher_id VARCHAR(10)   NOT NULL,
    full_name  VARCHAR(100)  NOT NULL,
    email      VARCHAR(150)  NOT NULL,

    PRIMARY KEY (teacher_id),
    UNIQUE (email)
);

CREATE TABLE Subject (
    subject_id   VARCHAR(10)   NOT NULL,
    subject_name VARCHAR(100)  NOT NULL,
    credits      INT           NOT NULL,
    teacher_id   VARCHAR(10)   NOT NULL,

    PRIMARY KEY (subject_id),
    UNIQUE (subject_name),
    CHECK (credits > 0),
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Enrollment (
    student_id  VARCHAR(10) NOT NULL,
    subject_id  VARCHAR(10) NOT NULL,
    enroll_date DATE        NOT NULL,

    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

CREATE TABLE Score (
    student_id  VARCHAR(10)  NOT NULL,
    subject_id  VARCHAR(10)  NOT NULL,
    mid_score   DECIMAL(3,1) NOT NULL,
    final_score DECIMAL(3,1) NOT NULL,

    PRIMARY KEY (student_id, subject_id),
    CHECK (mid_score BETWEEN 0 AND 10),
    CHECK (final_score BETWEEN 0 AND 10),

    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);