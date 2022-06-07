package dtoin;

import java.util.List;

import entity.RoomDevice;

public class ModifyDevice {
	private String roomNumber;
	
	private List<RoomDevice> roomDevice;

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public List<RoomDevice> getRoomDevice() {
		return roomDevice;
	}

	public void setRoomDevice(List<RoomDevice> roomDevice) {
		this.roomDevice = roomDevice;
	}
	
}
