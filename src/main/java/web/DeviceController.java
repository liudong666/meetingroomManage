package web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Device;
import service.DeviceService;

//设备接口

@RequestMapping(value = "/device")
@Controller
public class DeviceController {

	@Autowired
	private DeviceService deviceService ;
	
	//得到所有设备
	@RequestMapping(value = "/getAll")
	@ResponseBody
	public List<Device> getAllDevices(){
		List<Device> devices = deviceService.getAllDevice();
		return devices ;
	}
	
	//新增设备
	@RequestMapping(value = "/addDevice")
	@ResponseBody
	public boolean addOneDevice(HttpServletRequest request){
		//设备名
		String deviceName = request.getParameter("deviceName");
		//设备型号
		String deviceType = request.getParameter("deviceType");
		
		boolean success = deviceService.addOneDevice(deviceName, deviceType);
		return success ;
	}
	
	
	//修改设备信息
	@RequestMapping(value = "/modifyDevice")
	@ResponseBody
	public boolean modifyOneDevice(HttpServletRequest request){
		//设备ID
		String deviceId = request.getParameter("deviceId");
		//设备名
		String deviceName = request.getParameter("deviceName");
		//设备型号
		String deviceType = request.getParameter("deviceType");
		
		boolean success = deviceService.modifyOneDevice(deviceId,deviceName, deviceType);
		return success ;
	}
	
	//删除设备
	@RequestMapping(value = "/deleteDeviceById")
	@ResponseBody
	public boolean deleteOneDevice(HttpServletRequest request){
		//设备ID
		String deviceId = request.getParameter("deviceId");
		boolean success = deviceService.deleteOneDevice(deviceId);
		return success ;
	}
	
}
