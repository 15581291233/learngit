package com.student.util;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TDateUitls {
    public static String getCurrentDate() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");// 设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间
        return date;
    }

    public static String getCurrentDateByType(String format) {
        SimpleDateFormat df = new SimpleDateFormat(format);// 设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间
        return date;
    }

    public static String getCurrentDateMidd() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间
        return date;
    }

    public static Date getCurrentDateByDate(String str) {
        SimpleDateFormat df = new SimpleDateFormat(str);// 设置日期格式
        Date date = new Date();// new Date()为获取当前系统时间
        try {
            String last = df.format(date);
            date = df.parse(last);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return date;
    }

    public static Date getDateCurr(String str) {
        Date date = null;
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");// 设置日期格式
            date = df.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static Date getDateCurrDate(String str) {
        Date date = null;
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
            date = df.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    // 判断是否是时间格式
    public static boolean isValidDate(String str) {
        boolean convertSuccess = true;
        // 指定日期格式为四位年/两位月份/两位日期，注意yyyy/MM/dd区分大小写；
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        try {
            // 设置lenient为false.
            // 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
            format.setLenient(false);
            format.parse(str);
        } catch (ParseException e) {
            // e.printStackTrace();
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            convertSuccess = false;
        }
        return convertSuccess;
    }

    public static Date getDateCurrMM(String str) {
        Date date = null;
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");// 设置日期格式
            // String dates=df.format(new Date());// new Date()为获取当前系统时间
            date = df.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static Date getDate(String str, String format) {
        Date date = null;
        try {
            SimpleDateFormat df = new SimpleDateFormat(format);// 设置日期格式
            // String dates=df.format(new Date());// new Date()为获取当前系统时间
            date = df.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 本月最后一天
     */
    public static Date getCurrMonthLastDay() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // 获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        String last = format.format(ca.getTime());
        Date date = getDate(last, "yyyy-MM-dd");
        return date;
    }

    /**
     * 获取入住时间 选择月数的总时间
     */
    public static Date getMonthLast(int m, String d) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            Date now = format.parse(d);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.MONTH, m);
            calendar.add(Calendar.DAY_OF_MONTH, -1);
            String last = format.format(calendar.getTime());
            date = getDate(last, "yyyy-MM-dd");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 获取当前某个月的下一个月
     */

    public static Date nextDate(Date d) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            Date now = d;
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.MONTH, 1);
            String last = format.format(calendar.getTime());
            date = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 获取某个月的天数
     * 
     * @param date
     * @return
     */
    public static int getDaysOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }

    /**
     * 获取某个月的+1
     * 
     * @param date
     * @return
     */
    public static int getDaysOfMonthNext(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, 1);
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }

    /**
     * 某个时间 加1天
     */
    public static Date nextDay(Date d) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            Date now = d;
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            String last = format.format(calendar.getTime());
            date = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 某个时间 加N天
     */
    public static Date nextNumDay(Date d, int num) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            Date now = d;
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.DAY_OF_MONTH, num);
            String last = format.format(calendar.getTime());
            date = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 获取当前传入日期是几号
     */
    public static int getDayOf(Date date) {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            return calendar.get(Calendar.DAY_OF_MONTH);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;

    }

    /**
     * 获取当前传入日期是几号
     */
    public static int getHoursOf(Date date) {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            int hour = calendar.get(Calendar.HOUR_OF_DAY);
            return hour;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;

    }

    /**
     * 获取当前传入日期是几月
     */
    public static int getMonthOf(Date date) {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            return calendar.get(Calendar.MONTH) + 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;

    }

    /**
     * 某个时间加1个月减1天
     */
    @SuppressWarnings("static-access")
    public static Date getDayJ(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date news = null;
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.MONTH, 1);
            calendar.add(calendar.DATE, -1);
            String last = format.format(calendar.getTime());
            news = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    /**
     * 某个时间加n个月加n天(负数为减)
     */
    @SuppressWarnings("static-access")
    public static Date getMonthNDayN(Date date, int month, int day) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date news = null;
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.MONTH, month);
            calendar.add(calendar.DATE, day);
            String last = format.format(calendar.getTime());
            news = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    /**
     * 获取某个月的月底最后一天的时间
     */
    public static Date getCurrMonthDay(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // 获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        String last = format.format(ca.getTime());
        Date dates = getDate(last, "yyyy-MM-dd");
        return dates;
    }

    /**
     * 获取某个月的下个月的月底的时间
     */
    public static Date getCurrMonthDayNext(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // 获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.add(Calendar.MONTH, 1);
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        String last = format.format(ca.getTime());
        Date dates = getDate(last, "yyyy-MM-dd");
        return dates;
    }

    /**
     * 某个时间的的小个月月底天数
     */
    public static Date getNextMonthDay(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // 获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.add(Calendar.MONTH, 1);
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        String last = format.format(ca.getTime());
        Date dates = getDate(last, "yyyy-MM-dd");
        return dates;
    }

    /**
     * 两个时间之间相差距离多少天
     * 
     * @param one 时间参数 1：
     * @param two 时间参数 2：
     * @return 相差天数
     */
    public static int getDistanceDays(Date one, Date two) {
        int days = 0;
        long time1 = one.getTime();
        long time2 = two.getTime();
        long diff;
        if (time1 < time2) {
            diff = time2 - time1;
        } else {
            diff = time1 - time2;
        }
        days = new Long(diff / (1000 * 60 * 60 * 24)).intValue();
        return days;
    }

    /**
     * 两个日期之间的差（one-two）
     */
    public static int getSubtractDays(Date one, Date two) {
        int days = 0;
        long time1 = one.getTime();
        long time2 = two.getTime();
        long diff = time1 - time2;
        days = new Long(diff / (1000 * 60 * 60 * 24)).intValue();
        return days;
    }

    /**
     * 某个时间加1个月加1天
     */
    @SuppressWarnings("static-access")
    public static Date getMon(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date news = null;
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.MONTH, -1);
            calendar.add(calendar.DATE, 1);
            String last = format.format(calendar.getTime());
            news = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    /**
     * 当前时间的下一周
     */
    public static Date getNextWeek() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.WEEK_OF_YEAR, 1);
        String last = format.format(calendar.getTime());
        date = getDate(last, "yyyy-MM-dd");
        return date;
    }

    /**
     * date类型转字符串
     */
    public static String getDateStr(Date date, String type) {
        SimpleDateFormat format = new SimpleDateFormat(type);
        String s = format.format(date);
        return s;
    }

    /**
     * 获得本月的第几号
     */
    public static Date getCurrentMonthsDay(int day) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, day);
        calendar.add(Calendar.MONTH, 0);
        String index = format.format(calendar.getTime());
        date = getDate(index, "yyyy-MM-dd");
        return date;
    }

    /**
     * 获取两个时间相差多少天 多少个月
     * 
     * @throws ParseException
     */

    public static Map<String, Object> getMDay(Date start, Date end) throws ParseException {

        DateCalculate dateCalculate = DateCalculate.calculate(getDateStr(start, "yyyy/MM/dd"),
                getDateStr(end, "yyyy/MM/dd"));
        Map<String, Object> map = new HashMap<>();
        map.put("month", dateCalculate.getDifferenceOfMonths());
        map.put("day", dateCalculate.getDifferenceOfDays());
        return map;
    }

    /**
     * 判断两个时间是不是在同一个月
     */
    public static boolean getDateIsSameMonth(Date date1, Date date2) {

        Calendar c = Calendar.getInstance();
        c.setTime(date1);
        int month1 = c.get(Calendar.MONTH);
        c.setTime(date2);
        int month2 = c.get(Calendar.MONTH);
        if (month1 == month2) {
            return true;
        }
        return false;
    }

    /**
     * 获得当前时间几天后的日期(负数为几天前)
     */
    public static Date getCurrdateAgainNum(int dayNum) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            Date now = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.DAY_OF_MONTH, dayNum);
            String last = format.format(calendar.getTime());
            date = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 判断该日期是否是该月的最后一天
     * 
     * @param date 需要判断的日期
     * @return
     */
    public static boolean isLastDayOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.DAY_OF_MONTH) == calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }

    /**
     * 获取某个时间到那个月的天数是多少
     */
    public static int getLastDayOfMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.DAY_OF_MONTH);
    }

    /**
     * 获取某个月加几个月后一号的日期
     */

    @SuppressWarnings("static-access")
    public static Date getAddMonThDay(Date date, int i) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(calendar.MONTH, i);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        String last = format.format(calendar.getTime());
        date = getDate(last, "yyyy-MM-dd");
        return date;
    }

    /**
     * 某个月最后一天
     */
    public static Date getAnyMonthLastDay(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        // 获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        String last = format.format(ca.getTime());
        date = getDate(last, "yyyy-MM-dd");
        return date;
    }

    /**
     * date类型转字符串
     */
    public static Date getDates(Date date, String type) {
        SimpleDateFormat format = new SimpleDateFormat(type);
        String s = format.format(date);
        return getDate(s, type);
    }

    /**
     * 获取两个时间相差的月数
     * 
     * @param args
     * @throws ParseException
     */

    public static int getDestance(Date date1, Date date2) {
        Calendar bef = Calendar.getInstance();
        Calendar aft = Calendar.getInstance();
        bef.setTime(date1);
        aft.setTime(date2);
        int result = aft.get(Calendar.MONTH) - bef.get(Calendar.MONTH);
        int month = (aft.get(Calendar.YEAR) - bef.get(Calendar.YEAR)) * 12;
        return Math.abs(month + result);
    }

    /**
     * 设置某个时间的为几号
     * 
     * @return
     */
    public static Date getMouDateR(Date date, int n) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.set(Calendar.DAY_OF_MONTH, n);
        String last = format.format(ca.getTime());
        date = getDate(last, "yyyy-MM-dd");
        return date;
    }

    /**
     * 设置某个时间的为几号
     * 
     * @return
     */
    public static Date getMouDateRNext(Date date, int n) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar ca = Calendar.getInstance();
        ca.setTime(date);
        ca.set(Calendar.DAY_OF_MONTH, n);
        ca.add(Calendar.MONTH, 1);
        String last = format.format(ca.getTime());
        date = getDate(last, "yyyy-MM-dd");
        return date;
    }

    /**
     * 获得当前时间几个月后日期 3/2 -->6/1
     */
    public static Date getMonthAfterNum(int month) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date now = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.MONTH, month);
        calendar.add(Calendar.DATE, -1);
        return getDate(sdf.format(calendar.getTime()), "yyyy-MM-dd");
    }

    /**
     * 获得某个时间几个月后日期 3/2 -->6/1
     */
    public static Date getMonthAfterNumByDate(Date date, int month) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, month);
        calendar.add(Calendar.DATE, -1);
        return getDate(sdf.format(calendar.getTime()), "yyyy-MM-dd");
    }

    /**
     * 某个时间加1个月加1天
     */
    public static Date getDateAddDay(Date now, int dayNum) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.DAY_OF_MONTH, dayNum);
            String last = format.format(calendar.getTime());
            date = getDate(last, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 日期1是否大于日期2
     * 
     * @throws ParseException
     */
    public static boolean getBiJiaoJG(String one, String two) throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date newD = df.parse(one);
        Date oleD = df.parse(two);
        if (newD.getTime() > oleD.getTime()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 某个时间加N个月
     * 
     * @param date
     * @param i
     * @return
     */
    @SuppressWarnings("static-access")
    public static Date getAddMonthByNum(Date date, int monthNum) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(calendar.MONTH, monthNum);
        String last = format.format(calendar.getTime());
        date = getDate(last, "yyyy-MM-dd");
        return date;
    }

    /**
     * 每天的不同时间段不同的排序 ifVIp:是否启用vip优先排序
     * 
     * @return
     */
    public static String getOrderByPage(boolean ifVIp) {
        String orderBy = "";
        int day = TDateUitls.getDayOf(new Date());// 获得当前日期的几号
        int hours = TDateUitls.getHoursOf(new Date());// 几点
        if (day > 10) {
            day = day % 10;// 获得个位数
        }
        if (day >= 0 && day <= 3) {
            if (hours < 12)
                orderBy = "r.create_date desc";
            else
                orderBy = "r.create_date asc";
        } else if (day >= 4 && day <= 6) {
            if (hours < 12)
                orderBy = "r.create_date desc,r.month_rent asc";
            else
                orderBy = "r.create_date asc,r.month_rent desc";
        } else {// day >= 7 && day <= 9
            if (hours < 12)
                orderBy = "r.build_area desc,r.month_rent asc";
            else
                orderBy = "r.build_area asc,r.month_rent desc";
        }
        if (ifVIp) {
            orderBy = "u.if_vip desc," + orderBy;
        }
        return orderBy;
    }

    /**
     * 获得当前时间十位数的时间戳
     * 
     * @return
     */
    public static long getCurrLongTime() {
        Date date = new Date();
        return date.getTime() > 999999999 ? date.getTime() / 1000 : date.getTime();
    }

    /**
     * 获取两个时间范围内的日期
     * 
     * @param args
     * @throws ParseException
     * @throws UnsupportedEncodingException
     */
    public static List<Date> betweenDate(Date begin, Date end) {
        List<Date> list = new ArrayList<Date>();
        while (begin.getTime() <= end.getTime()) {
            list.add(begin);
            begin = TDateUitls.nextDay(begin);
        }
        return list;
    }

    /**
     * 判断当前日期为星期几
     * 
     * @throws ParseException
     * 
     */
    public static Integer getWeekByDay(Date day) throws ParseException {
        Calendar c = Calendar.getInstance();
        c.setTime(day);
        int dayForWeek = 0;
        if (c.get(Calendar.DAY_OF_WEEK) == 1) {
            dayForWeek = 7;
        } else {
            dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1;
        }
        return dayForWeek;
    }

    /**
     * 根据日期判断当月第几周
     * 
     * @param str
     * @return
     * @throws Exception
     */
    public static int getWeek(Date date) throws Exception {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        // 第几周
        int week = calendar.get(Calendar.WEEK_OF_MONTH);
        return week;
    }

    /**
     * 判断两个日期是否为同一天
     * 
     * @param date1
     * @param date2
     * @return
     */
    public static boolean isSameDate(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);

        boolean isSameYear = cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR);
        boolean isSameMonth = isSameYear && cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
        boolean isSameDate = isSameMonth && cal1.get(Calendar.DAY_OF_MONTH) == cal2.get(Calendar.DAY_OF_MONTH);

        return isSameDate;
    }

    public static void main(String[] args) throws Exception {
        Date date = TDateUitls.getDate("2019-09-07", "yyyy-MM-dd");
        try {
            System.out.println(getWeek(date));
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
