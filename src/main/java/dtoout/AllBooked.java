package dtoout;

public class AllBooked {
	private int timeBookedId; //预约过的id
	private String staffNumber; //员工数量
	private int capability; //会议室容量
	private String roomNumber; //房间号
	private String attributeType; //会议类型
	private String roomTitle; //会议名
	private String creator; //创建人
	private String compere; //主持人
	private String leaderJoin; //参会领导
	private String depJoin; //参会部门
	private String creatorPhone;//联系方式
	private int status ; //预约状态
	private BookedTime bookedTime; //预约过的时间
	private String startDate; //开始日期
	private String endDate; //结束日期
	private String startTime; //开始时间
	private String endTime; //结束时间

	@Override
	public String toString() {
		return "AllBooked{" +
				"timeBookedId=" + timeBookedId +
				", staffNumber='" + staffNumber + '\'' +
				", capability=" + capability +
				", roomNumber='" + roomNumber + '\'' +
				", attributeType='" + attributeType + '\'' +
				", roomTitle='" + roomTitle + '\'' +
				", creator='" + creator + '\'' +
				", compere='" + compere + '\'' +
				", leaderJoin='" + leaderJoin + '\'' +
				", depJoin='" + depJoin + '\'' +
				", creatorPhone='" + creatorPhone + '\'' +
				", status=" + status +
				", bookedTime=" + bookedTime +
				", startDate='" + startDate + '\'' +
				", endDate='" + endDate + '\'' +
				", startTime='" + startTime + '\'' +
				", endTime='" + endTime + '\'' +
				'}';
	}

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

	public String getAttributeType() {
		return attributeType;
	}

	public void setAttributeType(String attributeType) {
		this.attributeType = attributeType;
	}

	public String getRoomTitle() {
		return roomTitle;
	}

	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCompere() {
		return compere;
	}

	public void setCompere(String compere) {
		this.compere = compere;
	}

	public String getLeaderJoin() {
		return leaderJoin;
	}

	public void setLeaderJoin(String leaderJoin) {
		this.leaderJoin = leaderJoin;
	}

	public String getDepJoin() {
		return depJoin;
	}

	public void setDepJoin(String depJoin) {
		this.depJoin = depJoin;
	}

	public String getCreatorPhone() {
		return creatorPhone;
	}

	public void setCreatorPhone(String creatorPhone) {
		this.creatorPhone = creatorPhone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public BookedTime getBookedTime() {
		return bookedTime;
	}

	public void setBookedTime(BookedTime bookedTime) {
		this.bookedTime = bookedTime;
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
