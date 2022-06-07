package web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import dtoout.MyRoom;
import entity.Staff;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ManagerDao;
import dao.StaffDao;
import dtoin.FreeTime;
import dtoin.ModifyDevice;
import dtoin.MyBookTime;
import dtoin.SetFreeTime;
import dtoin.UpdateBook;
import dtoout.AllBooked;
import dtoout.AllRoom;
import dtoout.BookedTime;
import entity.RoomDevice;
import org.springframework.web.servlet.ModelAndView;
import service.BookService;
import service.JwtService;
import service.MailService;
//github.com/StephenChen1/meetingroomManage.git
import service.ManagerService;
import utils.DateCompere;

@RequestMapping(value = "/room", method = {RequestMethod.POST, RequestMethod.GET})
@Controller
public class RoomController {

    @Autowired
    private ManagerService managerService;
    @Autowired
    private ManagerDao managerDao;
    @Autowired
    private BookService bookService;
    @Autowired
    private JwtService jwtService;
    @Autowired
    private StaffDao staffDao;
    @Autowired
    private MailService mailService;


    /**
     * 新增会议室
     *
     * @param request
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public boolean addRoom(HttpServletRequest request) {
        String roomNumber = request.getParameter("roomNumber");
        String capability = request.getParameter("capability");
        String attribute = request.getParameter("attr");
        //System.out.println("attributeType="+attr);
        // 若参数有误，则返回false
        if ((roomNumber == null) || (request.getParameter("capability") == null)) {
            return false;
        }
        return managerService.addRoom(roomNumber, capability, attribute);
    }

    /**
     * 设置会议室空闲时间
     *
     * @param setFreeTime
     * @return
     */
    @RequestMapping("/setFreeTime")
    @ResponseBody
    public boolean setFreeTime(@RequestBody SetFreeTime setFreeTime) {
        String roomNumber = setFreeTime.getRoomNumber();
        List<FreeTime> freeTimeList = setFreeTime.getFreeTime();
        return managerService.setFreeTime(roomNumber, freeTimeList);
    }

    /**
     * 修改会议室设备
     *
     * @param modifyDevice
     * @return
     */
    @RequestMapping("/modifyDevice")
    @ResponseBody
    public boolean modifyDevice(@RequestBody ModifyDevice modifyDevice) {
        String roomNumber = modifyDevice.getRoomNumber();
        List<RoomDevice> roomDeviceList = modifyDevice.getRoomDevice();
        return managerService.modifyDevice(roomNumber, roomDeviceList);
    }

    /**
     * 获取所有会议室信息
     *
     * @param
     * @return 所有会议室信息数据组
     */
    @RequestMapping("/getAllRoom")
    @ResponseBody
    public List<AllRoom> getAllRooms(HttpServletRequest request) {
        List<AllRoom> allRoom = managerDao.getAllRooms();
        //System.out.println("allRoom="+allRoom);
        return allRoom;
    }

    /**
     * 根据id查询会议室获取该会议室信息
     *
     * @param
     * @return 该会议室信息数据
     */
    @RequestMapping("/searchById")
    @ResponseBody
    public AllRoom searchRoomById(@RequestBody(required = false) Map<String, Object> map) {
        String roomNumber = map.get("roomNumber").toString();
        AllRoom allRoom = managerDao.searchRoomById(roomNumber);
        return allRoom;
    }

