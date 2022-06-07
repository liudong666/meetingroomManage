//管理员界面共用的js

$(document).ready(function(){

	
	
	//从后台得到当前登录用户的详细信息
	//请求参数：无 后台从cookie得到当前登录用户id
	$.ajax({
    	type : "post",
    	url:"../login/current",
    	//contentType:"application/json",
        //data:JSON.stringify(data),
    	//data:data,
        success:function(result){
        	//alert(result.staffNumber + result.staffName);
        	$("#userName").text(result.staffName);
        	$("#userId").text(result.staffNumber);
        }
	});
	
	
	//点击设备即可弹出显示设备详情的模态框
	$(document).on('click','.deviceDetailP',function(){
		//弹出模态框，同时也填充好模态框
		$('#showDeviceDetailPop').modal('show');
		//得到设备ID
		
		//得到设备名
		
		//得到设备型号
		
		
	});
	
	
	
	
	
	//点击员工即可弹出显示员工详情的模态框
	$(document).on('click','.staffDetailP',function(){
		//弹出模态框，同时也填充好模态框
		$('#showStaffDetailPop').modal('show');
		//得到员工工号
		
		//得到姓名
		
		//得到
		
		
	});
	
	
	
	
})