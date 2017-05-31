package com.atypon.utility;

/**
 * Created by Mohammad on 01/06/2017.
 */
public class Section {
    private int id;
    private int teacherId;
    private int courseId;
    private String location;
    private String time;

    public Section(int id, int teacherId, int courseId, String location, String time) {
        this.id = id;
        this.teacherId = teacherId;
        this.courseId = courseId;
        this.location = location;
        this.time = time;
    }

    public Section(int teacherId, int courseId, String location, String time) {
        this.teacherId = teacherId;
        this.courseId = courseId;
        this.location = location;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public int getCourseId() {
        return courseId;
    }

    public String getLocation() {
        return location;
    }

    public String getTime() {
        return time;
    }


}