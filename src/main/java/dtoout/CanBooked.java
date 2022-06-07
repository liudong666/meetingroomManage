package dtoout;

import java.util.List;

//一条可预约信息，包括可预约时间和 id，会议室，容纳人数
public class CanBooked {

	//可预约时间id
	private String canBookedId ;
	//可预约会议室
	private String roomNumber ;
	//容纳人数
	private int capability ;
	//会议室属性
	private String attributeType;
	//会议室设备
	private String deviceName;

	
	//时间
	 //开始日期
	private String startDate ;
	//结束日期
	private String endDate ;
	//开始时间
	private String startTime ;
	//结束时间
	private String endTime ;

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public String getAttributeType() {
		return attributeType;
	}

	public void setAttributeType(String attributeType) {
		this.attributeType = attributeType;
	}

	public String getCanBookedId() {
		return canBookedId;
	}
	public void setCanBookedId(String canBookedId) {
		this.canBookedId = canBookedId;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public int getCapability() {
		return capability;
	}
	public void setCapability(int capability) {
		this.capability = capability;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
	
	
}
