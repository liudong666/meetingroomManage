//用户主界面js

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
	
})