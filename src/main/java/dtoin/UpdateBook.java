package dtoin;

public class UpdateBook {
	private String canBookId;
	private String roomNumber;
	private String roomTitle;
	private String proposer;
	private String roomCompere;
	private String roomLeader;
	private String roomDepartment;
	private String peoplePhone;
	//private String textInfo;
	private MyBookTime myBookTime;


	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getRoomTitle() {
		return roomTitle;
	}

	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}

	public String getRoomCompere() {
		return roomCompere;
	}

	public void setRoomCompere(String roomCompere) {
		this.roomCompere = roomCompere;
	}

	public String getRoomDepartment() {
		return roomDepartment;
	}

	public void setRoomDepartment(String roomDepartment) {
		this.roomDepartment = roomDepartment;
	}

	public String getRoomLeader() {
		return roomLeader;
	}

	public void setRoomLeader(String roomLeader) {
		this.roomLeader = roomLeader;
	}

	public String getProposer() {
		return proposer;
	}

	public void setProposer(String proposer) {
		this.proposer = proposer;
	}

	public String getPeoplePhone() {
		return peoplePhone;
	}

	public void setPeoplePhone(String peoplePhone) {
		this.peoplePhone = peoplePhone;
	}

	public String getCanBookId() {
		return canBookId;
	}

	public void setCanBookId(String canBookId) {
		this.canBookId = canBookId;
	}

	public MyBookTime getMyBookTime() {
		return myBookTime;
	}

	public void setMyBookTime(MyBookTime myBookTime) {
		this.myBookTime = myBookTime;
	}

}
