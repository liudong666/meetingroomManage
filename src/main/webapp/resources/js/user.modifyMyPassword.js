//用户修改个人密码界面js

$(document).ready(function(){

	
	//点击左侧修改密码菜单，填上id
	$("#modifyMyPassMenu").click(function(){
		
		//显示员工工号
		$("#userIdModifyP").val($("#userId").text());
		//alert($("#userId").text());
		$("#userIdModifyP").attr("disabled", true); //设置为不可编辑
	});
	
	
	//提交按钮点击事件
	$("#modifyPasswordBtn").click(function(){
		
		//员工工号
		var staffNumber = $("#userIdModifyP").val();
		//原密码
		var oldPass = $("#oldPassword").val();
		//新密码
		var newPass = $("#newPassword").val();
		//确认新密码
		var defineNewPass = $("#defineNewPassword").val();
		
		//如果确认密码和新密码相同，则允许发给后台修改
		if(newPass == defineNewPass){
			//封装参数
			var data ={
				staffNumber:staffNumber,
				oldPass:oldPass,
				newPass:newPass
			}
			
			//传给后台修改用户密码
			$.ajax({
		    	type : "post",
		    	url:"../login/modifyPassword",
		    	contentType:"application/json",
		        data:JSON.stringify(data),
		    	//data:data,
		        success:function(result){
		        	//返回布尔值  TODO
		        	alert("修改密码成功！");
		        	//密码区域清空
		        	//原密码
		    		var oldPass = $("#oldPassword").val("");
		    		//新密码
		    		var newPass = $("#newPassword").val("");
		    		//确认新密码
		    		var defineNewPass = $("#defineNewPassword").val("");
		        }
	    	});
		}else{
			alert("确认密码和新密码不相同！");
		}
		
		
		
		
		
	});
	
	
	
})


