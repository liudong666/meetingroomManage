//管理员查看用户界面js

//自定义函数
(function ($) {
	
	//显示员工信息
	$.showStaff = function(staff , i){
		//得到员工工号
		var staffNumber = staff.staffNumber;
		//员工姓名
		var name = staff.name ;
		//员工所在部门
		var department = staff.department ;
		//员工职位
		var position = staff.position;
		//员工手机号
		var phone = staff.phone;
		
		
		//表格行字符串
    	var row = '<tr><td>'+ i +
    				'</td><td>'+staffNumber +
    				'</td><td>' +name +
    				'</td><td>' +department +				
    				'</td><td>' + position + 
    				'</td><td>' + phone + 
    			  '</td></tr>';
    	
    	//添加到表格中
    	$("#showStaffBody").append(row);
	}

})(jQuery)



$(document).ready(function(){
	
	//定义全局变量，保存所有员工信息
	var allStaff ;
	
	//点击左侧菜单即可显示所有员工信息
	$("#showUsersMenu").click(function(){
		//从后台得到所有员工的数据
		//请求参数：无
		$.ajax({
	    	type : "post",
	    	url:"../staff/getAllStaff",
	        success:function(result){
	        	//赋值给全局变量
	        	allStaff = result ;
	        	//先删除表中原数据
	        	$("#showStaffBody").find("tr").remove();
	        	//遍历展示员工信息
	        	for(var i = 0 ; i < result.length ; i++){
	        		//调用自定义函数展示在表格中
	        		$.showStaff(result[i],(i+1));
	        	}
	        }
		});
	});

})