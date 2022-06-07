package dtoout;

import java.util.List;

//定义一个实体返回所有会议室信息
public class AllRoom {
	private String roomNumber;
	
	private int capability;

	private String attributeType;
	
	private List<FreeTime> freetime;

	private List<MyDevice> myDevice;

	public String getAttributeType() {
		return attributeType;
	}

	public void setAttributeType(String attributeType) {
		this.attributeType = attributeType;
	}

	public int getCapability() {
		return capability;
	}

	public void setCapability(int capability) {
		this.capability = capability;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}


	public List<FreeTime> getFreetime() {
		return freetime;
	}

	public void setFreetime(List<FreeTime> freetime) {
		this.freetime = freetime;
	}

	public List<MyDevice> getMyDevice() {
		return myDevice;
	}

	public void setMyDevice(List<MyDevice> myDevice) {
		this.myDevice = myDevice;
	}

}
