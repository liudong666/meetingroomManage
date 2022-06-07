package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.StaffDao;
import dtoout.CanBooked;
import entity.Staff;
import service.StaffService;

@Service
public class StaffServiceImpl implements StaffService{

	@Autowired
	private StaffDao staffDao ;
	
	@Override
	public Staff getStaff(String staffNumber) {
		
		Staff staff = staffDao.queryStaffById(staffNumber);
		
		return staff;
	}

	//修改个人信息
	@Override
	public boolean modifyInfo(String staffNumber,String newStaffNumber, String newName,
			String newPhone, String newEmail,String newBirthday, String newAddress,
			String newDepartment, String newPosition) {
		// TODO 自动生成的方法存根
		return staffDao.modifyInfo(staffNumber,newStaffNumber,newName,newPhone
				,newEmail,newBirthday,newAddress,newDepartment,newPosition);
	}

	//得到所有用户信息
	@Override
	public List<Staff> getAllStaff() {
		List<Staff> staffs = staffDao.queryAll();
		return staffs;
	}

	@Override
	public boolean addStaff(String staffNumber, String name, String department, String position, String phone) {
		boolean flag = staffDao.addStaff(staffNumber, name, department, position, phone);
		boolean b = staffDao.addLogin(staffNumber, "11111");
		return flag;
	}


	//得到所有可预约时间段
	@Override
	public List<CanBooked> getAllCanBooked() {
		List<CanBooked> allCanBooked = staffDao.queryAllCanBooked();
		return allCanBooked;
	}

}
