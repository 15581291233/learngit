package com.student.service;

import java.util.List;

import com.skywares.fw.pojo.QueryObject;
import com.skywares.fw.service.BaseService;
import com.student.projo.Student;
import com.student.projo.User;

public interface IStudentService extends BaseService {

    void addStudent(Student student);

    List<Student> queryStudentList(QueryObject object);

    User login(User user);

    void updateStudentState();

}