    /**
     * 用户预约会议室
     *
     * @param updateBook
     * @param token
     * @return
     * @throws MessagingException
     */
    @RequestMapping("/book")
    @ResponseBody
    public boolean book(@RequestBody(required = true) UpdateBook updateBook,
                        @CookieValue(value = "token", required = false) String token) throws MessagingException, ParseException {

        String canBookId = updateBook.getCanBookId();
        int i = Integer.parseInt(canBookId);
        //System.out.println("canBookId="+canBookId);
        String roomNumber = updateBook.getRoomNumber();
        String roomTitle = updateBook.getRoomTitle();
        //System.out.println("roomTitle="+roomTitle);
        String proposer = updateBook.getProposer();
        String roomCompere = updateBook.getRoomCompere();
        String roomLeader = updateBook.getRoomLeader();
        String roomDepartment = updateBook.getRoomDepartment();
        String peoplePhone = updateBook.getPeoplePhone();
        //System.out.println("peoplePhone="+peoplePhone);
        boolean flag;
        //比较时间，给出提示
        MyBookTime bookedTime = updateBook.getMyBookTime();
        String startDate1 = bookedTime.getStartDate();
        String endDate1 = bookedTime.getEndDate();
        String startTime1 = bookedTime.getStartTime();
        //System.out.println("startTime1====="+startTime1);
        String endTime1 = bookedTime.getEndTime();

        // 思路错了，应该先对获取的时间进行分段判断，若有多天，则需要先判断最初的一天
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate11 = sdf1.parse(startDate1);
        Date endDate11 = sdf1.parse(endDate1);
        long startDate11Time = startDate11.getTime();
        long endDate11Time = endDate11.getTime();
        long subNum = endDate11Time - startDate11Time;
        long subNumInt = subNum / 24 / 60 / 60 / 1000;
        //System.out.println("相差天数为："+subNumInt);
        // 建一个外循环
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(startDate11);
        String startDateTime1 = startDate1 + " " + startTime1;
        String endDateTime1 = startDate1 + " " + endTime1;

        Date startDateTime1_1 = new Date();
        Date endDateTime1_1 = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            startDateTime1_1 = sdf.parse(startDateTime1);
            //System.out.println("startDateTime1_1====" + startDateTime1_1);
            endDateTime1_1 = sdf.parse(endDateTime1);
            //System.out.println("两个日期相减");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //前端的毫秒值
        long sTimeD1 = startDateTime1_1.getTime();
        long eTimeD1 = endDateTime1_1.getTime();
        List<AllBooked> personalBooked = this.managerDao.getAllBooked();
        flag = DateCompere.dateCompere(sTimeD1, eTimeD1, roomNumber, personalBooked, 0);
        if (flag == false) {
            return false;
        }
        for (int j = 0; j < subNumInt; j++) { // 4

            calendar.add(calendar.DATE, 1); //把日期往后增加一天,整数  往后推,负数往前移动
            Date date = calendar.getTime(); //这个时间就是日期往后推一天的结果
            String dateToStr = sdf1.format(date);
            startDateTime1 = dateToStr + " " + startTime1;
            endDateTime1 = dateToStr + " " + endTime1;
            startDateTime1_1 = sdf.parse(startDateTime1);
            //System.out.println("startDateTime1_1====" + startDateTime1_1);
            endDateTime1_1 = sdf.parse(endDateTime1);
            long sTimeD11 = startDateTime1_1.getTime();
            long eTimeD11 = endDateTime1_1.getTime();
            flag = DateCompere.dateCompere(sTimeD11, eTimeD11, roomNumber, personalBooked, 0);
            if (flag == false) {
                return false;
            }
        }


        if (flag) {
            Calendar calendar1 = new GregorianCalendar();
            calendar1.setTime(startDate11);
            String staffNumber = this.readCookie(token);
            this.bookService.updateMeetingRoomReg(i, staffNumber, roomNumber, roomTitle, proposer, roomCompere, roomLeader, roomDepartment, peoplePhone, startDate1, startDate1, bookedTime.getStartTime(), bookedTime.getEndTime());
            for (int j = 0; j < subNumInt; j++) { // 4

                calendar1.add(calendar1.DATE, 1); //把日期往后增加一天,整数  往后推,负数往前移动
                Date date = calendar1.getTime(); //这个时间就是日期往后推一天的结果
                String dateToStr = sdf1.format(date);

                // System.out.println("666666666666666666666");
                // System.out.println("staffNumber"+staffNumber);
                this.bookService.updateMeetingRoomReg(i, staffNumber, roomNumber, roomTitle, proposer, roomCompere, roomLeader, roomDepartment, peoplePhone, dateToStr, dateToStr, bookedTime.getStartTime(), bookedTime.getEndTime());

            }
            // 将编号给booked表
            //this.bookService.addBookedAndReturnTBid(i, staffNumber, roomNumber);
            //插入数据到meetingroomreg表
            return true;
        } else {
            return false;
        }
    }

