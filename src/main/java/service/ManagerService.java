package service;
import java.util.List;

import dtoin.FreeTime;
import dtoout.AllBooked;
import dtoout.AllRoom;
import entity.RoomDevice;

public interface ManagerService {
	
	/**
	 * 管理员新增会议室
	 * @param roomNumber
	 * @param capability
	 * @return
	 */
	public boolean addRoom(String roomNumber, String capability, String attributeType);
	

	/**
	 * 修改会议室空闲时间
	 * @param roomNumber
	 * @param freeTime
	 * @return
	 */
	public boolean setFreeTime(String roomNumber,List<FreeTime> freeTimeList);

	/**
	 * 修改会议室设备
	 * @param roomNumber
	 * @param roomDeviceList
	 * @return
	 */
	public boolean modifyDevice(String roomNumber,List<RoomDevice> roomDeviceList);

	
	/**获取所有会议室信息
	 * @param 无
	 * @return 返回所有会议室的信息
	 */
	public List<AllRoom> getAllRooms();
	
	
	/**
	 * 根据id查询会议室获取该会议室信息
	 * @param roomNumber
	 * @return 该会议室信息数据
	 */
	public AllRoom searchRoomById(String roomNumber);

	
	
	/**
	 * 根据roomNumber删除会议室
	 * @param roomNumber
	 * @return boolean
	 */
	public boolean deleteRoomById(String roomNumber);

	/**
	 * 查看对应员工的所有预约记录
	 * @param
	 * @return List<AllBooked>
	 */
	public List<AllBooked> getPersonalBooked(String staffNumber);
	
	
	/**
	 * 查看全部员工所有预约记录
	 * @param 无
	 * @return List<AllBooked>
	 */
	public List<AllBooked> getAllBooked();


	/**
	 * 修改会议室容量
	 * @param
	 * @param
	 * @return boolean
	 */
	public boolean modifyCapability(String roomNumber, String newCapability);

}
