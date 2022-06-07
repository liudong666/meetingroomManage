package service.impl;

import java.util.ArrayList;
import java.util.List;

import dtoout.MyRoom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BookedDao;
import dao.CanBookDao;
import dao.TimeBookedDao;
import dtoin.MyBookTime;
import entity.Booked;
import entity.CanBook;
import service.BookService;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private CanBookDao canBookDao;
	@Autowired
	private BookedDao bookedDao;
	@Autowired
	private TimeBookedDao timeBookedDao;

	@Override
	public List<MyBookTime> updateCanBook(String canBookId, MyBookTime bookedTime) {
		MyBookTime availableTime = canBookDao.getById(canBookId);
		String roomNumber = canBookDao.getRoomNumberById(canBookId);
		List<MyBookTime> myBookTimeList = new ArrayList<MyBookTime>();
		//计算更新后的canBook数据库数据
		MyBookTime stepOneTime = stepOne(availableTime, bookedTime);
		if (stepOneTime != null) {
			myBookTimeList.add(stepOneTime);
		}
		List<MyBookTime> stepTwoTime = stepTwo(availableTime, bookedTime);
		for (MyBookTime mbt : stepTwoTime) {
			if (mbt != null) {
				myBookTimeList.add(mbt);
			}
		}
		MyBookTime stepThreeTime = stepThree(availableTime, bookedTime);
		if (stepThreeTime != null) {
			myBookTimeList.add(stepThreeTime);
		}
		//组装
		List<CanBook> cbList = new ArrayList<CanBook>();
		for (MyBookTime mbt : myBookTimeList) {
			CanBook cb = new CanBook();
			cb.setRoomNumber(roomNumber);
			cb.setStartDate(mbt.getStartDate());
			cb.setEndDate(mbt.getEndDate());
			cb.setStartTime(mbt.getStartTime());
			cb.setEndTime(mbt.getEndTime());
			cbList.add(cb);
		}
		//删除全部
		canBookDao.deleteById(canBookId);
		//批量添加
		canBookDao.batchInsert(cbList);
		return myBookTimeList;
	}

	/**
	 * 算法的第一步，算出预约前的可用时间（注意测试时不要用月头一天和月尾一天！！！）
	 *
	 * @param availableTime
	 * @param bookedTime
	 * @return
	 */
	private MyBookTime stepOne(MyBookTime availableTime, MyBookTime bookedTime) {
		MyBookTime stepOneTime = new MyBookTime();
		String avlStartDate = availableTime.getStartDate();
		String bookedStartDate = bookedTime.getStartDate();
		if (avlStartDate.compareTo(bookedStartDate) == 0) {
			// 若start_date相等，则说明step1不产生新数据，返回null
			return null;
		}
		// 若start_date不相等，计算step1产生的新数据
		// 新数据的endDate为bookStartDate的前一天
		// 其他字段与availableTime一样
		bookedStartDate = setDate(bookedStartDate, -1);
		// 组装新数据
		stepOneTime.setStartDate(avlStartDate);
		stepOneTime.setEndDate(bookedStartDate);
		stepOneTime.setStartTime(availableTime.getStartTime());
		stepOneTime.setEndTime(availableTime.getEndTime());
		return stepOneTime;
	}

	/**
	 * 算法的第二步，算出预约日期里其余的可用时间，产生0~2条数据
	 *
	 * @param availableTime
	 * @param bookedTime
	 * @return
	 */
	private List<MyBookTime> stepTwo(MyBookTime availableTime, MyBookTime bookedTime) {
		List<MyBookTime> list = new ArrayList<MyBookTime>();
		// 第一次比较
		String startTime1 = availableTime.getStartTime();
		String endTime1 = bookedTime.getStartTime();
		// 若两者时间相等，则不产生第一条新数据
		// 不相等时，startTime1、endTime1作为第一条数据的时间，日期与bookedTime相同
		if (startTime1.compareTo(endTime1) != 0) {
			MyBookTime myBookTime1 = new MyBookTime();
			myBookTime1.setStartDate(bookedTime.getStartDate());
			myBookTime1.setEndDate(bookedTime.getEndDate());
			myBookTime1.setStartTime(startTime1);
			myBookTime1.setEndTime(endTime1);
			list.add(myBookTime1);
		}
		// 第二次比较
		String startTime2 = bookedTime.getEndTime();
		String endTime2 = availableTime.getEndTime();
		// 若两者时间相等，则不产生第二条新数据
		// 不相等时，startTime2、endTime2作为第二条数据的时间，日期与bookedTime相同
		if (startTime2.compareTo(endTime2) != 0) {
			MyBookTime myBookTime2 = new MyBookTime();
			myBookTime2.setStartDate(bookedTime.getStartDate());
			myBookTime2.setEndDate(bookedTime.getEndDate());
			myBookTime2.setStartTime(startTime2);
			myBookTime2.setEndTime(endTime2);
			list.add(myBookTime2);
		}
		return list;
	}

	/**
	 * 算法的第三步，算出预约日期到空闲时间之间的可用时间
	 *
	 * @param availableTime
	 * @param bookedTime
	 * @return
	 */
	private MyBookTime stepThree(MyBookTime availableTime, MyBookTime bookedTime) {
		MyBookTime stepThreeTime = new MyBookTime();
		String avlEndDate = availableTime.getEndDate();
		String bookedEndDate = bookedTime.getEndDate();
		if (avlEndDate.compareTo(bookedEndDate) == 0) {
			// 若end_date相等，则说明step3不产生新数据，返回null
			return null;
		}
		// 若end_date不相等，计算step3产生的新数据
		// 新数据的endEndDate为bookedEndDate的后一天
		// 其他字段与availableTime一样
		bookedEndDate = setDate(bookedEndDate, 1);
		// 组装新数据
		stepThreeTime.setStartDate(bookedEndDate);
		stepThreeTime.setEndDate(avlEndDate);
		stepThreeTime.setStartTime(availableTime.getStartTime());
		stepThreeTime.setEndTime(availableTime.getEndTime());
		return stepThreeTime;
	}

	/**
	 * 对String类型的日期进行修改，注意范围不能超过一个月，否则出BUG
	 *
	 * @param date
	 * @param i
	 * @return
	 */
	private String setDate(String date, int i) {
		char c = date.charAt(9);
		int j = c - '0';
		j = j + i;
		StringBuilder strb = new StringBuilder(date);
		strb.replace(9, 10, String.valueOf(j));
		date = strb.toString();
		return date;
	}


	@Override
	public void addBookedAndReturnTBid(int timeBookedId, String staffNumber, String roomNumber) {
		int i = bookedDao.addBooked(staffNumber, roomNumber);
	}

	@Override
	public String getRoomNumber(String canBookId) {
		String roomNumber = canBookDao.getRoomNumberById(canBookId);
		return roomNumber;
	}

	@Override
	public boolean addTimeBooked(int timeBookedId, String startDate, String endDate, String startTime, String endTime) {
		boolean isOK = timeBookedDao.addTimeBooked(timeBookedId, startDate, endDate, startTime, endTime);
		return isOK;
	}

	@Override
	public boolean updateMeetingRoomReg(int timeBookedId,String staffNumber, String roomNumber, String roomTitle, String proposer, String roomCompere, String roomLeader, String roomDepartment, String proposerPhone, String startDate, String endDate, String startTime, String endTime) {
		//System.out.println("timeBookedId="+timeBookedId);
		//System.out.println("startDate="+startDate);
		boolean isOk = timeBookedDao.updateMeetingRoomReg(staffNumber,roomNumber, roomTitle, proposer, roomCompere, roomLeader, roomDepartment, proposerPhone, startDate, endDate, startTime, endTime);
		//System.out.println("isOK="+isOk);
		return isOk;
	}

	@Override
	public List<MyRoom> getMeetingRoom(String roomNumber) {
		return bookedDao.getMeetingRoom(roomNumber);

	}

	@Override
	public boolean modifyMeetingRoomReg(int timeBookedId, String roomNumber, String roomTitle, String proposer, String roomCompere, String roomLeader, String roomDepartment, String proposerPhone, String startDate, String endDate, String startTime, String endTime) {
		boolean isOk = timeBookedDao.modifyMeetingRoomReg(timeBookedId, roomTitle, proposer, roomCompere, roomLeader, roomDepartment, proposerPhone, startDate, endDate, startTime, endTime);
		//System.out.println("isOK="+isOk);
		return isOk;
	}


}
