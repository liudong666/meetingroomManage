package service;

import java.util.List;

import dtoin.MyBookTime;
import dtoout.MyRoom;

public interface BookService {

	/**
	 * 根据canBookId获取空闲时间段，对该空闲时间段进行预约
	 * @param book
	 * @return
	 */
	public List<MyBookTime> updateCanBook(String canBookId,MyBookTime bookedTime);

	/**
	 * 插入一条booked数据，并返回timeBookedId主键
	 * @param staffNumber
	 * @param roomNumber
	 * @return
	 */
	public void addBookedAndReturnTBid(int timeBookedId,String staffNumber,String roomNumber);
	
	/**
	 * 根据canBookId返回roomNumber
	 * @param canBookId
	 * @return
	 */
	public String getRoomNumber(String canBookId);
	
	/**
	 * 插入time_booked数据
	 * @param timeBookedId
	 * @param startDate
	 * @param endDate
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public boolean addTimeBooked(int timeBookedId,String startDate,String endDate,String startTime,String endTime);

	/**
	 * 插入一条记录到MeetingRoomReg
	 * @param roomNumber
	 * @param proposer
	 * @param roomLeader
	 * @param roomDepartment
	 * @param proposerPhone
	 * @param roomTitle
	 * @param roomCompere
	 * @return
	 */
    boolean updateMeetingRoomReg(int timeBookedId,String staffNumber,String roomNumber, String roomTitle, String proposer, String roomCompere, String roomLeader, String roomDepartment, String proposerPhone,String startDate,String endDate,String startTime,String endTime);

    List<MyRoom> getMeetingRoom(String roomNumber);

	boolean modifyMeetingRoomReg(int timeBookedId,String roomNumber, String roomTitle, String proposer, String roomCompere, String roomLeader, String roomDepartment, String proposerPhone,String startDate,String endDate,String startTime,String endTime);

}
