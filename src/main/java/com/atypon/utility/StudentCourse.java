package com.atypon.utility;

/**
 * Created by mdawwas on 5/24/17.
 */
public class StudentCourse {
    int grade;
    String courseName;

    public StudentCourse(int grade, String courseName) {
        this.grade = grade;
        this.courseName = courseName;
    }

    public int getGrade() {
        return grade;
    }

    public String getCourseName() {
        return courseName;
    }
}
