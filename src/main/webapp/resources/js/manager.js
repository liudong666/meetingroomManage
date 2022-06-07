(function ($) {
        //函数定义，得到所有教师ID和教师名，展示在教师ID下拉框
        $.showAllTeacherInSelect = function () {
        	  //先移除下拉框内容
        	  $("#teacherIdOptions").find("option").remove();  
        	  //参数 ：无
              //返回教师ID数组
              $.ajax({
              	  type : "post",
              	  url:"../teacher/all",
              	  contentType:"application/json",   
                  success:function(result){
                	  $("#teacherIdOptions").find("option").remove();   
           	         //把安排课程页面  教师ID下拉框填上
             	      for(var i = 0 ; i < result.length ; i ++){            
             	    	  var text = result[i].teacherName+"("+result[i].teacherId+")";
             	    	  $("#teacherIdOptions").append("<option value='"+result[i].teacherId+"'>"+text+"</option>"); 
             	      }
                  } 	       
              });
        }
        
 
        
        
    })(jQuery);


$(document).ready(function(){
	
	/*$(".deleteFreePane").click(function(){
		alert("删除键被点击了！");
		//删除所在的父级为form的元素，由于不是直接父级，因此是parents,不是parent
		$(this).parents("form").remove();
	});*/
	
	
	//因为动态增加的元素，使用原本的$(selector).click()不起作用，所以用下面这种方法
	//删除表单
	$(document).on('click','.deleteFreePane',function(){
		//alert("删除键被点击了！");
		//删除所在的父级为form的元素，由于不是直接父级，因此是parents,不是parent
		$(this).parents("form").remove();
	})
	//新增表单
	$(document).on('click','.addFreePane',function(){
		//alert("+键被点击了");
		//新表单的样式，字符串使用单双引号均可，主要看里面的是用什么，反着来就行，不用转义
		var form = '<form class="form-horizontal freeTime"  onsubmit="return false;">' +
		'<div class="form-group "> '+
    		'<label  class="col-xs-3 control-label">开始日期：</label>'+
    		'<div class="col-xs-6 ">'+
        		'<input type="date" class="form-control input-sm duiqi startDate" value="2018-09-24" min="2018-09-16" />'+
        		'</div>'+
		'</div>'+
		'<div class="form-group ">'+
    		'<label  class="col-xs-3 control-label">结束日期：</label>'+
    		'<div class="col-xs-6 ">'+
    			'<input type="date" class="form-control input-sm duiqi endDate" value="2018-09-24" min="2018-09-16" />'+
    		'</div>'+
		'</div>'+
		'<div class="form-group ">'+
    		'<label  class="col-xs-3 control-label">开始时间：</label>'+
    		'<div class="col-xs-6 ">'+
    			'<input type="time" class="form-control input-sm duiqi startTime"  value="09:00"/>'+
        		
    		'</div>'+
		'</div>'+
		'<div class="form-group ">'+
    		'<label  class="col-xs-3 control-label">结束时间：</label>'+
    		'<div class="col-xs-6 ">'+
    		    '<input type="time" class="form-control input-sm duiqi endTime"  value="18:00"/>'+
    		'</div>'+
		'</div>'+
		'<div class="form-group ">'+
    		'<div class="col-xs-6 ">'+
				'<button class="btn btn-success btn-xs addFreePane" >+</button>'+
				'<button class="btn btn-danger btn-xs deleteFreePane"  >-</button>'+
    		'</div>'+
		'</div> '+               
	'</form>';
		
		//alert("来一个新表单！");
		$("#freeBody").append(form);
	})
	
	//设置空闲时间弹出框保存按钮
	$("#saveSetFreeTime").click(function(){
		alert("保存");
		//遍历各个表单，收集表单中的数据
		$(".freeTime").each(function(){
		    alert($(this).find(".startDate").val());
		    alert($(this).find(".endDate").val());
		    alert($(this).find(".startTime").val());
		    alert($(this).find(".endTime").val());
		  });
	});        
	
	       
	       
});
