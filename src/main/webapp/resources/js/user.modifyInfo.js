//用户修改个人信息界面js

$(document).ready(function(){
	
	//alert("555");
	
	//点击左侧菜单即把输入框的值填上
	$("#modifyMyInfoMenu1").click(function(){
		//alert("点击修改个人信息");
	//从后台得到个人信息
	//请求参数：用户工号
	var staffNumber = $("#userId").text();
	//封装参数
	/*var data = {
		staffNumber:staffNumber
	}*/
	//请求数据，得到我的个人信息
	$.ajax({
    	type : "post",
    	url:"../staff/myInfo",
    	contentType:"application/json",
        //data:JSON.stringify(data),
    	//data:data,
        success:function(result){
        	//显示个人信息在输入框中
        	//工号
        	$("#myId").val(result.staffNumber);
        	$("#myId").attr("disabled", true); //设置为不可编辑
        	//姓名
        	$("#myName").val(result.name);
        	//手机
        	$("#myPhone").val(result.phone);
        	//邮箱
        	$("#myEmail").val(result.email);
        	//生日
        	$("#myBirthday").val(result.birthday);
        	//住址
        	$("#myAddress").val(result.address);
        	//部门
        	$("#myDepartment").val(result.department);
        	$("#myDepartment").attr("disabled", true); //设置为不可编辑
        	//职位
        	$("#myPosition").val(result.position);
        	$("#myPosition").attr("disabled", true); //设置为不可编辑
        	
        }
	});
	
	});
	
	
	
	//提交按钮点击事件
	$("#modifyInformationBtn").click(function(){
		//工号
    	var newStaffNumber =  $("#myId").val();
    	//姓名
    	var newName = $("#myName").val();
    	//手机
    	var newPhone = $("#myPhone").val();
    	//邮箱
    	var newEmail = $("#myEmail").val();
    	//生日
    	var newBirthday = $("#myBirthday").val();
    	//住址
    	//textarea标签也是用val()获得输入值
    	var newAddress = $("#myAddress").val();
    	//var newAddress = $("#myAddress").text();
    	//alert(newAddress);
    	//部门
    	var newDepartment = $("#myDepartment").val();
    	//职位
    	var newPosition = $("#myPosition").val();
    
		//封装
    	var data = {
    		newStaffNumber:newStaffNumber,	
    		newName:newName,
    		newPhone:newPhone,
    		newEmail:newEmail,
    		newBirthday:newBirthday,
    		newAddress:newAddress,
    		newDepartment:newDepartment,
    		newPosition:newPosition
    	}
    	
    	//传到后台，修改个人信息
    	$.ajax({
	    	type : "post",
	    	url:"../staff/modifyInfo",
	    	contentType:"application/json",
	        data:JSON.stringify(data),
	    	//data:data,
	        success:function(result){
	        	//返回布尔值  TODO
	        	result = JSON.parse(result);
	        	if(result){
	        		alert("修改个人信息成功！");
	        	}else{
	        		alert("修改个人信息失败！");
	        	}
	        	
	        }
    	});
		
	});
	
})




