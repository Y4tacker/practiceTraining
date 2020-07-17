package com.renhouse.junit;

import com.renhouse.utils.TimeUtils;
import org.junit.jupiter.api.Test;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class TimeUtilsTest {

    @Test
    void getDateFromString() {
        Date t1 = TimeUtils.getDateFromString("1111-12-30");
        System.out.println(t1);
    }

    @Test
    void getFormatDate() {
        System.out.println(TimeUtils.getFormatDate(new Date()));
    }

    @Test
    void isInStartEnd() {
        boolean t1 = TimeUtils.isInStartEnd("1000-1-2", "1000-1-1", "1000-1-3");
        boolean t2 = TimeUtils.isInStartEnd("1000-1-0", "1000-1-1", "1000-1-3");
        System.out.println(t1);
        System.out.println(t2);
    }

    @Test
    void getInterval() {
        int t1 = TimeUtils.getInterval("1000-1-2", "1000-7-1");
        System.out.println(t1);
    }

    @Test
    void getDateAdd() {
        String t1 = TimeUtils.getDateAdd("1000-1-1",3);
        System.out.println(t1);
    }

    @Test
    void getCurrentDateStr() {
        String t1 = TimeUtils.getCurrentDateStr();
        System.out.println(t1);
    }

    @Test
    void getCurrentDate() {
        Date t1 = TimeUtils.getCurrentDate();
        System.out.println(t1);
    }

    @Test
    void getFormatCurrentAdd() {
        String t1 = TimeUtils.getFormatCurrentAdd(30);
        System.out.println(t1);
    }

    @Test
    void getFormatDateAdd() {
        String t1 = TimeUtils.getFormatDateAdd("1000-1-1",3);
        System.out.println(t1);
    }
}