//用户预约界面js
//判断空
function checkRoomTitle() {
    //1.获取用户名值
    var roomTitle = $("#roomTitle").val();
    var flag;
    //3.判断，给出提示信息
    if(roomTitle != ""){
        //用户名合法
        flag = true;
    }else{
        //用户名非法,加一个红色边框
        alert("会议名称不能为空！");
        flag = false;
    }
    return flag;
}
// function checkRoomCompere() {
//     //1.获取用户名值
//     var roomCompere = $("#roomCompere").val();
//     //3.判断，给出提示信息
//     var flag;
//     if(roomCompere != ""){
//         //用户名合法
//         flag = true;
//     }else{
//         //用户名非法,加一个红色边框
//         alert("主持人不能为空！");
//         flag = false;
//     }
//
//     return flag;
// }
function checkRoomDepartment() {
    //1.获取用户名值
    var roomDepartment = $("#roomDepartment").val();
    //3.判断，给出提示信息
    var flag;
    if(roomDepartment != ""){
        //用户名合法
        flag = true;
    }else{
        //用户名非法,加一个红色边框
        alert("参会部门不能为空！");
        flag = false;
    }

    return flag;
}
// function checkRoomLeader() {
//     //1.获取用户名值
//     var roomLeader = $("#roomLeader").val();
//     //3.判断，给出提示信息
//     var flag;
//     if(roomLeader != ""){
//         //用户名合法
//         flag = true
//     }else{
//         //用户名非法,加一个红色边框
//         alert("参会领导不能为空！");
//         flag = false;
//     }
//
//     return flag;
// }
function checkProposer() {
    //1.获取用户名值
    var proposer = $("#roomproposer").val();
    //3.判断，给出提示信息
    var flag;
    if(proposer != ""){
        //用户名合法
        flag = true;
    }else{
        //用户名非法,加一个红色边框
        alert("申请人不能为空！");
        flag = false;
    }

    return flag;
}
function checkPeoplePhone() {
    //1.获取用户名值
    var peoplePhone = $("#peoplePhone").val();
    var reg_peoplePhone = /^1[3|4|5|7|8|9]\d{9}$/;

    //3.判断，给出提示信息
    var flag = reg_peoplePhone.test(peoplePhone);
    if(flag){

    }else{
        //用户名非法,加一个红色边框
        alert("电话号码出错，必须为11位长号！");
    }

    return flag;
}


//自定义函数
(function ($) {
    //函数定义，将可预约对象展示在查看可预约表格中
    //参数为会议室对象和第几个会I也是记录
    $.showCanBooked = function (canBooked, i) {

        //可预订时段id
        var canBookedId = canBooked.canBookedId;
        //得到会议室编号
        var roomNumber = canBooked.roomNumber;
        //得到会议室容纳人数
        var capability = canBooked.capability;
        //得到会议室的属性
        var attributeType = canBooked.attributeType;
        //得到设备信息字符串
        var deviceName = canBooked.deviceName;
        //得到可预约时间段字符串组合，一个时间段写一行数据
        var canBookedText = "";

        canBookedText = canBooked.startDate + "~" +
            canBooked.endDate + "  " +
            canBooked.startTime + "~" +
            canBooked.endTime + "\n";

        //表格行字符串
        var row = '<tr><td class = "index">' + i +
            '</td><td class = "roomNumber">' + roomNumber +
            '</td><td>' + capability +
            '</td><td>' + attributeType +
            '</td><td>' + deviceName +
            '</td><td class = "canBookedId" value="' + canBooked.canBookedId + '">' + canBookedText +
            '</td><td>'+
                '<a class="btn btn-success btn-xs " href="../meetingRoom.jsp?roomId='+roomNumber+'" target="_blank" >查看空闲时间段</a>' +
                ' '+
                '<button class="btn btn-success btn-xs bookedPop"  >预约</button>' +
            '</td></tr>';
        //往表格添加一行
        $("#BookedBody").append(row);


    }
})(jQuery);

/*function checkRoomTitle(){

}*/