    /**
     * 修改会议室
     *
     * @param updateBook
     * @param token
     * @return
     * @throws MessagingException
     */
    @RequestMapping("/modify")
    @ResponseBody
    public boolean modify(@RequestBody(required = true) UpdateBook updateBook,
                          @CookieValue(value = "token", required = false) String token) throws MessagingException {
        String canBookId = updateBook.getCanBookId();
        int canBookId_1 = Integer.parseInt(canBookId);
        List<AllBooked> personalBooked = managerDao.getAllBooked();
        String roomTitle = updateBook.getRoomTitle();
        String roomNumber = updateBook.getRoomNumber();
        String proposer = updateBook.getProposer();
        String roomCompere = updateBook.getRoomCompere();
        String roomLeader = updateBook.getRoomLeader();
        String roomDepartment = updateBook.getRoomDepartment();
        String peoplePhone = updateBook.getPeoplePhone();
        MyBookTime bookedTime = updateBook.getMyBookTime();//获取修改时间
        String startDate1 = bookedTime.getStartDate();
        String endDate1 = bookedTime.getEndDate();
        String startTime1 = bookedTime.getStartTime();
        String endTime1 = bookedTime.getEndTime();
        String startDateTime1 = startDate1 + " " + startTime1;
        String endDateTime1 = endDate1 + " " + endTime1;
        Date startDateTime1_1 = new Date();
        Date endDateTime1_1 = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            startDateTime1_1 = sdf.parse(startDateTime1);
            endDateTime1_1 = sdf.parse(endDateTime1);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long sTimeD1 = startDateTime1_1.getTime();//获取修改的开始时间
        long eTimeD1 = endDateTime1_1.getTime();//获取修改的结束时间
        long subNum = eTimeD1 - sTimeD1;
        long subNumInt = subNum / 24 / 60 / 60 / 1000;//时间片段
        boolean flag;
        flag = DateCompere.dateCompere(sTimeD1, eTimeD1, roomNumber, personalBooked, canBookId_1);//时间修改不冲突
        if (flag == false) {
            return false;
        }
        if (flag) {
            //将第一个时间片段的唯一标识记录更改，其余记录已插入的方式修改
            this.bookService.modifyMeetingRoomReg(canBookId_1, roomNumber, roomTitle, proposer, roomCompere, roomLeader, roomDepartment, peoplePhone, bookedTime.getStartDate(), bookedTime.getStartDate(), bookedTime.getStartTime(), bookedTime.getEndTime());
            Calendar calendar1 = new GregorianCalendar();//日期对象，用于时间推移
            calendar1.setTime(startDateTime1_1);//将日期标准化
            String staffNumber = this.readCookie(token);//获取用户标识
            for (int j = 0; j < subNumInt; j++) { // 4
                calendar1.add(calendar1.DATE, 1); //把日期往后增加一天,整数  往后推,负数往前移动
                Date date = calendar1.getTime(); //这个时间就是日期往后推一天的结果
                String dateToStr = sdf.format(date);//日期转化为字符串以存储，1表示占位符
                this.bookService.updateMeetingRoomReg(1, staffNumber, roomNumber, roomTitle, proposer, roomCompere, roomLeader, roomDepartment, peoplePhone, dateToStr, dateToStr, bookedTime.getStartTime(), bookedTime.getEndTime());
            }
        } else {
            return false;
        }
        return flag;
    }

    /**
     * 用户取消预约的会议室2
     *
     * @param
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public boolean deleteBooked(@RequestBody AllBooked request) {
        int timeBookedId = request.getTimeBookedId();
        //当预约日期过后，即不能删除

        int status = 0;
        //System.out.println("timeBookedId====="+timeBookedId);
        boolean flag = false;
        boolean flagA;
        if (timeBookedId != 0) {
            flag = managerDao.updateBookedById(timeBookedId, status);
            flagA = managerDao.updateMrrById(timeBookedId, status);
            flag = true;
        }

        return flag;
    }


    public boolean deleteRoomById(@RequestBody(required = false) Map<String, Object> map) {
        String roomNumber = map.get("roomNumber").toString();
        //System.out.println(roomNumber);
        boolean flag = managerService.deleteRoomById(roomNumber);
        return flag;
    }

    /**
     * 查看全部员工所有预约记录
     *
     * @param
     * @return List<AllBooked>
     */
    @RequestMapping("/getAll")
    @ResponseBody
    public List<AllBooked> getAllBooked(HttpServletRequest request) {
        List<AllBooked> allBooked = managerDao.getAllBooked();
        return allBooked;
    }

