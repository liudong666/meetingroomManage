//管理员新增设备界面js

$(document).ready(function(){
	
	//弹出框确定按钮点击事件
	$("#confirmAddDevice").click(function(){
		//alert("点击了增加设备");
		//得到设备名
		var deviceName = $("#deviceNameInput").val();
		//得到设备型号
		var deviceType = $("#deviceTypeInput").val();
		
		//封装参数
		var data  ={
				deviceName : deviceName ,
				deviceType : deviceType
		}
		//传给后台新增一个设备信息，返回该新增设备的信息，即加一个数据库自动生成的设备id
		$.ajax({
	    	type : "post",
	    	url:"../device/addDevice",
	    	//contentType:"application/json",
	        //data:JSON.stringify(data),
	    	data:data,
	        success:function(result){
	        	//返回该设备信息，显示在表格上
	        	//表格行字符串,设备id是假的
	        	var row = '<tr><td>'+ 1 +
	        				'</td><td>' +deviceName +
	        				'</td><td>' +deviceType +				
	        			  '</td></tr>';
	        	//先删除表格原内容
	        	$("#addDeviceBody").find("tr").remove();
	        	//添加到表格中
	        	$("#addDeviceBody").append(row);
	        }
		});
		
		
		
		
	});
	
	
	
})

