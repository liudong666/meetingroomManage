package dao;

import org.apache.ibatis.annotations.Param;

import entity.Login;

public interface LoginDao {

	/**
	 * 根据staffNumber获取认证信息
	 * @param staffNumber
	 * @return
	 */
	Login getByID(@Param("staffNumber") String staffNumber);


	/**
	 * 修改密码
	 * @param 员工编号staffNumber
	 * @param 原密码oldPass
	 * @param 新密码newPass
	 * @return boolean
	 */
	boolean modifyPassword(@Param("staffNumber")String staffNumber, @Param("oldPass")String oldPass, @Param("newPass")String newPass);

	//强制修改密码，不需要原密码
	boolean forceModifyPassword(@Param("staffNumber")String staffNumber, @Param("newPass")String newPass);
	
	
	
}
