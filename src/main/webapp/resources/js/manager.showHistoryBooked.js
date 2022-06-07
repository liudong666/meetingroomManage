//用户预约记录界面js

//var timeBookedIdd;
//自定义函数
(function ($) {

	//显示一条预约记录
	$.showMyBooked = function (oneBooked, i) {
		//会议室号
		var roomNumber = oneBooked.roomNumber;
		//会议主题
		var roomTitle = oneBooked.roomTitle;
		//主持人
		var compere = oneBooked.compere;
		//参会领导
		var leaderJoin = oneBooked.leaderJoin;
		//参会部门
		var depJoin = oneBooked.depJoin;
		//截取时间08:00:00截取成08:00
		var	ob_startTime = (oneBooked.startTime).substring(0,5);
		var	ob_endtTime = (oneBooked.endTime).substring(0,5);

		//预约时间字符串 2021-01-04 08:00至10:00
		var timeText = oneBooked.startDate + "\t" +
			ob_startTime + "到" +
			ob_endtTime;
		//状态（即备注）
		var status = oneBooked.status;
		// alert("111111111111111111111");
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
		var row = '<tr><td>' + i +
			'</td><td>' + roomNumber +
			'</td><td>' + roomTitle +
			'</td><td>' + compere +
			'</td><td>' + leaderJoin +
			'</td><td>' + depJoin +
			'</td><td>' + timeText +
			'</td>' + statusText +
			'</td></tr>';
		$("#showMyHistoryBody_2").append(row);
	}

})(jQuery)


$(document).ready(function () {

	//点击左侧菜单即可得到我的预约记录
	$("#userBookedRecord_2").click(function () {
		// alert("我的预约记录");
		var staffNumber = $("#userId").text();
		/*var data = {
                staffNumber:staffNumber
        }*/
		//传到后台得到我的预约记录
		$.ajax({
			type: "post",
			url: "../room/getPersonalBooked",
			success: function (result) {
				//先删除表格原内容
				$("#showMyHistoryBody_2").find("tr").remove();
				//显示在表格上
				for (var i = 0; i < result.length; i++) {
					var leaderJoin_1 = result[i].leaderJoin;
					if (leaderJoin_1 == "无" || leaderJoin_1 == ""){
						continue;
					}else {
						$.showMyBooked(result[i], (i + 1));
					}
				}
			}
		});
	});
});