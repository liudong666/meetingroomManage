package entity;

public class Booked {
	private int timeBookedId; 
	
	private String staffNumber;
	
	private String roomNumber;
	
	private int status;

	public int getTimeBookedId() {
		return timeBookedId;
	}

	public void setTimeBookedId(int timeBookedId) {
		this.timeBookedId = timeBookedId;
	}

	public String getStaffNumber() {
		return staffNumber;
	}

	public void setStaffNumber(String staffNumber) {
		this.staffNumber = staffNumber;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


}
