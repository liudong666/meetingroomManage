package service;

import java.util.List;

import entity.Device;

public interface DeviceService {

	
	/**
	 * 得到所有设备信息
	 * @return
	 */
	List<Device> getAllDevice();
	
	//增加设备信息
	boolean addOneDevice(String deviceName,String deviceType);
	
	//修改设备信息
	boolean modifyOneDevice(String deviceId,String deviceName ,String deviceType);
	
	//删除设备
	boolean deleteOneDevice(String deviceId);
	
}
