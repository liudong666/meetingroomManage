//管理员添加用户界面js

//自定义函数

$(document).ready(function () {

    //定义全局变量，添加所有员工信息
    var allStaff;

    //左上角添加员工按钮点击事件
    $("#addStaffBtn").click(function () {

    });

    //新增员工弹出框确认按钮点击事件
    $("#confirmAddStaff").click(function () {
        //得到员工工号
        var staffNumber = $("#staffIdInput").val();
        //得到员工姓名
        var name = $("#staffNameInput").val();
        //得到部门
        var department = $("#departmentInput").val();
        //得到员工职位
        var position = $("#positionInput").val();
        //得到员工手机号码
        var phone = $("#phoneInput").val();

        //进行参数封装
        var data = {
            staffNumber: staffNumber,
            name: name,
            department: department,
            position: position,
            phone: phone
        }
        //AJAX
        $.ajax({
            type: "post",
            url: "../staff/add",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (result) {
                //此时的result应该是String值，用parseJSON把其转换为boolean值
                result = $.parseJSON(result);
                if (result) {
                    alert("保存成功！");
                    //添加用户成功
                    //将新增的用户信息展示在表格上
                    var addStaffRow = '<tr>'+
                        '<td>1</td>' +
                        '<td>' + staffId + '</td>' +
                        '<td>' + staffName + '</td>' +
                        '<td>' + department + '</td>' +
                        '<td>' + position + '</td>' +
                        '<td>' + phone + '</td>' +
                        '</tr>';
                    //将新用户添加到原有用户之后
                    $("#addRoomBody").find("tr").remove();
                    $("#showStaffBody").append(addStaffRow);
                } else {
                    alert("添加失败!!!");
                    //alert(capabilityInput2);
                }
            }
        })
    })
})