package com.atypon.utility;

/**
 * Created by mdawwas on 5/24/17.
 */
public class Course {
    int id;
    String courseName;
    String courseDescription;

    public Course(int id, String courseName, String courseDescription) {
        this.id = id;
        this.courseName = courseName;
        this.courseDescription = courseDescription;
    }


    public int getId() {
        return id;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getCourseDescription() {
        return courseDescription;
    }
}
