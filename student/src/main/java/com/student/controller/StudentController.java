package com.student.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skywares.fw.exception.SysException;
import com.skywares.fw.pojo.QueryObject;
import com.skywares.fw.pojo.RequestResult;
import com.skywares.fw.web.controller.BaseController;
import com.student.projo.Student;
import com.student.projo.User;
import com.student.service.IStudentService;
import com.student.util.Const;
import com.student.util.ExcelBean;
import com.student.util.ExcelDownLoad;

@Controller
@RequestMapping("/")
public class StudentController extends BaseController {

    @Resource
    private IStudentService studentService;

    @RequestMapping("student")
    public String addStudent() {
        return "student.addStudent";
    }

    /**
     * 新增学生（报名）
     * 
     * @return
     */
    @RequestMapping("insertStudent")
    public @ResponseBody RequestResult insertStudent() {
        RequestResult result = new RequestResult();
        try {
            Student student = this.exportModel("student", Student.class);
            student.setCreate_time(new Date());
            studentService.addStudent(student);
        } catch (Exception e) {
            result.setCode(RequestResult.ERROR);
            result.setDesc(e.getMessage());
        }
        return result;
    }

    @RequestMapping("login")
    public String login() {
        return "index.login";
    }

    @RequestMapping("doLogin")
    public @ResponseBody RequestResult doLogin() {
        RequestResult result = new RequestResult();
        try {
            User user = this.exportModel("user", User.class);
            user = studentService.login(user);
            this.getRequest().getSession().setAttribute(Const.ADMIN_USER_SESSION_KEY, user);
        } catch (Exception e) {
            result.setCode(RequestResult.ERROR);
            result.setDesc(e.getMessage());
        }
        return result;
    }

    @RequestMapping("admin")
    public String studentList() {
        return "student.studentList";
    }

    /**
     * 查询学生列表
     * 
     * @param signDate
     * @param name
     * @param phone
     * @param idCard
     * @return
     */
    @RequestMapping("getStudentInfo")
    public @ResponseBody RequestResult getStudentInfo(@RequestParam String signDate, @RequestParam String name,
            @RequestParam String phone, @RequestParam String idCard) {
        RequestResult result = new RequestResult();
        try {
            QueryObject object = new QueryObject();
            object.put("signDate", signDate);
            object.put("name", name);
            object.put("phone", phone);
            object.put("idCard", idCard);
            List<com.student.projo.Student> list = studentService.queryStudentList(object);
            result.setData(list);
        } catch (Exception e) {
            result.setCode(RequestResult.ERROR);
            result.setDesc(e.getMessage());
        }
        return result;
    }

    @RequestMapping("excelStudentInfo")
    public void exportVillage(@RequestParam String signDate, @RequestParam String name, @RequestParam String phone,
            @RequestParam String idCard, HttpServletRequest request, HttpServletResponse response)
            throws UnsupportedEncodingException {
        try {
            QueryObject object = new QueryObject();
            object.put("signDate", signDate);
            object.put("name", name);
            object.put("phone", phone);
            object.put("idCard", idCard);
            List<Student> list = studentService.queryStudentList(object);
            ExcelDownLoad ss = new ExcelDownLoad();
            List<ExcelBean> ems = new ArrayList<ExcelBean>();
            Map<Integer, List<ExcelBean>> exceMap = new LinkedHashMap<Integer, List<ExcelBean>>();
            ems.add(new ExcelBean("姓名", "name", 0));
            ems.add(new ExcelBean("性别", "sex", 0));
            ems.add(new ExcelBean("身份证号", "idCard", 0));
            ems.add(new ExcelBean("电话", "phone", 0));
            ems.add(new ExcelBean("毕业学校", "school", 0));
            ems.add(new ExcelBean("考试类型", "examType", 0));
            ems.add(new ExcelBean("考区", "examArea", 0));
            ems.add(new ExcelBean("监护人姓名", "guardianName", 0));
            ems.add(new ExcelBean("监护人电话", "guardianPhone", 0));
            exceMap.put(0, ems);
            ss.downLoadPayerCreditInfoExcel(request, response, "学生花名册", exceMap, list, Student.class);
        } catch (SysException e) {
            throw new SysException(e.getMessage());
        }
    }

    @RequestMapping("emptyStudentList")
    public @ResponseBody RequestResult emptyStudentList() {
        RequestResult result = new RequestResult();
        try {
            studentService.updateStudentState();
        } catch (Exception e) {
            result.setCode(RequestResult.ERROR);
            result.setDesc(e.getMessage());
        }
        return result;
    }

}
