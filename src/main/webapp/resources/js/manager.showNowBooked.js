//用户预约记录界面js

//var timeBookedIdd;
//自定义函数
(function ($) {

	//显示一条预约记录
	$.showMyBooked_1 = function (oneBooked, i) {
		//会议室号
		var roomNumber = oneBooked.roomNumber;
		//容纳人数
		//var capability = oneBooked.capability ;
		//得到唯一标识
		var timeBookedId = oneBooked.timeBookedId;
		//会议属性
		var attributeType = oneBooked.attributeType;
		//会议主题
		var roomTitle = oneBooked.roomTitle;
		//创建人
		var creator = oneBooked.creator;
		//主持人
		var compere = oneBooked.compere;
		//参会领导
		var leaderJoin = oneBooked.leaderJoin;
		//参会部门
		var depJoin = oneBooked.depJoin;
		//联系方式
		var creatorPhone = oneBooked.creatorPhone;
		//截取时间08:00:00截取成08:00
		var	ob_startTime = (oneBooked.startTime).substring(0,5);
		var	ob_endtTime = (oneBooked.endTime).substring(0,5);

		//预约时间字符串 2021-01-04 08:00至10:00
		var timeText = oneBooked.startDate + "\t" +
			ob_startTime + "到" +
			ob_endtTime;
		//状态（即备注）
		var status = oneBooked.status;
		// alert("222222222222222222222222");
		var statusText;
		if (status == 0) {
			statusText = '<td class ="text-danger" id="textInfo">已取消</td>';
		} else if (status == 1) {
			statusText = '<td class ="text-success" id="textInfo">预约成功</td>';
		} else if (status == 3) {
			statusText = '<td class ="text-success" id="textInfo">进行中</td>';
		} else {
			statusText = '<td class ="text-info" id="TextInfo">已结束</td>';
		}

		//表格行字符串
		var row = '<tr><td class="timeBookedId">' + timeBookedId +
			'</td><td class="roomNumberC_1" id="roomNumberId_1">' + roomNumber +
			'</td><td>' + attributeType +
			'</td><td>' + roomTitle +
			'</td><td>' + creator +
			'</td><td>' + compere +
			'</td><td>' + leaderJoin +
			'</td><td>' + depJoin +
			'</td><td>' + creatorPhone +
			'</td><td id="timeText" value="' + timeText + '">' + timeText +
			'</td>' + statusText +
			'<td>' + '<button  class="btn btn-success btn-xs cancelPop_1" >取消</button>' +
			'</td></tr>';
		$("#showMyHistoryBody_1").append(row);
	}

})(jQuery)


$(document).ready(function () {

	//定义全局变量，保存所有预约记录，方便查询，点击左侧菜单即可修改
	var allMyBooked;
	var timeBookedId;
	var textCancel;

	//点击左侧菜单即可得到我的预约记录
	$("#userBookedRecord_1").click(function () {
		// alert("我的预约记录");
		//从后台得到我的预约记录
		//请求参数：我的id
		//得到我的id
		var staffNumber = $("#userId").text();
		/*var data = {
                staffNumber:staffNumber
        }*/
		//传到后台得到我的预约记录
		$.ajax({
			type: "post",
			url: "../room/getPersonalBooked",
			//contentType:"application/json",
			//data:JSON.stringify(data),
			//data:data,
			success: function (result) {
				// alert("1111111111");
				//得到预约信息对象数组
				allMyBooked = result;
				//先删除表格原内容
				$("#showMyHistoryBody_1").find("tr").remove();
				//显示在表格上
				for (var i = 0; i < result.length; i++) {
					$.showMyBooked_1(result[i], (i + 1));
				}
			}
		});
	});

	//给表格中的取消按钮设置点击事件
	$(document).on('click', '.cancelPop_1', function () {
		$("#cancelPop_1").modal("toggle");
		//获取取消中的值
		timeBookedId = $(this).parents("tr").find(".timeBookedId").text();
		textCancel = $(this).parents("tr").find("#textInfo").text();
		//alert(textCancel);
	});

	$("#confirmCancelDevice_1").click(function () {
		var staffNumbe = $("#userId").text();
		// alert(staffNumber_1)
		//alert("点击确认！！！");
		if (textCancel == "预约成功") {
			var data = {
				timeBookedId: timeBookedId
			}
			$.ajax({
				type: "post",
				url: "../room/delete",
				contentType: "application/json",
				data: JSON.stringify(data),
				success: function (result) {
					result = $.parseJSON(result);
					if (result) {
						alert("取消成功！！！");
					}
				}
			});
		} else {
			alert("取消失败！！！");
		}
	});


});