$(document).ready(function () {


    //定义全局变量，存放当前所有可预约时间记录，点击左侧菜单即可更新
    var allCanBookedTime;
    //定义全局变量，预约时间id，点击表格预约按钮即可更新该值
    var timeId;
    //定义当前行开始日期
    var startDate;
    //定义当前行结束日期
    var endDate;
    //定义当前行开始时间
    var startTime;
    //定义当前行结束时间
    var endTime;


    // $.ajax({
    //     type : "post",
    //     url:"../login/current",
    //     //contentType:"application/json",
    //     //data:JSON.stringify(data),
    //     //data:data,
    //     success:function(result){
    //         //alert(result.staffNumber + result.staffName);
    //         $("#userName").text(result.staffName);
    //         $("#userId").text(result.staffNumber);
    //         staffNumber = result.staffNumber;
    //     }
    // });

    //点击左侧预约菜单及从后台得到最新的可预约数据
    $("#userBookedRoom").click(function () {
        //alert("会议室重大更新：1、新增个人预约记录记菜单（方便自己已预约会议室的修改和取消）；2、新增连续多天同一时间段使用会议室预约功能。（若每天时间段使用不同，则需每天单独预约）");
        //请求参数无，后台获取所有会议室可预约时间，
        //一个时间段一行，点击预约,最小时间最大时间受此限制
        //返回的是可预约表的全部内容，为对象数组，一个会议室封装成一个对象
        //里面包括属性：会议室号，容纳人数，设备信息(对象数组），可预约时间(对象数组）
        //其中设备信息包括设备id，设备名，设备数量，设备型号
        //可预约时间包括可预约id，开始日期，结束日期，开始时间，结束时间
        $.ajax({
            type: "post",
            url: "../staff/getAllCanBooked",
            success: function (result) {
                //赋值给全局变量，以便后面调用
                allCanBookedTime = result;
                //先清除原数据
                $("#BookedBody").find("tr").remove();
                //编号
                var index = 0;
                //遍历展示这些数据在表格上
                for (var i = 0; i < result.length; i++) {

                    //调用方法展示每一条记录
                    $.showCanBooked(result[i], (i + 1));
                    //得到当前编号，一条时间段就一个编号
                    //index = index + result[i].time.length ;
                }
            }
        });

    });

    //给表格中的预约按钮设置点击即弹出模态框
    $(document).on('click', '.bookedPop', function () {
        //弹出模态框
        $("#bookedPop").modal("toggle");
        //将开始时间，结束时间，最大时间，最小时间设定，填进模态框
        //得到当前行号
        var index = $(this).parents("tr").find(".index").text();

        //得到当前行会议室号
        var roomNumber = $(this).parents("tr").find(".roomNumber").text();
        //得到当前时间段id
        timeId = $(this).parents("tr").find(".canBookedId").attr("value");
        //得到当前申请人
        if (roomNumber == 331) {
            alert("预约331会议室需要向办公室刘丛娅报备，电话：13765961773");
        }

        //alert(index);
        //alert(roomNumber);
        //alert("timeId1:"+timeId);
        for (var i = 0; i < allCanBookedTime.length; i++) {
            //找到了这个时间段,得到时间
            startDate = allCanBookedTime[i].startDate;
            endDate = allCanBookedTime[i].endDate;
            startTime = allCanBookedTime[i].startTime;
            endTime = allCanBookedTime[i].endTime;
            break;
        }
        //用这些时间设置输入框
        //将输入框设置更改格式
        //会议室号
        $("#roomNumberBooked").val(roomNumber);
        $("#roomNumberBooked").attr("disabled", true); //设置为不可编辑
        //申请人不可编辑 时间先后顺序，获取不到的原因
        var staffName = document.getElementById("userName").innerText
        // alert(staffName)
        $("#roomproposer").val(staffName);
        $("#roomproposer").attr("disabled", true);
    });
    //当某一个组件失去焦点是，调用对应的校验方法
    $("#roomTitle").blur(checkRoomTitle);
    // $("#roomCompere").blur(checkRoomCompere);
    $("#roomDepartment").blur(checkRoomDepartment);
    // $("#roomLeader").blur(checkRoomLeader);
    $("#roomproposer").blur(checkProposer);
    $("#peoplePhone").blur(checkPeoplePhone);

    //预约弹出框预约按钮点击事件
    $("#confirmBooked").click(function () {

        //得到会议室号
        var roomNumber = $("#roomNumberBooked").val();
        //得到时间段id
        var roomTitle = $("#roomTitle").val();
        //得到主持人
        var roomCompere = $("#roomCompere").val();
        //得到参会部门
        var roomDepartment = $("#roomDepartment").val();
        //得到参会领导
        var roomLeader = $("#roomLeader").val();
        //得到申请人
        var proposer = $("#roomproposer").val();
        //得到申请人电话
        var peoplePhone = $("#peoplePhone").val();
        //得到开始日期
        var startDate = $("#startDateBooked").val();
        //得到结束日期
        var endDate = $("#endDateBooked").val();
        //得到开始时间
        var startTime = $("#startTimeBooked").val();
        //得到结束时间
        var endTime = $("#endTimeBooked").val();


        if (!(checkRoomTitle()&&checkRoomDepartment()&&checkProposer()&&checkPeoplePhone())){
            alert("填写内容有误！");
            throw SyntaxError();
        }

        var start = startDate + " " + startTime;
        var end = endDate + " " + endTime;

        //开始时间转换为标准日期
        var startT = start.replace("-", "/");//替换字符，变成标准格式 2021/02/02
        var startD = new Date(Date.parse(startT)); //2021-02-19

        //结束时间转换为结束日期
        var endT = endDate + " " + endTime;
        var endD = new Date(Date.parse(endT));
        //另外，判断24小时时间
        var date = new Date();
        var a = startTime.split(":");
        var b = endTime.split(":");


        if (end >= start && date.setHours(a[0], a[1]) < date.setHours(b[0], b[1])) {
            var myBookTime = new Object();
            myBookTime.startDate = startDate;
            myBookTime.endDate = endDate;
            myBookTime.startTime = startTime;
            myBookTime.endTime = endTime;

            //封装参数
            var data = {
                canBookId: timeId,
                roomNumber: roomNumber,
                roomTitle: roomTitle,
                proposer: proposer,
                roomCompere: roomCompere,
                roomLeader: roomLeader,
                roomDepartment: roomDepartment,
                peoplePhone: peoplePhone,
                myBookTime: myBookTime
            }
            //接口未开放
            //发送该预约记录给后台,预约
            $.ajax({
                type: "post",
                url: "../room/book",
                contentType: "application/json",
                data: JSON.stringify(data),
                //data:data,
                success: function (result) {
                    result = $.parseJSON(result);
                    if (result) {
                        alert("预约会议室成功！！！");
                    } else {
                        alert("预约会议室失败，该时间已被预约或日期过期！！！");
                    }
                }
            });
        } else {
            //提示结束时间不能小于开始时间
            alert("结束时间不能早于开始时间");
        }


    });

})





