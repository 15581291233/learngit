package com.student.util;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelDownLoad {
    public void downLoadPayerCreditInfoExcel(HttpServletRequest request, HttpServletResponse response, String fileName,
            Map<Integer, List<ExcelBean>> map, List<?> list, Class<?> cls) throws UnsupportedEncodingException {
        response.reset();
        // 指定下载的文件名
        response.setHeader("Content-Disposition",
                "attachment;filename=" + new String(fileName.getBytes("UTF-8"), "ISO8859-1") + ".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        XSSFWorkbook workbook = null;
        try {
            // 导出Excel对象
            /*
             * List<ExcelBean> ems=new ArrayList<>(); ems.add(new
             * ExcelBean("供应商名称","companyName",0)); ems.add(new
             * ExcelBean("票据类型","billType",0)); ems.add(new
             * ExcelBean("票据号","billNumber",0)); // ems.add(new
             * ExcelBean("买方是否参与","isBuyerIquidation",0)); ems.add(new
             * ExcelBean("票据金额","buyerBillAmount",0)); ems.add(new
             * ExcelBean("应付日期","buyerPayTime",0)); ems.add(new
             * ExcelBean("剩余天数","overplusDays",0)); ems.add(new
             * ExcelBean("状态","buyerBillStatus",0)); map.put(0, ems);
             */
            workbook = ExcelUtils.createExcelFile(cls, list, map, fileName);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        OutputStream output;
        try {
            output = response.getOutputStream();

            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
