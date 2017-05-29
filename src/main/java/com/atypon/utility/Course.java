package com.atypon.utility;

/**
 * Created by mdawwas on 5/24/17.
 */
public class Course {
    int id;
    String courseName;
    String courseDesription;

    public Course(int id, String courseName, String courseDesription) {
        this.id = id;
        this.courseName = courseName;
        this.courseDesription = courseDesription;
    }


    public int getId() {
        return id;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getCourseDesription() {
        return courseDesription;
    }
}
