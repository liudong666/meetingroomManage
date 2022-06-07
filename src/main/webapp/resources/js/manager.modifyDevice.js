//管理员修改设备信息界面js

//自定义函数
(function ($) {
	
	//显示一个修改设备信息
	$.showDeviceModify1 = function(device , i){
		//表格行字符串
    	var row = '<tr><td>'+ i +
    				'</td><td class ="deviceId">'+device.deviceId +
    				'</td><td class ="deviceName">' +device.name +
    				'</td><td class ="deviceType">' +device.type +
    				'</td><td><div>'+
	         			'<button class="btn btn-success btn-xs modifyDevicePopB" >修改</button>'+
	         			'<button class="btn btn-success btn-xs deleteDevicePopB" >删除</button>'+
    			    '</div></td></tr>' ;
    			  
    	
    	//添加到表格中
    	$("#modifyDeviceBody1").append(row);
	}
})(jQuery)



$(document).ready(function(){
	
	//定义全局变量。保存所有设备信息
	var allDeviceM ;
	//全局变量，当前操作设备id
	var nowDeviceId ;
	
	//点击左侧菜单，即从后台得到所有设备信息
	$("#modifyDeviceMenu").click(function(){
		//alert("点击了修改设备");
		//请求参数：无
		//返回值：所有设备对象数组，包括设备id，设备名，设备型号
		$.ajax({
	    	type : "post",
	    	url:"../device/getAll",
	    	//contentType:"application/json",
	        //data:JSON.stringify(data),
	    	//data:data,
	        success:function(result){
	        	//alert("得到了数据"+result.length);
	        	//赋值给全局变量
	        	allDeviceM = result ;
	        	//先删除表格原数据内容
	        	$("#modifyDeviceBody1").find("tr").remove();
	        	
	        	//遍历展示设备信息
	        	for(var i = 0 ; i < result.length ; i ++){
	        		//alert("展示一个");
	        		//调用自动义函数展示
	        		$.showDeviceModify1(result[i],(i+1));
	        	}
	        }
		});
	})
	
	//当点击修改按钮时，弹出模态框，并填上模态框
	$(document).on('click','.modifyDevicePopB',function(){
		
		//弹出模态框
		$("#modifyDevicePop1").modal("toggle");
		//得到当前操作的行
		//设备id
		var deviceId = $(this).parents("tr").find(".deviceId").text();
		nowDeviceId = deviceId;
		//设备名
		var dviceName = $(this).parents("tr").find(".deviceName").text();
		//设备型号
		var deviceType = $(this).parents("tr").find(".deviceType").text();
		//填充
		$("#deviceIDModifyInput").val(deviceId);
		//设备id输入框不可修改
		$("#deviceIDModifyInput").attr("disabled","disabled");
		$("#deviceNameModifyInput").val(dviceName);
		$("#deviceTypeModifyInput").val(deviceType);
		
	});
	
	//当点击删除按钮时，弹出警示模态框
	$(document).on('click','.deleteDevicePopB',function(){
		//弹出模态框
		$("#deleteDevicePop").modal("toggle");
		//全局变量  设备id
		 nowDeviceId = $(this).parents("tr").find(".deviceId").text();
	});
	
	//弹出模态框保存按钮点击事件
	$("#confirmDeviceModify").click(function(){
		//设备id
		var deviceId = $("#deviceIDModifyInput").val();
		//设备名
		var deviceName = $("#deviceNameModifyInput").val();
		//设备型号
		var deviceType = $("#deviceTypeModifyInput").val();
		//封装参数
		var data = {
			deviceId:deviceId,
			deviceName:deviceName,
			deviceType,deviceType
		}
		//传到后台修改该设备，返回布尔值
		$.ajax({
	    	type : "post",
	    	url:"../device/modifyDevice",
	    	//contentType:"application/json",
	        //data:JSON.stringify(data),
	    	data:data,
	        success:function(result){
	        	result = JSON.parse(result);
	        	if(result){
	        		alert("修改设备信息成功");
	        	}
	        }
		});
		
		
	});
	
	//删除模态框确定按钮点击事件
	$("#confirmDeleteDevice").click(function(){
		//alert("确认删除点击");
		
		//alert("id:"+ nowDeviceId);
		//封装参数
		var data = {
			deviceId:nowDeviceId
		}
		//传到后台，删除该id的设备,返回布尔值
		$.ajax({
	    	type : "post",
	    	url:"../device/deleteDeviceById",            
	    	//contentType:"application/json",
	        //data:JSON.stringify(data),
	    	data:data,
	        success:function(result){
	        	//从界面删除这个设备（即这行）
	        	result = JSON.parse(result);
	        	if(result){
	        		alert("删除设备成功");
	        	}else{
	        		alert("删除设备失败");
	        	}
	        }
		});
		
	})
	
	
	
	
})