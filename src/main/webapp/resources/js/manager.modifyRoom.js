//修改会议室界面js

//自定义函数
(function ($) {
    //展示表格所有数据，参数：所有会议室数据
    $.showAllRoom = function (result) {
        //先移除所有选项
        //先删除表上的旧数据
        $("#modifyRoomBody").find("tr").remove();
        //TODO把数据展示出来，包括编号，会议室号，容纳人数，空闲时间，设备信息
        for (var i = 0; i < result.length; i++) {
            //得到会议室号
            var roomNumber = result[i].roomNumber;
            //得到容纳人数
            var capability = result[i].capability;
            //得到会议属性
            var attribute = result[i].attributeType;
            //遍历得到所有空闲时间
            var freeText = "";
            for (var j = 0; j < result[i].freetime.length; j++) {
                freeText = freeText + result[i].freetime[j].startDate +
                    "~" + result[i].freetime[j].endDate +
                    " " + result[i].freetime[j].startTime +
                    "~" + result[i].freetime[j].endTime + "<br>"
                ;
            }

            //得到设备信息//TODO
            var deviceText = "";
            for (var j = 0; j < result[i].myDevice.length; j++) {
                //alert(result[i].myDevice[j].name);
                deviceText = deviceText + result[i].myDevice[j].deviceName +
                    "*" + result[i].myDevice[j].count + "<br>"
                ;
            }
            var oprationText = '<div>' +
                '<button class="btn btn-success btn-xs modifyCapability" data-toggle="modal" data-target="#modifyCapabilityPop">修改人数</button>' +
                '<button class="btn btn-warning btn-xs modifyFreeTime" data-toggle="modal" data-target="#modifyFreeTimePop">修改时间</button>' +
                '<button class="btn btn-info btn-xs modifyDevice"  data-toggle="modal" data-target="#modifyDevicePop">修改设备</button>' +
                '<button class="btn btn-danger btn-xs deleteRoom"  data-toggle="modal" data-target="#mdeleteRoomPop">删除</button>' +
                '</div>';
            $("#modifyRoomBody").append('<tr><td class = "index">' + (i + 1) +
                '</td><td class="roomNumber">' + roomNumber +
                '</td><td class = "nowCapability">' + capability +
                '</td><td class = "attribute">' + attribute +
                '</td><td class = "nowFreeTime">' + freeText +
                '</td><td class = "nowDevice">' + deviceText +
                '</td><td class = "modifyOprationDiv">' + oprationText +
                '</td><tr>'
            );
        }

    }


})(jQuery)