    /**
     * 查看历史预约记录
     *
     * @param
     * @return List<AllBooked>
     * @throws ParseException
     */
    @RequestMapping("/getHistoryBooked")
    @ResponseBody
    public List<AllBooked> getHistoryBooked(HttpServletRequest request) throws ParseException {

        // 直接返回所有预约记录再对结果判断，要是历史预约记录则放入historyBooked中
        List<AllBooked> allBooked = managerDao.getAllBooked(); // 所有预约记录
        List<AllBooked> historyBooked = new ArrayList<AllBooked>(); // 历史预约记录
        System.out.println("这里是Controller里的getHistoryBooked方法");
        System.out.println(allBooked.size());
        for (int i = 0; i < allBooked.size(); i++) {
            AllBooked allRoom = allBooked.get(i);
            BookedTime freetime = allRoom.getBookedTime();
            try {
                String startDate = freetime.getStartDate();
                String endDate = freetime.getEndDate();
                String startTime = freetime.getStartTime();
                String endTime = freetime.getEndTime();
                System.out.println("start:" + startDate + " " + startTime);
                String startDate_Time = startDate + " " + startTime;
                System.out.println("end:" + endDate + " " + endTime);
                String endDate_Time = endDate + " " + endTime;

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date nowTime = new Date();
                String s = null;
                s = sdf.format(nowTime);
                System.out.println("now:" + s);
                Date now = sdf.parse(s);
                Date bt = sdf.parse(startDate_Time);
                Date et = sdf.parse(endDate_Time);

                // 第一种情况，开始日期的开始时间位于now之前或刚好相等且结束日期的结束时间大于now
                if ((bt.before(now) || bt.equals(now)) && et.after(now)) {
                    historyBooked.add(allRoom);
                }

                // 第二种情况，结束日期的结束时间早于或等于now
                if (et.before(now) || et.equals(now)) {
                    historyBooked.add(allRoom);
                }
            } catch (NullPointerException e) {
                // 当取到BookedTime freetime里的值为null时抛出异常
                System.out.println("已捕获到NullPointerException异常");
            }
            // 用于在表数据还没完整前进行测试
            System.out.println("还没抛出异常时historyBooked的大小：" + historyBooked.size());
        }

        return historyBooked;
    }

    /**
     * 查看未来的预约记录
     *
     * @param
     * @return List<AllBooked>
     * @throws ParseException
     */
    @RequestMapping("/getFutureBooked")
    @ResponseBody
    public List<AllBooked> getFutureBooked(HttpServletRequest request) throws ParseException {

        // 直接返回所有预约记录再对结果判断，要是未来的预约记录则放入futureBooked中
        List<AllBooked> allBooked = managerDao.getAllBooked(); // 所有预约记录
        List<AllBooked> futureBooked = new ArrayList<AllBooked>(); // 未来预约记录
        System.out.println("这里是Controller里的getFutureBooked方法");
        System.out.println(allBooked.size());
        for (int i = 0; i < allBooked.size(); i++) {
            AllBooked allRoom = allBooked.get(i);
            BookedTime freetime = allRoom.getBookedTime();
            try {
                String startDate = freetime.getStartDate();
                String startTime = freetime.getStartTime();
                System.out.println("start:" + startDate + " " + startTime);
                String startDate_Time = startDate + " " + startTime;

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date nowTime = new Date();
                String s = null;
                s = sdf.format(nowTime);
                System.out.println("now:" + s);
                Date now = sdf.parse(s);
                Date bt = sdf.parse(startDate_Time);

                // 开始日期的开始时间位于now之后
                if (bt.after(now)) {
                    futureBooked.add(allRoom);
                }
            } catch (NullPointerException e) {
                // 当取到BookedTime freetime里的值为null时抛出异常
                System.out.println("已捕获到NullPointerException异常");
            }
            // 用于在表数据还没完整前进行测试
            System.out.println("还没抛出异常时futureBooked的大小：" + futureBooked.size());
        }
        return futureBooked;
    }

