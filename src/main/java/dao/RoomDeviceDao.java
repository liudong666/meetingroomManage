package dao;

import org.apache.ibatis.annotations.Param;

public interface RoomDeviceDao {

	// 删除所有会议室设备
	boolean deleteRoomDevice(@Param("roomNumber") String roomNumber);

	// 增加会议室设备（与删除配合使用，完成更新功能）
	boolean addRoomDevice(@Param("roomNumber") String roomNumber, @Param("deviceId") int deviceId,
			@Param("count") int count);
}
