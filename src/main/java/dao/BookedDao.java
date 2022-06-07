package dao;

import dtoout.MyRoom;
import org.apache.ibatis.annotations.Param;

import entity.Booked;

import java.util.List;

public interface BookedDao {
	/**
	 * 插入booked表的记录，并返回time_booked_id主键，插入时stauts默认为1。插入后，timeBookedId注入到Booked对象中。
	 * 
	 *
	 * @param timeBookedId
	 * @param staffNumber
	 * @param roomNumber
	 * @return
	 */
	public int addBooked(@Param("staffNumber")String staffNumber,@Param("roomNumber") String roomNumber);

	/**
	 * 根据会议室号查询预约记录
	 * @param roomNumber
	 * @return
	 */
	List<MyRoom> getMeetingRoom(String roomNumber);
}
