package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.DeviceDao;
import entity.Device;
import service.DeviceService;

@Service
public class DeviceServiceImpl implements DeviceService {

	@Autowired
	private DeviceDao deviceDao ;
	
	@Override
	public List<Device> getAllDevice() {
		List<Device> devices  = deviceDao.queryAllDevices();
		return devices;
	}

	//新增设备
	@Override
	public boolean addOneDevice(String deviceName, String deviceType) {
		boolean success = deviceDao.addDevice(deviceName, deviceType);
		return success;
	}

	@Override
	public boolean modifyOneDevice(String deviceId, String deviceName, String deviceType) {
		boolean success = deviceDao.modifyDevice(deviceId, deviceName, deviceType);
		return success;
	}

	@Override
	public boolean deleteOneDevice(String deviceId) {
		boolean success = deviceDao.deleteDeviceById(deviceId);
		return success;
	}

	
	
}
