package utils;

import dtoout.AllBooked;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

// 时间比较工具
public class DateCompere {

    public static boolean dateCompere(long sTimeD1, long eTimeD1, String roomNumber, List<AllBooked> personalBooked, int canBookId_1) {
        Date localDate = new Date();
        long localDateTime = localDate.getTime();
        //boolean flag = true;

        if (sTimeD1 >= localDateTime) {
            //遍历
            for (int i1 = 0; i1 < personalBooked.size(); i1++) { //遍历所有会议室
                String roomNumber1 = personalBooked.get(i1).getRoomNumber();
                int timeBookedId = personalBooked.get(i1).getTimeBookedId();//获取会议室唯一标识
                //获取状态，若状态为0则不遍历
                int status = personalBooked.get(i1).getStatus();//获取会议室状态，只有状态为0，已取消的会议室才不用比较
                //System.out.println("status===="+i1+status);
                //System.out.println("roomNumber1="+roomNumber1);
                if (roomNumber1.equals(roomNumber) && status != 0 && timeBookedId != canBookId_1) { //0不比，只比相同会议室，不比同一会议室
                    String startDate2 = personalBooked.get(i1).getStartDate();
                    //System.out.println("startDate=========="+startDate2);
                    String endDate2 = personalBooked.get(i1).getEndDate();
                    String startTime2 = personalBooked.get(i1).getStartTime();
                    //System.out.println("startTime2===="+startTime2);
                    String endTime2 = personalBooked.get(i1).getEndTime();
                    //System.out.println("endTime2===="+endTime2);
                    //拼接
                    String startDateTime2 = startDate2 + " " + startTime2;
                    //System.out.println("startDateTime2=========="+startDateTime2);
                    String endDateTime2 = endDate2 + " " + endTime2;
                    //System.out.println("endDateTime2=========="+endDateTime2);
                    Date startDateTime2_2 = new Date();
                    Date endDateTime2_2 = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    try {
                        startDateTime2_2 = sdf.parse(startDateTime2);
                        //System.out.println("startDateTime2_2====="+startDateTime2_2);
                        endDateTime2_2 = sdf.parse(endDateTime2);
                        //System.out.println("endDateTime2_2====="+endDateTime2_2);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    //数据库时间的毫秒值
                    long sTimeD2 = startDateTime2_2.getTime();//会议室开始时间
                    long eTimeD2 = endDateTime2_2.getTime();//会议室结束时间
                    //System.out.println("sTimeD2-eTimeD2"+i1+" "+sTimeD2+eTimeD2);

                    if (sTimeD1 < eTimeD2 && eTimeD1 >= eTimeD2) { // e1>e2>s1
                        return false;
//                        flag = false;
//                        //System.out.println("222222222222222");
//                        break;
                    } else if (eTimeD1 > sTimeD2 && sTimeD1 <= sTimeD2) { // e1>s2>s1
                        return false;
//                        flag = false;
//                        //System.out.println("33333333333333");
//                        break;
                    } else if (sTimeD1 >= sTimeD2 && eTimeD1 <= eTimeD2){ // s1>s2 e1<e2
                        return false;
//                        flag = false;
//                        //System.out.println("444444444444444");
//                        break;
                    } else if (sTimeD1 <= sTimeD2 && eTimeD1 >= eTimeD2){ // s1<s2 e1>e2
                        return false;
                        //flag = false;
                        //System.out.println("55555555555555555");
                        //break;
                    } else { //saaaaaaaaaaaaaaaaaaaaaaa
                        //flag = true;
                        // 先将只预约一天的给直接插进去

                        // 相差天数进行循环，生成每一天的预约时间片段
                        //System.out.println("111111111111");
                        continue;
                    }
                }
            }
        } else {
            return false;
            //flag = false;
        }
        return true;
    }

}
