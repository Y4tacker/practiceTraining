package com.renhouse.utils;

import java.text.SimpleDateFormat;

/**
 * @ClassName TimeUtils
 * @Description 时间操作
 * @Author 1TreeForest
 * @Date 2020/7/16 18:02
 * @Version 1.0
 */
public class TimeUtils {
    /**
     * 格式化日期显示格式
     *
     * @param sdate
     *            原始日期格式 s - 表示 "yyyy-MM-dd" 形式的日期的 String 对象
     * @param format
     *            格式化后日期格式
     * @return 格式化后的日期显示
     */
    public static String dateFormat(String sdate, String format) {
        SimpleDateFormat formatter = new SimpleDateFormat(format);
        java.sql.Date date = java.sql.Date.valueOf(sdate);
        String dateString = formatter.format(date);

        return dateString;
    }

    /**
     * 起始日期yyyy-MM-dd与终止日期yyyy-MM-dd之间跨度的月数。
     *
     * @param beginDate
     *            格式为yyyy-MM-dd
     * @param beginDate
     *            格式为yyyy-MM-dd
     * @return 相差月整数。
     */
    public static int getInterval(String beginDate, String endDate) {

        String regex = "-";// 按照-来进行切割

        String[] date1 = beginDate.split(regex);
        String[] date2 = beginDate.split(regex);

        int y1 = Integer.parseInt(date1[0]);
        int y2 = Integer.parseInt(date2[0]);

        int m1 = Integer.parseInt(date1[1]);
        int m2 = Integer.parseInt(date2[1]);

        return ((y2 - y1) * 12)
                + (m2 - m1) + 1; //相差的月数
    }
}
