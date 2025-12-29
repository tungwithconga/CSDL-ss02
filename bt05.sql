CREATE TABLE Score (
    student_id     VARCHAR(10) NOT NULL,
    subject_id     VARCHAR(10) NOT NULL,
    mid_score      DECIMAL(3,1) NOT NULL,
    final_score    DECIMAL(3,1) NOT NULL,

    PRIMARY KEY (student_id, subject_id),

    CHECK (mid_score BETWEEN 0 AND 10),
    CHECK (final_score BETWEEN 0 AND 10),

    FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
);