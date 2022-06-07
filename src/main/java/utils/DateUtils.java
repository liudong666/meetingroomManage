package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    //日期转化为字符串
    public static String date2String(Date date, String pattern){
        SimpleDateFormat sdf=new SimpleDateFormat(pattern);
        String format = sdf.format(date);
        return format;
    }

    //字符串转化为日期
    public static Date string2Date(String str,String str1,String  pattern) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String str2 = str+ " " + str1;
        Date date = sdf.parse(str2);
        return date;
    }
}