    /**
     * 查看对应员工的所有预约记录
     *
     * @param
     * @return List<AllBooked>
     */
    @RequestMapping("/getPersonalBooked")
    @ResponseBody
    public List<AllBooked> getPersonalBooked(@CookieValue(value = "token", required = false) String token) {
        String staffNumber = this.readCookie(token);
        List<AllBooked> allBooked = managerService.getPersonalBooked(staffNumber);

        //这里进行判断是否已经结束，结束则设置status为2
        for (int i = 0; i < allBooked.size(); i++) {
            int status_1 = allBooked.get(i).getStatus();
            String startDate = allBooked.get(i).getStartDate();
            String startTime = allBooked.get(i).getStartTime();
            String startDateTime = startDate + " " + startTime;
            String endDate = allBooked.get(i).getEndDate();
            String endTime = allBooked.get(i).getEndTime();
            String endDateTime = endDate + " " + endTime;
            //System.out.println("endDateTime===="+endDateTime);
            Date endDateT_1 = new Date();
            Date startDateT_1 = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                startDateT_1 = sdf.parse(startDateTime);
                endDateT_1 = sdf.parse(endDateTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            long startDT_1 = startDateT_1.getTime();
            long endDT_1 = endDateT_1.getTime();


            Date localDate = new Date();
            long localTime = localDate.getTime();
            //System.out.println("localTime======="+localTime);
            //判断
            if (endDT_1 < localTime && status_1 != 0) {
                int status = 2;
                allBooked.get(i).setStatus(status);
                int timeBookedId = allBooked.get(i).getTimeBookedId();
                //设置表
                // managerDao.updateBookedById(timeBookedId, status);
                managerDao.updateMrrById(timeBookedId, status);
                continue;
            } else if (startDT_1 < localTime && endDT_1 > localTime && status_1 != 0) {
                int status = 3;
                allBooked.get(i).setStatus(status);
                int timeBookedId = allBooked.get(i).getTimeBookedId();
                //设置表
                //managerDao.updateBookedById(timeBookedId, status);
                managerDao.updateMrrById(timeBookedId, status);
            }
        }

        return allBooked;
    }

    /**
     * 查看所有员工的所有预约记录
     *
     * @param
     * @return List<AllBooked>
     */
    @RequestMapping("/getAllBooked")
    @ResponseBody
    public List<AllBooked> getAllBooked(@CookieValue(value = "token", required = false) String token) {
        List<AllBooked> allBooked = managerService.getAllBooked();

        //这里进行判断是否已经结束，结束则设置status为2
        for (int i = 0; i < allBooked.size(); i++) {
            int status_1 = allBooked.get(i).getStatus();
            String startDate = allBooked.get(i).getStartDate();
            String startTime = allBooked.get(i).getStartTime();
            String startDateTime = startDate + " " + startTime;
            String endDate = allBooked.get(i).getEndDate();
            String endTime = allBooked.get(i).getEndTime();
            String endDateTime = endDate + " " + endTime;
            //System.out.println("endDateTime===="+endDateTime);
            Date endDateT_1 = new Date();
            Date startDateT_1 = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                startDateT_1 = sdf.parse(startDateTime);
                endDateT_1 = sdf.parse(endDateTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            long startDT_1 = startDateT_1.getTime();
            long endDT_1 = endDateT_1.getTime();


            Date localDate = new Date();
            long localTime = localDate.getTime();
            //System.out.println("localTime======="+localTime);
            //判断
            if (endDT_1 < localTime && status_1 != 0) {
                int status = 2;
                allBooked.get(i).setStatus(status);
                int timeBookedId = allBooked.get(i).getTimeBookedId();
                //设置表
                // managerDao.updateBookedById(timeBookedId, status);
                managerDao.updateMrrById(timeBookedId, status);
                continue;
            } else if (startDT_1 < localTime && endDT_1 > localTime && status_1 != 0) {
                int status = 3;
                allBooked.get(i).setStatus(status);
                int timeBookedId = allBooked.get(i).getTimeBookedId();
                //设置表
                //managerDao.updateBookedById(timeBookedId, status);
                managerDao.updateMrrById(timeBookedId, status);
            }
        }

        return allBooked;
    }

    /**
     * 修改会议室容量
     *
     * @param
     * @param
     * @return boolean
     */
    @RequestMapping(value = "/modifyCapability", method = RequestMethod.POST)
    @ResponseBody
    public boolean modifyCapability(@RequestBody(required = false) Map<String, Object> map) {
        String roomNumber = map.get("roomNumber").toString();
        String newCapability = map.get("newCapability").toString();
        boolean isOK = managerService.modifyCapability(roomNumber, newCapability);
        // System.out.println("ISOK：" + isOK);
        return isOK;
    }

    /**
     * 私有方法，读取cookie中的token并解析为staffNumber
     *
     * @param token
     * @return
     */
    private String readCookie(@CookieValue(value = "token", required = false) String token) {
        if (token == null) {
            return null;
        }
        String staffNumber = jwtService.getStaffNum(token);
        return staffNumber;
    }

    /**
     * 根据会议室号，返回对应记录
     *
     * @return
     */
    @RequestMapping("/getMeetingRoom")
    @ResponseBody
    public List<MyRoom> getMeetingRoom(HttpServletRequest request) {
        String roomNumber = request.getParameter("roomId");
        //System.out.println("roomNumber"+roomNumber);
        List<MyRoom> meetingRoom = bookService.getMeetingRoom(roomNumber);
        //System.out.println("meetingRoom");
        return meetingRoom;
    }

}
