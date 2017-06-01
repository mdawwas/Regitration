package com.atypon.utility;

/**
 * Created by Mohammad on 01/06/2017.
 */
public class Section {
    private int id;
    private int teacherId;
    private int courseId;
    private String time;

    public Section(int id, int teacherId, int courseId, String time) {
        this.id = id;
        this.teacherId = teacherId;
        this.courseId = courseId;
        this.time = time;
    }

    public Section(int teacherId, int courseId, String time) {
        this.teacherId = teacherId;
        this.courseId = courseId;
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

    public String getTime() {
        return time;
    }


}
