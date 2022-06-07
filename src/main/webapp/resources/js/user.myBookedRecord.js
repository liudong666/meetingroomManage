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
    $.showMyBooked_1 = function (oneBooked, i) {
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

        //表格行字符串
        var operationText = '<div>' +
            '<button class="btn btn-success btn-xs modifyAll">修改</button>' +
            '<button class="btn btn-warning btn-xs cancelPop">取消</button>' +
            '</div>';
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
            '<td class="modifyOperation">' + operationText +
            '</td></tr>';
        $("#showMyHistoryBody_1").append(row);
    }

})(jQuery)


$(document).ready(function () {

    //定义全局变量，保存所有预约记录，方便查询，点击左侧菜单即可修改
    var allMyBooked;
    var timeBookedId;
    var textCancel;
    var staffNumber_1

    //点击左侧菜单即可得到我的预约记录
    $("#userBookedRecord_1").click(function () {
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
            url: "../room/getPersonalBooked",
            //contentType:"application/json",
            //data:JSON.stringify(data),
            //data:data,
            success: function (result) {
                //得到预约信息对象数组
                allMyBooked = result;
                //先删除表格原内容
                $("#showMyHistoryBody_1").find("tr").remove();
                $("#showMyHistoryBody").find("tr").remove();
                //显示在表格上
                for (var i = 0; i < result.length; i++) {
                    $.showMyBooked_1(result[i], (i + 1));
                }
            }
        });
    });

    //给表格中的取消按钮设置点击事件
    $(document).on('click', '.cancelPop', function () {
        $("#cancelPop").modal("toggle");
        //获取取消中的值
        timeBookedId = $(this).parents("tr").find(".timeBookedId").text();
        textCancel = $(this).parents("tr").find("#textInfo").text();
        staffNumber_1 = $(this).parents("tr").find(".staffNumber_1").text();
        //alert(textCancel);
    });


    //给表格中的修改按钮设置点击事件
    $(document).on('click', '.modifyAll', function () {
        $("#modifyAll").modal("toggle");
        //获取取消中的值
        roomNumber = $(this).parents("tr").find(".roomNumberC_1").text();
        roomTitle = $(this).parents("tr").find(".roomTitle").text();
        creator = $(this).parents("tr").find(".creator").text();
        compere = $(this).parents("tr").find(".compere").text();
        leaderJoin = $(this).parents("tr").find(".leaderJoin").text();
        depJoin = $(this).parents("tr").find(".depJoin").text();
        creatorPhone = $(this).parents("tr").find(".creatorPhone").text();
        // 对时间进行拆分
        timeText = $(this).parents("tr").find(".timeText").text();
        startDate0 = timeText.substring(0,10);
        //alert(startDate0);
        startTime0 = timeText.substring(11,19);
        endDate0 = timeText.substring(21,31);
        endTime0 = timeText.substring(32,41);
        //alert(endTime0)
        staffNumber_1 = $(this).parents("tr").find(".staffNumber_1").text();
        timeBookedId = $(this).parents("tr").find(".timeBookedId").text();
        textCancel = $(this).parents("tr").find("#textInfo").text();
        $("#roomTitle_2").val(roomTitle);
        $("#creator_2").val(creator);
        $("#compere_2").val(compere);
        $("#leaderJoin_2").val(leaderJoin);
        $("#depJoin_2").val(depJoin);
        $("#creatorPhone_2").val(creatorPhone);
        $("#startDateBooked_2").val(startDate0);
        $("#endDateBooked_2").val(endDate0);
        $("#startTimeBooked_2").val(startTime0);
        $("#endTimeBooked_2").val(endTime0);
        // alert(timeBookedId);
    });

    /*点击确认修改，修改信息*/
    $("#confirmCancelDevice_1").click(function () {
        var staffNumber = $("#userId").text();
        // alert(staffNumber_1);
        // alert(textCancel);
        if (textCancel == "预约成功" && staffNumber == staffNumber_1) {
            //alert(staffNumber_1);
            // alert("修改成功！！！");
            var newRoomTitle = $("#roomTitle_2").val();
            var newCreator = $("#creator_2").val();
            var newCompere = $("#compere_2").val();
            var newLeaderJoin = $("#leaderJoin_2").val();
            var newDepJoin = $("#depJoin_2").val();
            var newCreatorPhone = $("#creatorPhone_2").val();
            var startDate = $("#startDateBooked_2").val();
            var endDate = $("#endDateBooked_2").val();
            var startTime = $("#startTimeBooked_2").val();
            var endTime = $("#endTimeBooked_2").val();

            if (!(startDate && endDate && startTime && endTime)) {
                alert("时间不能为空！");
                throw SyntaxError();
            }
            var start = startDate + " " + startTime;
            var end = endDate + " " + endTime;

            var date = new Date();
            var a = startTime.split(":");
            var b = endTime.split(":");


            if (end >= start && date.setHours(a[0], a[1]) < date.setHours(b[0], b[1])) {
                var myBookTime = new Object();
                myBookTime.startDate = startDate;
                myBookTime.endDate = endDate;
                myBookTime.startTime = startTime;
                myBookTime.endTime = endTime;


                var data = {
                    canBookId: timeBookedId, //预约的标识
                    roomNumber: roomNumber,
                    roomTitle: newRoomTitle,
                    proposer: newCreator,
                    roomCompere: newCompere,
                    roomLeader: newLeaderJoin,
                    roomDepartment: newDepJoin,
                    peoplePhone: newCreatorPhone,
                    myBookTime: myBookTime
                }
                $.ajax({
                    type: "post",
                    url: "../room/modify",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    //data:data,
                    success: function (result) {
                        result = $.parseJSON(result);
                        if (result) {
                            alert("修改预约记录成功！！！");
                            $.ajax({
                                type: "post",
                                url: "../room/getPersonalBooked",
                                //contentType:"application/json",
                                //data:JSON.stringify(data),
                                //data:data,
                                success: function (result) {
                                    //得到预约信息对象数组
                                    allMyBooked = result;
                                    //先删除表格原内容
                                    $("#showMyHistoryBody_1").find("tr").remove();
                                    $("#showMyHistoryBody").find("tr").remove();
                                    //显示在表格上
                                    for (var i = 0; i < result.length; i++) {
                                        $.showMyBooked_1(result[i], (i + 1));
                                    }
                                }
                            });
                        } else {
                            alert("修改预约记录失败！！！");
                        }
                    }
                });
            } else {
                alert("结束时间不能早于开始时间");
            }
        } else {
            alert("修改预约记录失败（只有状态为”预约成功“的才能修改）！！！")
        }
    })

    $("#confirmCancelDevice").click(function () {
        var staffNumbe = $("#userId").text();
        // alert(staffNumber_1)
        //alert("点击确认！！！");
        if (textCancel == "预约成功" && staffNumbe == staffNumber_1) {
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
                        $.ajax({
                            type: "post",
                            url: "../room/getPersonalBooked",
                            //contentType:"application/json",
                            //data:JSON.stringify(data),
                            //data:data,
                            success: function (result) {
                                //得到预约信息对象数组
                                allMyBooked = result;
                                //先删除表格原内容
                                $("#showMyHistoryBody_1").find("tr").remove();
                                $("#showMyHistoryBody").find("tr").remove();
                                //显示在表格上
                                for (var i = 0; i < result.length; i++) {
                                    $.showMyBooked_1(result[i], (i + 1));
                                }
                            }
                        });
                    }
                }
            });
        } else {
            alert("取消失败（只有状态为”预约成功“的才能取消）！！！");
        }
    });

});