$(document).ready(function () {

    //定义全局变量，当前操作的行编号
    var index = 0;
    //定义全局变量,当前需要修改的会议室号
    var modifyRoomNumber;
    //定义全局变量,所有会议室信息
    var allModifyRoom;
    //定义全局变量，所有设备信息
    var allDevices;

    //初始化事件
    //当点击左侧修改会议室菜单时，就从后台获取到最新的所有会议室信息
    $("#modifyRoomDiv").click(function () {

        //从后台获取所有会议室详情
        $.ajax({
            type: "post",
            url: "../room/getAllRoom",
            //contentType:"application/json",
            //data:JSON.stringify(data),
            //data:data,
            success: function (result) {

                //保存数据到全局变量
                allModifyRoom = result;
                //调用自定义函数展示所有数据在表格上
                $.showAllRoom(result);
                /*//先删除表上的旧数据
                $("#modifyRoomBody").find("tr").remove();
                //TODO把数据展示出来，包括编号，会议室号，容纳人数，空闲时间，设备信息
                for(var i = 0 ; i < result.length ; i ++){
                      //得到会议室号
                      var roomNumber = result[i].roomNumber;
                      //得到容纳人数
                      var capability = result[i].capability ;
                      //遍历得到所有空闲时间
                      var freeText = "";
                      for(var j = 0 ; j< result[i].freetime.length ; j++){
                          freeText = freeText + result[i].freetime[j].startDate +
                                      "~" + result[i].freetime[j].endDate +
                                      " " + result[i].freetime[j].startTime +
                                      "~" + result[i].freetime[j].endTime +"<br>"
                          ;
                      }

                      //得到设备信息//TODO
                      var deviceText ="";
                      for(var j = 0 ; j <result[i].myDevice.length ; j ++){
                          //alert(result[i].myDevice[j].name);
                          deviceText = deviceText + result[i].myDevice[j].deviceName +
                                          "*" + result[i].myDevice[j].count +"<br>"
                          ;
                      }
                      var oprationText = '<div>'+
                                             '<button class="btn btn-success btn-xs modifyCapability" data-toggle="modal" data-target="#modifyCapabilityPop">修改人数</button>'+
                                            '<button class="btn btn-warning btn-xs modifyFreeTime" data-toggle="modal" data-target="#modifyFreeTimePop">修改时间</button>'+
                                            '<button class="btn btn-info btn-xs modifyDevice"  data-toggle="modal" data-target="#modifyDevicePop">修改设备</button>'+
                                            '<button class="btn btn-danger btn-xs deleteRoom"  data-toggle="modal" data-target="#mdeleteRoomPop">删除</button>'+
                                        '</div>';
                      $("#modifyRoomBody").append('<tr><td class = "index">'+(i+1)+
                                          '</td><td class="roomNumber">'+roomNumber+
                                          '</td><td class = "nowCapability">'+capability+
                                          '</td><td class = "nowFreeTime">'+freeText+
                                          '</td><td class = "nowDevice">'+deviceText+
                                          '</td><td class = "modifyOprationDiv">'+oprationText+
                                          '</td><tr>'
                      );
                  }*/
            }
        });

        //从后台得到所有设备信息，存储起来，方便后面调用
        $.ajax({
            type: "post",
            url: "../device/getAll",
            //contentType:"application/json",
            //data:JSON.stringify(data),
            //data:data,
            success: function (result) {
                allDevices = result;

            }
        });

    });

//点击操作事件

//1、当点击操作的格时，更改当前操作会议室号，这样就不用每个操作分别都改变了
    $(document).on('click', '.modifyOprationDiv', function () {
        //得到该行的编号,更改全局变量(用于下标，因此减1）
        index = $(this).parent("tr").find(".index").text() - 1;
        //alert("当前编号："+index);
        //得到该行的会议室号,更改全局变量
        modifyRoomNumber = $(this).parent("tr").find(".roomNumber").text();
        //alert("当前修改会议室号："+modifyRoomNumber);
    });


//2、修改容纳人数事件

    //2、1修改容纳人数按钮点击事件
    //初始化弹出框，将会议室号和会议室容纳人数填进弹出框
    $(document).on('click', '.modifyCapability', function () {
        index = $(this).parents("tr").find(".index").text() - 1;
        //alert(index);
        modifyRoomNumber = $(this).parents("tr").find(".roomNumber").text();
        //alert(modifyRoomNumber);
        $("#roomNumber").val(modifyRoomNumber);
        $("#capabilityModifyInput").val(allModifyRoom[index].capability);
    });


    //2、2修改人数弹出框保存按钮点击
    $("#confirmCapabilityModify").click(function () {
        //得到会议室号

        //得到修改后的容纳人数
        var newCapability = $("#capabilityModifyInput").val();

        //封装参数
        var data = {
            roomNumber: modifyRoomNumber,
            newCapability: newCapability
        }
        //传到后台修改
        $.ajax({
            type: "post",
            url: "../room/modifyCapability",
            contentType: "application/json",
            data: JSON.stringify(data),
            //data:data,
            success: function (result) {
                //TODO返回布尔值
                alert("修改成功");
            }
        });
    });


//3、修改空闲时间事件


    //3、1修改空闲时间按钮点击事件，得到空闲时间填充弹出框
    $(document).on('click', '.modifyFreeTime', function () {
        index = $(this).parents("tr").find(".index").text() - 1;
        //alert(index);
        modifyRoomNumber = $(this).parents("tr").find(".roomNumber").text();
        //alert(modifyRoomNumber);
        //alert("点击了修改空闲时间按钮");
        var freeTime = allModifyRoom[index].freetime;
        //alert("空闲时间数量："+freeTime.length);
        //先把本来显示的删了
        $("#modifyFreeBody").find("form").remove();
        //若还没有空闲时间，则给其一个表单
        if (freeTime.length <= 0) {
            //弹出框增加日期表单
            var modifyFreeFormText = '<form class="form-horizontal modifyFreeTimeM" onsubmit="return false;">' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">开始日期：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="date" class="form-control input-sm duiqi modifyStartDate" value="2018-07-06">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">结束日期：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="date" class="form-control input-sm duiqi modifyEndDate"  value="2018-07-06">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">开始时间：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="time" class="form-control input-sm duiqi modifyStartTime"  value="08:00">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">结束时间：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="time" class="form-control input-sm duiqi modifyEndTime"  value="18:00">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<div class="col-xs-6 ">' +
                '<button class="btn btn-success btn-xs modifyAddFreeForm" >+</button>' +
                '<button class="btn btn-danger btn-xs modifyDeleteFreeForm"  >-</button>' +
                '</div>' +
                '</div>' +
                '</form>';


            //添加到修改时间弹出框
            $("#modifyFreeBody").append(modifyFreeFormText);
        }
        //从全局变量中根据下标得到该下标的会议室的空闲时间(多个空闲时间）
        for (var i = 0; i < freeTime.length; i++) {
            var startDate = freeTime[i].startDate;
            var endDate = freeTime[i].endDate;
            var startTime = freeTime[i].startTime;
            var endTime = freeTime[i].endTime;

            //TODO可能需要转换格式

            //弹出框增加日期表单
            var modifyFreeFormText = '<form class="form-horizontal modifyFreeTimeM" onsubmit="return false;">' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">开始日期：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="date" class="form-control input-sm duiqi modifyStartDate" value="' + startDate + '">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">结束日期：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="date" class="form-control input-sm duiqi modifyEndDate"  value="' + endDate + '">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">开始时间：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="time" class="form-control input-sm duiqi modifyStartTime"  value="' + startTime + '">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<label for="sName" class="col-xs-3 control-label">结束时间：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type="time" class="form-control input-sm duiqi modifyEndTime"  value="' + endTime + '">' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<div class="col-xs-6 ">' +
                '<button class="btn btn-success btn-xs modifyAddFreeForm" >+</button>' +
                '<button class="btn btn-danger btn-xs modifyDeleteFreeForm"  >-</button>' +
                '</div>' +
                '</div>' +
                '</form>';


            //添加到修改时间弹出框
            $("#modifyFreeBody").append(modifyFreeFormText);

            //alert("添加了1个");
        }

    });


    //3、2修改空闲时间弹出框 + 键点击事件
    $(document).on('click', '.modifyAddFreeForm', function () {
        //新增表单填写新的空闲时间
        //新表单的样式，字符串使用单双引号均可，主要看里面的是用什么，反着来就行，不用转义
        var modifyFormText = '<form class="form-horizontal modifyFreeTimeM"  onsubmit="return false;">' +
            '<div class="form-group "> ' +
            '<label  class="col-xs-3 control-label">开始日期：</label>' +
            '<div class="col-xs-6 ">' +
            '<input type="date" class="form-control input-sm duiqi modifyStartDate" value="2018-09-24" min="2018-09-16" />' +
            '</div>' +
            '</div>' +
            '<div class="form-group ">' +
            '<label  class="col-xs-3 control-label">结束日期：</label>' +
            '<div class="col-xs-6 ">' +
            '<input type="date" class="form-control input-sm duiqi modifyEndDate" value="2018-09-24" min="2018-09-16" />' +
            '</div>' +
            '</div>' +
            '<div class="form-group ">' +
            '<label  class="col-xs-3 control-label">开始时间：</label>' +
            '<div class="col-xs-6 ">' +
            '<input type="time" class="form-control input-sm duiqi modifyStartTime"  value="09:00"/>' +

            '</div>' +
            '</div>' +
            '<div class="form-group ">' +
            '<label  class="col-xs-3 control-label">结束时间：</label>' +
            '<div class="col-xs-6 ">' +
            '<input type="time" class="form-control input-sm duiqi modifyEndTime"  value="18:00"/>' +
            '</div>' +
            '</div>' +
            '<div class="form-group ">' +
            '<div class="col-xs-6 ">' +
            '<button class="btn btn-success btn-xs modifyAddFreeForm" >+</button>' +
            '<button class="btn btn-danger btn-xs modifyDeleteFreeForm"  >-</button>' +
            '</div>' +
            '</div> ' +
            '</form>';

        //alert("来一个新表单！");
        $("#modifyFreeBody").append(modifyFormText);
    });


    //3、3修改空闲时间弹出框 - 键点击事件
    $(document).on('click', '.modifyDeleteFreeForm', function () {
        //删除所在的父级为form的元素，由于不是直接父级，因此是parents,不是parent
        $(this).parents("form").remove();
    });


    //3、4修改空闲时间弹出框保存按钮点击事件
    $("#saveModifyFreeTime").click(function () {
        alert("保存");
        //定义空闲时间对象数组
        var freeTimeArray = new Array();


        //遍历form，得到多个空闲时间
        $(".modifyFreeTimeM").each(function () {

            //alert(".modifyStartDate:"+$(this).find(".modifyStartDate").val());
            //alert($(this).find(".modifyEndDate").val());
            //alert($(this).find(".modifyStartTime").val());
            //alert($(this).find(".modifyEndTime").val());
            var freeTime = new Object();
            freeTime.startDate = $(this).find(".modifyStartDate").val();
            freeTime.endDate = $(this).find(".modifyEndDate").val();
            freeTime.startTime = $(this).find(".modifyStartTime").val();
            freeTime.endTime = $(this).find(".modifyEndTime").val();
            freeTimeArray.push(freeTime);
        });

        //封装数据
        var data = {
            roomNumber: modifyRoomNumber,
            freeTime: freeTimeArray
        }
        //AJAX,设置（修改）会议室空闲时间
        $.ajax({
            type: "post",
            url: "../room/setFreeTime",
            contentType: "application/json",
            data: JSON.stringify(data),
            //data:data,
            success: function (result) {
                //此时的result应该是String值，用parseJSON把其转换为boolean值
                result = $.parseJSON(result);
                if (result) {
                    //修改会议室空闲时间成功后，将空闲时间展示在表格上//TODO

                    alert("修改时间成功");
                }

            }
        });
    });


//4、修改设备事件


    //4、1修改设备按钮点击事件，得到设备填充弹出框
    $(document).on('click', '.modifyDevice', function () {
        //alert("点击了修改设备按钮");
        index = $(this).parents("tr").find(".index").text() - 1;
        //alert(index);
        modifyRoomNumber = $(this).parents("tr").find(".roomNumber").text();
        //alert(modifyRoomNumber);
        //得到所有设备信息，放进全局变量，方便后面点击下拉框更新
        //在这里也把弹出面板填充上
        /*$.ajax({
                type : "post",
                url:"../device/getAll",
                //contentType:"application/json",
              //data:JSON.stringify(data),
              //data:data,
              success:function(result){
                    //TODO
                  allDevices = result ;
              }
           });*/
        //alert(allDevices.length);
        //所有设备信息转换为下拉框字符串形式
        var allDevicesOptionText = "";
        for (var i = 0; i < allDevices.length; i++) {
            allDevicesOptionText = allDevicesOptionText + '<option value="' + allDevices[i].deviceId + '">' +
                allDevices[i].name + '(' + allDevices[i].deviceId + ')' + '</option>';
        }
        //alert(allDevicesOptionText);

        //得到设备信息
        var devices = allModifyRoom[index].myDevice;
        //alert("index:" + index);
        //alert(devices.length);
        //先删除原来的表单
        $("#modifyDeviceBody").find("form").remove();
        //若没有设备信息，则给一个表单
        if (devices.length <= 0) {
            //表单字符串形式,设备先提供一个下拉框，当点击下拉框修改时，才更新下拉框的内容
            var deviceForm = '<form class="form-horizontal modifyDeviceForm" onsubmit="return false;">' +
                '<div class="form-group ">' +
                '<label for="deviceModifySelect" class="col-xs-3 control-label">设备：</label>' +
                '<div class="col-xs-6 ">' +
                '<select  class="form-control input-sm duiqi deviceModifySelect"  >' +
                allDevicesOptionText +
                /*'<option value="'+deviceId+'>'+name+'</option>'+*/
                '</select>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label for="deviceModifyCount" class="col-xs-3 control-label">数量：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type = "text" class="form-control input-sm duiqi deviceModifyCount" value="' + 1 + '"></input>' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<div class="col-xs-6 ">' +
                '<button class="btn btn-success btn-xs modifyAddDeviceForm" >+</button>' +
                '<button class="btn btn-danger btn-xs modifyDeleteDeviceForm" >-</button>' +
                '</div>' +
                '</div>' +
                '</form>';

            //添加到弹出面板中
            $("#modifyDeviceBody").append(deviceForm);
        }

        //从全局变量中根据下标得到该下标的会议室的设备(多个设备）
        for (var i = 0; i < devices.length; i++) {
            var deviceId = devices[i].deviceId;
            var name = devices[i].deviceName;
            //var type = devices[i].type;
            var count = devices[i].count;

            //表单字符串形式,设备先提供一个下拉框，当点击下拉框修改时，才更新下拉框的内容
            var deviceForm = '<form class="form-horizontal modifyDeviceForm" onsubmit="return false;">' +
                '<div class="form-group ">' +
                '<label for="deviceModifySelect" class="col-xs-3 control-label">设备：</label>' +
                '<div class="col-xs-6 ">' +
                '<select  class="form-control input-sm duiqi deviceModifySelect"  >' +
                allDevicesOptionText +
                /*'<option value="'+deviceId+'>'+name+'</option>'+*/
                '</select>' +
                '</div>' +
                '</div>' +
                '<div class="form-group">' +
                '<label for="deviceModifyCount" class="col-xs-3 control-label">数量：</label>' +
                '<div class="col-xs-6 ">' +
                '<input type = "text" class="form-control input-sm duiqi deviceModifyCount" value="' + count + '"></input>' +
                '</div>' +
                '</div>' +
                '<div class="form-group ">' +
                '<div class="col-xs-6 ">' +
                '<button class="btn btn-success btn-xs modifyAddDeviceForm" >+</button>' +
                '<button class="btn btn-danger btn-xs modifyDeleteDeviceForm" >-</button>' +
                '</div>' +
                '</div>' +
                '</form>';

            //添加到弹出面板中
            $("#modifyDeviceBody").append(deviceForm);

            //指定选择的选项为会议室的设备
            $(".modifyDeviceForm:last").find(".deviceModifySelect").val(deviceId);

        }

    });


    //4、2修改设备弹出框 + 按钮点击事件  TODO
    $(document).on('click', '.modifyAddDeviceForm', function () {
        //增加一个新的表单，下拉框填满，输入框填0

        //所有设备信息转换为下拉框字符串形式
        var allDevicesOptionText = "";
        for (var i = 0; i < allDevices.length; i++) {
            allDevicesOptionText = allDevicesOptionText + '<option value="' + allDevices[i].deviceId + '">' +
                allDevices[i].name + '</option>';
        }
        //表单字符串形式,设备先提供一个下拉框，当点击下拉框修改时，才更新下拉框的内容
        var deviceForm = '<form class="form-horizontal modifyDeviceForm" onsubmit="return false;">' +
            '<div class="form-group ">' +
            '<label for="deviceModifySelect" class="col-xs-3 control-label">设备：</label>' +
            '<div class="col-xs-6 ">' +
            '<select  class="form-control input-sm duiqi deviceModifySelect"  >' +
            allDevicesOptionText +
            /*'<option value="'+deviceId+'>'+name+'</option>'+*/
            '</select>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label for="deviceModifyCount" class="col-xs-3 control-label">数量：</label>' +
            '<div class="col-xs-6 ">' +
            '<input type = "text" class="form-control input-sm duiqi deviceModifyCount" value="0"></input>' +
            '</div>' +
            '</div>' +
            '<div class="form-group ">' +
            '<div class="col-xs-6 ">' +
            '<button class="btn btn-success btn-xs modifyAddDeviceForm" >+</button>' +
            '<button class="btn btn-danger btn-xs modifyDeleteDeviceForm" >-</button>' +
            '</div>' +
            '</div>' +
            '</form>';

        //添加到弹出面板中
        $("#modifyDeviceBody").append(deviceForm);
    });


    //4、3修改设备弹出框 - 按钮点击事件  TODO
    $(document).on('click', '.modifyDeleteDeviceForm', function () {
        //删除所在的父级为form的元素，由于不是直接父级，因此是parents,不是parent
        $(this).parents("form").remove();
    });


    //4、4修改设备弹出框保存按钮点击事件
    $("#saveModifyDevice").click(function () {

        //遍历表单，得到所有设备Id和数量
        //声明数组存储设备id和设备数量的对象
        var devicesArray = new Array();
        //遍历各个form
        $(".modifyDeviceForm").each(function () {
            //得到下拉框值和输入的数量
            //alert($(this).find(".deviceModifySelect").val());
            //alert($(this).find(".deviceModifyCount").val());
            var deviceObject = new Object();

            deviceObject.deviceId = $(this).find(".deviceModifySelect").val();
            deviceObject.count = $(this).find(".deviceModifyCount").val();
            devicesArray.push(deviceObject);
        });

        //封装上传数据
        var data = {
            roomNumber: modifyRoomNumber,
            roomDevice: devicesArray
        }

        //AJAX，设置（修改）会议室设备信息
        $.ajax({
            type: "post",
            url: "../room/modifyDevice",
            contentType: "application/json",
            data: JSON.stringify(data),
            //data:data,
            success: function (result) {
                //TODO

                //展示在表格中
                //此时的result应该是String值，用parseJSON把其转换为boolean值
                result = $.parseJSON(result);
                if (result) {
                    //设备修改后，应更改全局变量，重新渲染全部数据//TODO
                    //但这样好像又很浪费资源，应该只修改那个单元格就行
                    //alert("修改成功");

                    //调用自定义函数展示所有数据在表格上
                    //$.showAllRoom(allModifyRoom);
                }
            }
        });

    });


//5、删除会议室事件

    //5、1删除会议室按钮点击事件
    $(document).on('click', '.deleteRoom', function () {
        //alert("点击了delete");
        modifyRoomNumber = $(this).parents("tr").find(".roomNumber").text();
        //alert(modifyRoomNumber);
        //将会议室号填充到提示框
        $("#roomDeleteId").text("(" + modifyRoomNumber + ")");
        $("#deleteRoomPop").modal("toggle");
    });


    //5、2删除会议室弹出框确定按钮点击事件
    $("#confirmDeleteRoom").click(function () {

        var data = {
            roomNumber: modifyRoomNumber
        }
        //将会议室号传到后台，后台删除该会议室
        $.ajax({
            type: "post",
            url: "../room/deleteById",
            contentType: "application/json",
            data: JSON.stringify(data),
            //data:modifyRoomNumber,
            success: function (result) {
                //TODO
                //alert(result);
                //此时的result应该是String值，用parseJSON把其转换为boolean值
                result = $.parseJSON(result);
                if (result) {

                    //TODO 现在删除后点击左侧最保险
                    /*//如果删除成功，表格上删去该行，全局变量也删去该会议室
                    $("#modifyRoomBody tr:eq(0)").remove();*/
                    //删除全局变量指定下标

                    allModifyRoom.splice(index, 1);
                    //调用自定义函数展示所有数据在表格上
                    $.showAllRoom(allModifyRoom);
                }
            }
        });


    });


})