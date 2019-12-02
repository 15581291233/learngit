package com.student.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skywares.fw.exception.SysException;
import com.skywares.fw.pojo.QueryObject;
import com.skywares.fw.service.BaseServiceImpl;
import com.student.projo.Student;
import com.student.projo.User;
import com.student.service.IStudentService;

@Service
public class StudentServiceImpl extends BaseServiceImpl implements IStudentService {

    @Override
    public void addStudent(Student student) {
        QueryObject object = new QueryObject();
        object.put("idCard", student.getIdCard());
        int count = gDao.count("queryStudentIsExist", object);
        if (count > 0) {
            throw new SysException("该学生已存在，请勿重复上传");
        }
        gDao.save(student);
    }

    @Override
    public List<Student> queryStudentList(QueryObject object) {
        return gDao.queryForList("queryStudentList", object, Student.class);
    }

    @Override
    public User login(User user) {
        user = gDao.queryForObject("queryUserByNamePwd", user, User.class);
        if (user == null) {
            throw new SysException("用户名或密码错误");
        }
        return user;
    }

    @Override
    public void updateStudentState() {
        gDao.update("updateStudentState", null);
    }

}
