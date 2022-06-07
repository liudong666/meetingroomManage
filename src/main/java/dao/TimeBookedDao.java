package dao;

import org.apache.ibatis.annotations.Param;

public interface TimeBookedDao {
	
	/**
	 * 插入一条新数据
	 * @param timeBookedId
	 * @param startDate
	 * @param endDate
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	boolean addTimeBooked(@Param("timeBookedId")int timeBookedId,@Param("startDate")String startDate,@Param("endDate")String endDate,
			@Param("startTime")String startTime,@Param("endTime")String endTime);

	/**
	 *
	 * @param roomNumber
	 * @param proposer
	 * @param roomLeader
	 * @param roomDepartment
	 * @param proposerPhone
	 * @param roomTitle
	 * @param roomCompere
	 * @return
	 */
	boolean updateMeetingRoomReg(@Param("staffNumber")String staffNumber,@Param("roomNumber")String roomNumber,@Param("roomTitle") String roomTitle,
								 @Param("proposer")String proposer,@Param("roomCompere") String roomCompere,@Param("roomLeader") String roomLeader,
								 @Param("roomDepartment")String roomDepartment, @Param("proposerPhone")String proposerPhone,
								 @Param("startDate")String startDate, @Param("endDate")String endDate,
								 @Param("startTime")String startTime, @Param("endTime")String endTime
								 );

	boolean modifyMeetingRoomReg(@Param("timeBookedId")int timeBookedId,@Param("roomTitle") String roomTitle,
								 @Param("proposer")String proposer,@Param("roomCompere") String roomCompere,@Param("roomLeader") String roomLeader,
								 @Param("roomDepartment")String roomDepartment, @Param("proposerPhone")String proposerPhone,
								 @Param("startDate")String startDate, @Param("endDate")String endDate,
								 @Param("startTime")String startTime, @Param("endTime")String endTime
	);
   }
