package com.atypon.utility;

/**
 * Created by Mohammad on 03/06/2017.
 */
public class StudentSection {
    private int sectionId;
    private int grade;
    private String teacherName;
    private String courseName;
    private String time;

    public StudentSection(int sectionId, int grade, String teacherName, String courseName, String time) {
        this.sectionId = sectionId;
        this.grade = grade;
        this.teacherName = teacherName;
        this.courseName = courseName;
        this.time = time;
    }

    public StudentSection(int sectionId, String courseName, String time) {
        this.sectionId = sectionId;
        this.courseName = courseName;
        this.time = time;
    }

    public int getSectionId() {
        return sectionId;
    }

    public int getGrade() {
        return grade;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getTime() {
        return time;
    }
}
