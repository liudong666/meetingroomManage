//打包成功！！！

//用户预约记录界面js
// function checkTime() {
//     //1.获取用户名值
//     var startDate = $("#startDateBooked_1").val();
//     var endDate = $("#endDateBooked_1").val();
//     var startTime = $("#startTimeBooked_1").val();
//     var endTime = $("#endTimeBooked_1").val();
//     var flag;
//     //3.判断，给出提示信息
//     if(startDate && endDate && startTime && endTime){
//         //用户名合法
//         flag = true;
//     }else{
//         //用户名非法,加一个红色边框
//         alert("时间不能为空！");
//         flag = false;
//     }
//     return flag;
// }
//var timeBookedIdd;
//自定义函数
(function ($) {

    //显示一条预约记录
    $.showMyBooked = function (oneBooked, i) {
        //会议室号
        var roomNumber = oneBooked.roomNumber;
        //容纳人数
        //var capability = oneBooked.capability ;
        var staffNumber_1 = oneBooked.staffNumber;

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
		// var	ob_startTime = (oneBooked.startTime).substring(0,5);
		// var	ob_endtTime = (oneBooked.endTime).substring(0,5);
		// var ob_endDate = (oneBooked.endDate).substring(5,10)

        //预约时间字符串 2021-01-04 08:00至10:00
        var timeText = oneBooked.startDate + "\t" +
                        oneBooked.startTime + " 到" + '<br>' +
                        oneBooked.endDate + "\t" +
                        oneBooked.endTime;
        //状态（即备注）
        var status = oneBooked.status;
        //alert("status:"+status);
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

        //表格行字符串  '<td class="modifyOperation">' + operationText +
        // var operationText = '<div>' +
        //     '<button class="btn btn-success btn-xs modifyAll">修改</button>' +
        //     '<button class="btn btn-warning btn-xs cancelPop">取消</button>' +
        //     '</div>';
        var timeBookedIdAndNum = '<div>' +
            '<span>' + i + '</span>' +
            '<span class="timeBookedId" style="visibility: hidden">' + timeBookedId + '</span>' +
            '<span class="staffNumber_1" style="visibility: hidden">' + staffNumber_1 + '</span>' +
            '</div>';
        var row = '<tr><td>' + timeBookedIdAndNum +
            '</td><td class="roomNumberC_1">' + roomNumber +
            '</td><td class="attributeType">' + attributeType +
            '</td><td class="roomTitle">' + roomTitle +
            '</td><td class="creator">' + creator +
            '</td><td class="creatorPhone">' + creatorPhone +
            '</td><td class="compere">' + compere +
            '</td><td class ="leaderJoin">' + leaderJoin +
            '</td><td class="depJoin">' + depJoin +
            '</td><td class="timeText" value="' + timeText + '">' + timeText +
            '</td>' + statusText  +
            '</td></tr>';
        $("#showMyHistoryBody").append(row);
    }

})(jQuery)


$(document).ready(function () {

    //定义全局变量，保存所有预约记录，方便查询，点击左侧菜单即可修改
    var allMyBooked;

    //点击左侧菜单即可得到我的预约记录
    $("#userBookedRecord").click(function () {
        // alert("我的预约记录");
        //从后台得到我的预约记录
        //请求参数：我的id
        //得到我的id

        /*var data = {
                staffNumber:staffNumber
        }*/
        //传到后台得到我的预约记录
        $.ajax({
            type: "post",
            url: "../room/getAllBooked",
            //contentType:"application/json",
            //data:JSON.stringify(data),
            //data:data,
            success: function (result) {
                //得到预约信息对象数组
                allMyBooked = result;
                //先删除表格原内容
                $("#showMyHistoryBody").find("tr").remove();
                $("#showMyHistoryBody_1").find("tr").remove();
                //显示在表格上
                for (var i = 0; i < result.length; i++) {
                    $.showMyBooked(result[i], (i + 1));
                }
            }
        });
    });
});