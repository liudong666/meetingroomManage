package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LoginDao;
import dao.StaffDao;
import entity.Login;
import entity.Staff;
import service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;
	@Autowired
	private StaffDao staffDao ;

	/**
	 * 判断登陆是否成功
	 * 
	 * @param staffNum
	 * @param password
	 * @return 登陆成功返回true，失败返回false
	 */
	public boolean login(String staffNumber, String password) {
		Login login = loginDao.getByID(staffNumber);
		// login == null表示没有该用户
		if ((login==null) || (!password.equals(login.getPassword()))) {
			return false;
		} else {
			return true;
		}
	}

	
	
	/**
	 * 返回该id是管理员还是用户
	 */
	public String managerOrUser(String staffNumber){
		Staff staff = staffDao.queryStaffById(staffNumber);
		//返回参数
		String position  ;
		if(staff != null){
			//查有此人
			
			//level为0表示用户，1表示管理员
			if(staff.getLevel() == 0){
				position = "user";
			}else if(staff.getLevel() == 1){
				position = "manager";
			}else{
				//都不是就返回“noPeople"
				position = "noPeople";
			}
			return position ;
		}else{
			//查无此人
			position = "noPeople";
		}
		
		return position ;
	}
	
	
	


	/**
	 * 修改密码
	 * @param 员工编号staffNumber
	 * @param 原密码oldPass
	 * @param 新密码newPass
	 * @return boolean
	 */
	@Override
	public boolean modifyPassword(String staffNumber, String oldPass,String newPass) {
		return loginDao.modifyPassword(staffNumber,oldPass,newPass);
	}



	//管理员修改密码，不需要原密码
	@Override
	public boolean managerModifyPassword(String staffNumber, String newPass) {
		boolean modifySuccess = loginDao.forceModifyPassword(staffNumber, newPass);
		return modifySuccess;
	}

}
