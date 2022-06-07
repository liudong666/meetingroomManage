package service;

public interface LoginService {
	
	/**
	 * 判断登陆是否成功
	 * @param staffNum
	 * @param password
	 * @return 登陆成功返回true，失败返回false
	 */
	public boolean login(String staffNumber,String password);

	
	
	/**
	 * 查询是用户还是管理员
	 * @param staffNumber
	 * @return
	 */
	String managerOrUser(String staffNumber);


	/**
	 * 修改密码
	 * @param 员工编号staffNumber
	 * @param 原密码oldPass
	 * @param 新密码newPass
	 * @return boolean
	 */
	public boolean modifyPassword(String staffNumber, String oldPass,
			String newPass);

	
	//管理员强制修改用户密码
	boolean managerModifyPassword(String staffNumber , String newPass);
	
	
}
