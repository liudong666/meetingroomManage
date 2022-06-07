package dtoout;

//当返回会议室信息需要定义一个AllRoom时，这个实体映射到对应myDevice属性
public class MyDevice {
	private int deviceId;
	private String deviceName;
	private int count;

	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
