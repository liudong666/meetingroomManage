<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>

<!doctype html>
<html lang="ch">

<head>
    <%@include file="common/head.jsp" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="会议室管理系统管理员页面">
    <meta name="keywords" content="会议室 管理 ">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>会议室管理系统后台首页</title>
    <script src="${basePath}resources/js/jquery.min.js"></script>
    <script src="${basePath}resources/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".meun-item").click(function () {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function () {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function () {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function () {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function () {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function () {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <!--[if lt IE 9]>
    <script src="${basePath}resources/js/html5.min.js"></script>
    <script src="${basePath}resources/js/respond.min.js"></script>
    <![endif]-->
    <%--<link href="${basePath}resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/jquery.nouislider.css">
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/ownDefine.css">
</head>

<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="会议室管理系统" src="${basePath}resources/images/logo.png"><span>会议室管理系统</span>
            </p>
        </div>
        <div id="personInfor">
            <p>欢迎您！</p>
            <p id="userName"></p>
            <p id="userId"></p>
            <p>
                <!-- 退出登录按钮 -->
                <button type="button" class="btn btn-default btn-sm" id="exitLogin">退出登录</button>
            </p>
        </div>
        <div id="accordion">
            <!-- 会议室管理折叠 -->
            <div class="meun-title" role="button" data-toggle="collapse" data-parent="#accordion"
                 href="#collapseMeeting" aria-expanded="true" aria-controls="collapseOne">
                <span id="topA" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>会议室管理</span>
            </div>
            <div id="collapseMeeting" class="collapse in" aria-expanded="true">
                <div class="meun-item meun-item-active" href="#addRoomPane" aria-controls="addRoomPane" role="tab"
                     data-toggle="tab"><img src="${basePath}resources/images/icon_source.png">新增会议室
                </div>
                <div class="meun-item" id="modifyRoomDiv" href="#modifyRoomPane" aria-controls="modifyRoomPane"
                     role="tab" data-toggle="tab"><img src="${basePath}resources/images/icon_chara_grey.png">修改会议室
                </div>
                <div class="meun-item" id="showRoomDiv" href="#showRoomPane" aria-controls="showRoomPane" role="tab"
                     data-toggle="tab"><img src="${basePath}resources/images/icon_user_grey.png">查看会议室
                </div>
            </div>
            <!-- 预约管理折叠 -->
            <div class="meun-title" role="button" data-toggle="collapse" data-parent="#accordion"
                 href="#collapseBookedFunction" aria-expanded="true" aria-controls="collapseOne">
                <span id="topB" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>预约管理</span>
            </div>
            <div id="collapseBookedFunction" class="collapse " aria-expanded="true">
                <div class="meun-item" id="userBookedRecord_1" href="#showHistoryBookedPane_1"
                     aria-controls="showHistoryBookedPane_1" role="tab" data-toggle="tab"><img
                        src="${basePath}resources/images/icon_rule_grey.png">预约记录
                </div>
                <div class="meun-item" id="userBookedRecord_2" href="#showHistoryBookedPane_2"
                     aria-controls="showHistoryBookedPane_2" role="tab" data-toggle="tab"><img
                        src="${basePath}resources/images/icon_rule_grey.png">领导参会记录
                </div>
            </div>
            <!-- 用户管理折叠 -->
            <div class="meun-title" role="button" data-toggle="collapse" data-parent="#accordion"
                 href="#collapseStaffFunction" aria-expanded="true" aria-controls="collapseOne">
                <span id="top111" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>用户管理</span>
            </div>
            <div id="collapseStaffFunction" class="collapse " aria-expanded="true">
                <div class="meun-item" id="addUsers" href="#addStaffPane" aria-controls="addStaffPane" role="tab"
                     data-toggle="tab"><img src="${basePath}resources/images/icon_source.png">添加用户
                </div>
                <div class="meun-item" id="showUsersMenu" href="#showStaffPane" aria-controls="showStaffPane" role="tab"
                     data-toggle="tab"><img src="${basePath}resources/images/icon_house_grey.png">查看用户
                </div>
                <div class="meun-item" id="modifyPassM" href="#modifyPassword" aria-controls="modifyPassword" role="tab"
                     data-toggle="tab"><img src="${basePath}resources/images/icon_rule_grey.png">修改密码
                </div>
            </div>
            <!-- 设备管理折叠 -->
            <div class="meun-title" role="button" data-toggle="collapse" data-parent="#accordion"
                 href="#collapseDeviceFunction" aria-expanded="true" aria-controls="collapseOne">
                <span id="topB" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>设备管理</span>
            </div>
            <div id="collapseDeviceFunction" class="collapse " aria-expanded="true">
                <div class="meun-item" id="addDeviceMenu" href="#addDevicePane" aria-controls="addDevicePane" role="tab"
                     data-toggle="tab"><img src="${basePath}resources/images/icon_house_grey.png">新增设备
                </div>
                <div class="meun-item" id="modifyDeviceMenu" href="#modifyDevicePane" aria-controls="modifyDevicePane"
                     role="tab" data-toggle="tab"><img src="${basePath}resources/images/icon_rule_grey.png">修改设备
                </div>
                <div class="meun-item" id="showDeviceMenu" href="#showDevicePane" aria-controls="showDevicePane"
                     role="tab" data-toggle="tab"><img src="${basePath}resources/images/icon_card_grey.png">查看设备
                </div>
            </div>
        </div>
    </div>


    <!-- 右侧具体内容栏目 -->
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">


            <!-- 新增会议室模块 -->
            <div role="tabpanel" class="tab-pane" id="addRoomPane">

                <div class="check-div">
                    <button id="addRoomBtn" class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addRoomPop">
                        添加会议室
                    </button>
                </div>
                <div class="data-div">

                    <!--自己写table -->
                    <table class="table" id="addRoomTable">
                        <caption>
                            <div align="center" class="text-success" id="teachTableTip">会议室信息</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-1">会议室号</th>
                            <th class="col-xs-1">容纳人数</th>
                            <th class="col-xs-1">会议室属性</th>
                            <th class="col-xs-3">空闲时段</th>
                            <th class="col-xs-2">设备信息</th>
                            <th class="col-xs-3">操作</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="addRoomBody">
                        </tbody>
                    </table>
                </div>

                <!--添加会议室弹出窗口-->
                <div class="modal fade" id="addRoomPop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加会议室</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="roomNumberInput" class="col-xs-3 control-label">会议室号：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="roomNumberInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="attrInput" class="col-xs-3 control-label">会议属性：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="attrInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="capabilityInput" class="col-xs-3 control-label">容纳人数：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="capabilityInput" placeholder="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelAddRoom">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="confirmAddRoom">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


                <!--设置空闲时间段弹出窗口-->
                <div class="modal fade" id="setFreeTimePop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">设置空闲时段</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid" id="freeBody">
                                    <form class="form-horizontal freeTime" id="freePane1" onsubmit="return false;">
                                        <div class="form-group ">
                                            <label for="startDateBooked_1" class="col-xs-3 control-label">开始日期：</label>
                                            <div class="col-xs-6 ">
                                                <!-- <input type="text" class="form-control input-sm duiqi startDate" id="startDate1" placeholder=""> -->
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="startDateBooked_1"/>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="endDateBooked_1" class="col-xs-3 control-label">结束日期：</label>
                                            <div class="col-xs-6 ">
                                                <!-- <input type="text" class="form-control input-sm duiqi endDate1" id="endDate1" placeholder=""> -->
                                                <!-- 日期选择组件 -->
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="endDateBooked_1"/>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="startTimeBooked_1" class="col-xs-3 control-label">开始时间：</label>
                                            <div class="col-xs-6 ">
                                                <!-- <input type="text" class="form-control input-sm duiqi startTime" id="startTime1" placeholder=""> -->
                                                <!-- 时间控件 -->
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="startTimeBooked_1"/>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="endTimeBooked_1" class="col-xs-3 control-label">结束时间：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="endTimeBooked_1"/>
                                                <!-- <input type="text" class="form-control input-sm duiqi endTime" id="endTime1" placeholder=""> -->
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <div class="col-xs-6 ">
                                                <button class="btn btn-success btn-xs addFreePane">+</button>
                                                <!-- <button class="btn btn-danger btn-xs " >-</button> -->
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelSetFreeTime">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="saveSetFreeTime">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--设置设备信息弹出窗口-->
                <div class="modal fade" id="setDevicePop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">设置设备信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid " id="deviceBody">
                                    <form class="form-horizontal setDeviceForm" onsubmit="return false;">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">设备：</label>
                                            <div class="col-xs-6 ">
                                                <select class="form-control input-sm duiqi deviceSelect"
                                                        id="deviceSelect12">
                                                    <!-- <option value = "10003">椅子(10003)</option>
                                                    <option value = "10003">椅子(10003)</option> -->

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">数量：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text"
                                                       class="form-control input-sm duiqi deviceNumInput"></input>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <div class="col-xs-6 ">
                                                <button class="btn btn-success btn-xs addDevicePane">+</button>
                                                <!-- <button class="btn btn-danger btn-xs"  >-</button> -->
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelSetDevice">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="saveSetDevice">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>

            <!-- 修改会议室模块 -->
            <div role="tabpanel" class="tab-pane" id="modifyRoomPane">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">修改会议室</button>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" class="form-control input-sm" placeholder="输入会议室号搜索">
                        <button class="btn btn-white btn-xs ">查 询</button>
                    </div>
                    <!-- <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
                        <label for="paixu">排序:&nbsp;</label>
                        <select class=" form-control">
                            <option>地区</option>
                            <option>地区</option>
                            <option>班期</option>
                            <option>性别</option>
                            <option>年龄</option>
                            <option>份数</option>
                        </select>
                    </div> -->
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="addRoomTable">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip">会议室信息</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-1">会议室号</th>
                            <th class="col-xs-1">容纳人数</th>
                            <th class="col-xs-1">会议属性</th>
                            <th class="col-xs-4">空闲时段</th>
                            <th class="col-xs-2">设备信息</th>
                            <th class="col-xs-2">操作</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="modifyRoomBody">
                        <!-- <tr>
                           <td class="index">1</td>
                           <td class="roomNumber">10001</td>
                           <td >100</td>
                           <td>
                                2018-07-21~2018-08-25 09:30~16:00<br>
                               2018-09-02~2018-10-25 09:30~16:00<br>
                           </td>
                           <td>
                               椅子*120<br>
                               电脑*1<br>
                               屏幕*1<br>
                           </td>
                           <td class = "modifyOprationDiv">
                               <div>
                                   <button class="btn btn-success btn-xs modifyCapability" data-toggle="modal" data-target="#modifyCapabilityPop">修改人数</button>
                                  <button class="btn btn-success btn-xs modifyFreeTime" data-toggle="modal" data-target="#modifyFreeTimePop">修改时间</button>
                                  <button class="btn btn-danger btn-xs modifyDevice"  data-toggle="modal" data-target="#modifyDevicePop">修改设备</button>
                                  <button class="btn btn-danger btn-xs deleteRoom"  data-toggle="modal" data-target="#mdeleteRoomPop">删除</button>
                              </div>
                           </td>
                        </tr> -->
                        </tbody>
                    </table>

                </div>

                <!--修改会议室人数弹出窗口-->
                <div class="modal fade" id="modifyCapabilityPop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改会议室</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="roomNumber" class="col-xs-3 control-label">会议室号：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi " id="roomNumber"
                                                       placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="capabilityModifyInput"
                                                   class="col-xs-3 control-label">容纳人数：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="capabilityModifyInput" placeholder="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelCapabilityModify">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="confirmCapabilityModify">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


                <!-- 修改会议室空闲时段弹出窗口 -->
                <div class="modal fade" id="modifyFreeTimePop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改空闲时段</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid" id="modifyFreeBody">
                                    <!-- <form class="form-horizontal " onsubmit="return false;">
                                       <div class="form-group ">
                                           <label for="sName" class="col-xs-3 control-label">开始日期：</label>
                                           <div class="col-xs-6 ">
                                               <input type="date" class="form-control input-sm duiqi" id="modifyStartDate1" placeholder="">
                                           </div>
                                       </div>
                                       <div class="form-group ">
                                           <label for="sName" class="col-xs-3 control-label">结束日期：</label>
                                           <div class="col-xs-6 ">
                                               <input type="date" class="form-control input-sm duiqi" id="modifyEndDate1" placeholder="">
                                           </div>
                                       </div>
                                       <div class="form-group ">
                                           <label for="sName" class="col-xs-3 control-label">开始时间：</label>
                                           <div class="col-xs-6 ">
                                               <input type="time" class="form-control input-sm duiqi" id="modifyStartTime1" placeholder="">
                                           </div>
                                           </div>
                                       <div class="form-group ">
                                           <label for="sName" class="col-xs-3 control-label">结束时间：</label>
                                           <div class="col-xs-6 ">
                                               <input type="time" class="form-control input-sm duiqi" id="modifyEndTime1" placeholder="">
                                           </div>
                                       </div>
                                       <div class="form-group ">
                                           <div class="col-xs-6 ">
                                               <button class="btn btn-success btn-xs modifyAddFreeForm" >+</button>
                                               <button class="btn btn-danger btn-xs modifyDeleteFreeForm"  >-</button>
                                           </div>
                                       </div>
                                   </form>  -->
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelModifyFreeTime">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="saveModifyFreeTime">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!-- 修改设备信息弹出窗口 -->
                <div class="modal fade" id="modifyDevicePop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改设备</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid " id="modifyDeviceBody">
                                    <form class="form-horizontal modifyDeviceForm" onsubmit="return false;">
                                        <div class="form-group ">
                                            <label for="deviceModifySelect" class="col-xs-3 control-label">设备：</label>
                                            <div class="col-xs-6 ">
                                                <select class="form-control input-sm duiqi deviceModifySelect">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="deviceModifyCount" class="col-xs-3 control-label">数量：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text"
                                                       class="form-control input-sm duiqi deviceModifyCount"></input>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <div class="col-xs-6 ">
                                                <button class="btn btn-success btn-xs modifyAddDeviceForm">+</button>
                                                <button class="btn btn-danger btn-xs modifyDeleteDeviceForm">-</button>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelModifyDevice">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="saveModifyDevice">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!-- 删除会议室提示弹出窗口 -->
                <div class="modal fade" id="deleteRoomPop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该会议室
                                    <p id="roomDeleteId"></p>
                                    ？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal"
                                        id="confirmDeleteRoom">确定
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


            </div>


            <!-- 查看会议室模块 -->
            <div role="tabpanel" class="tab-pane" id="showRoomPane">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">查看会议室</button>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" class="form-control input-sm" id="roomNumberInShow" placeholder="输入会议室号搜索">
                        <button class="btn btn-white btn-xs " id="searchInShow">查 询</button>
                    </div>
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="showRoomTable">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip">会议室信息</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-2">会议室号</th>
                            <th class="col-xs-2">容纳人数</th>
                            <th class="col-xs-5">空闲时段</th>
                            <th class="col-xs-2">设备信息</th>
                            <!-- <th class="col-xs-3">操作</th> -->
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="showRoomBody">
                        <tr>
                            <td>1</td>
                            <td>10001</td>
                            <td>100</td>
                            <td>
                                2018-07-21~2018-08-25 09:30~16:00<br>
                                2018-09-02~2018-10-25 09:30~16:00<br>
                            </td>
                            <td>
                                <p class="deviceDetailP">椅子*120</p>
                                <p class="deviceDetailP">电脑*1</p>
                                <p class="deviceDetailP">桌子*120</p>

                            </td>

                        </tr>
                        </tbody>
                    </table>

                </div>

            </div>


            <!-- 查看所有预约记录 -->
            <div role="tabpanel" class="tab-pane" id="showHistoryBookedPane_1">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">我的预约记录</button>
                    </div>
                    <div class="col-xs-4">

                    </div>
                    <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">

                    </div>
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="showMyHistoryTable_1">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip_1">我的预约记录</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-1">会议室号</th>
                            <th class="col-xs-1">会议属性</th>
                            <th class="col-xs-1">会议名</th>
                            <th class="col-xs-1">申请人</th>
                            <th class="col-xs-1">主持人</th>
                            <th class="col-xs-1">厂级领导</th>
                            <th class="col-xs-1">参会部门</th>
                            <th class="col-xs-1">联系电话</th>
                            <th class="col-xs-1">预约时间</th>
                            <th class="col-xs-1">状态</th>
                            <th class="col-xs-1">更改</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="showMyHistoryBody_1">
                        </tbody>
                    </table>
                </div>

                <%--取消弹出窗口--%>
                <div class="modal fade" id="cancelPop_1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel_1">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要取消该会议室？取消后后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal"
                                        id="confirmCancelDevice_1">确定
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>


            <!-- 查看领导预约记录 -->
            <div role="tabpanel" class="tab-pane" id="showHistoryBookedPane_2">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">领导参会记录</button>
                    </div>
                    <div class="col-xs-4">

                    </div>
                    <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">

                    </div>
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="showMyHistoryTable_2">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip_2">领导参会记录</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-1">会议室号</th>
                            <th class="col-xs-1">会议名</th>
                            <th class="col-xs-1">主持人</th>
                            <th class="col-xs-2">厂级领导</th>
                            <th class="col-xs-2">参会部门</th>
                            <th class="col-xs-3">预约时间</th>
                            <th class="col-xs-1">状态</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="showMyHistoryBody_2">
                        </tbody>
                    </table>
                </div>
                <!-- /.modal -->
            </div>

            <%-- 添加用户 --%>
            <div role="tabpanel" class="tab-pane" id="addStaffPane">

                <div class="col-xs-3">
                    <button class="btn btn-yellow btn-xs" id="addStaffBtn" data-toggle="modal"
                            data-target="#addStaffPop">
                        添加用户
                    </button>
                </div>

                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="addStaffTable">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip">员工详情</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-2">工号</th>
                            <th class="col-xs-2">姓名</th>
                            <th class="col-xs-2">部门</th>
                            <th class="col-xs-2">职位</th>
                            <th class="col-xs-3">手机</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="addStaffBody">
                        </tbody>
                    </table>
                </div>


                <%-- 添加用户弹出窗口 --%>
                <div class="modal fade" id="addStaffPop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="staffIdInput" class="col-xs-3 control-label">工号：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="staffIdInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="staffNameInput" class="col-xs-3 control-label">姓名：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="staffNameInput" placeholder="">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label for="departmentInput" class="col-xs-3 control-label">部门：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="departmentInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="positionInput" class="col-xs-3 control-label">职位：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="positionInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="phoneInput" class="col-xs-3 control-label">手机：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="phoneInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <div class="col-xs-6 ">
                                                <button class="btn btn-success btn-xs addFreePane">+</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelAddStaff">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="confirmAddStaff">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>


            </div>

            <!-- 查看所有用户 -->
            <div role="tabpanel" class="tab-pane" id="showStaffPane">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" id="showStaffBtn" data-toggle="modal"
                                data-target="#addStaffPop">
                            查看用户
                        </button>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" class="form-control input-sm" placeholder="输入员工工号搜索">
                        <button class="btn btn-white btn-xs ">查 询</button>
                    </div>
                    <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
                        <label for="sortStaff">排序:&nbsp;</label>
                        <select class=" form-control" id="sortStaff">
                            <option>工号升序</option>
                            <option>工号降序</option>
                            <option>级别</option>
                        </select>
                    </div>
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="showStaffTable">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip">员工详情</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-2">工号</th>
                            <th class="col-xs-2">姓名</th>
                            <th class="col-xs-2">部门</th>
                            <th class="col-xs-2">职位</th>
                            <th class="col-xs-3">手机</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="showStaffBody">
                        </tbody>
                    </table>
                </div>
            </div>


            <!-- 修改密码 模块-->
            <div role="tabpanel" class="tab-pane" id="modifyPassword">
                <div class="check-div">
                    <!-- 原始密码为12312313 -->
                    <!-- 用于显示用户修改密码操作结果 -->
                    <div align="center"><span id="isTwoPassSame"></span></div>
                </div>
                <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="userId" class="col-xs-4 control-label">ID：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="userIdModifyP" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">新密码：</label>
                            <div class="col-xs-5">
                                <input type="password" class="form-control input-sm duiqi" id="newPassword1"
                                       placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">确认密码：</label>
                            <div class="col-xs-5">
                                <input type="password" class="form-control input-sm duiqi" id="defineNewPassword1"
                                       placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green" id="modifyPassBtn">修改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--修改密码模块结束(上面的div) -->


            <!-- 新增设备 模块开始-->
            <div role="tabpanel" class="tab-pane" id="addDevicePane">

                <div class="check-div">
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addDevicePop">添加设备</button>
                </div>
                <div class="data-div">

                    <!--自己写table -->
                    <table class="table" id="addDeviceTable">
                        <caption>
                            <div align="center" class="text-success" id="teachTableTip">设备信息</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-4">编号</th>
                            <!-- <th class="col-xs-3">设备id</th> -->
                            <th class="col-xs-4">设备名</th>
                            <th class="col-xs-4">型号</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="addDeviceBody">
                        <!-- <tr>
                           <td>1</td>
                           <td>00001</td>
                           <td>桌子</td>
                           <td>小米</td>
                        </tr> -->
                        </tbody>
                    </table>
                </div>

                <!--添加会议室弹出窗口-->
                <div class="modal fade" id="addDevicePop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加设备</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="deviceNameInput" class="col-xs-3 control-label">设备名：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="deviceNameInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="deviceTypeInput" class="col-xs-3 control-label">型号：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="deviceTypeInput" placeholder="">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelAddDevice">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="confirmAddDevice">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>


            <!-- 修改设备模块开始 -->
            <div role="tabpanel" class="tab-pane" id="modifyDevicePane">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">修改设备</button>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" class="form-control input-sm" placeholder="输入设备名搜索">
                        <button class="btn btn-white btn-xs ">查 询</button>
                    </div>
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="modifyDeviceTable">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip">会议室信息</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-2">编号</th>
                            <th class="col-xs-2">设备ID</th>
                            <th class="col-xs-2">设备名</th>
                            <th class="col-xs-3">型号</th>
                            <th class="col-xs-3">操作</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="modifyDeviceBody1">
                        <!-- <tr>
                           <td>1</td>
                           <td>00001</td>
                           <td>桌子</td>
                           <td>格力</td>
                           <td>
                               <div>
                                   <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#modifyDevicePop">修改</button>
                                  <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#deleteDevicePop">删除</button>
                              </div>
                           </td>
                        </tr> -->
                        </tbody>
                    </table>

                </div>

                <!--修改设备信息弹出窗口-->
                <div class="modal fade" id="modifyDevicePop1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改设备信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="deviceID" class="col-xs-3 control-label">设备ID：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="deviceIDModifyInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="deviceNameModifyInput"
                                                   class="col-xs-3 control-label">设备名：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="deviceNameModifyInput" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="deviceTypeModifyInput"
                                                   class="col-xs-3 control-label">设备型号：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="deviceTypeModifyInput" placeholder="">
                                            </div>
                                        </div>
                                        <!-- <div class="form-group ">
                                            <label for="deviceCountModifyInput" class="col-xs-3 control-label">数量：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" id="deviceCountModifyInput" placeholder="">
                                            </div>
                                        </div> -->
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelDeviceModify">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="confirmDeviceModify">保 存
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


                <!-- 删除设备提示弹出窗口 -->
                <div class="modal fade" id="deleteDevicePop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该设备？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal"
                                        id="confirmDeleteDevice">确定
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>

            <!-- 查看设备模块 -->
            <div role="tabpanel" class="tab-pane" id="showDevicePane">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">查看设备</button>
                    </div>
                    <div class="col-xs-4">
                        <input type="text" class="form-control input-sm" placeholder="输入设备名搜索">
                        <button class="btn btn-white btn-xs ">查 询</button>
                    </div>
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="modifyDeviceTable">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip">会议室信息</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-3">编号</th>
                            <th class="col-xs-3">设备ID</th>
                            <th class="col-xs-3">设备名</th>
                            <th class="col-xs-3">型号</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="showDeviceBody">
                        <tr>
                            <td>1</td>
                            <td>00001</td>
                            <td>桌子</td>
                            <td>格力</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    </div>

    <!-- 定义模态框开始 -->
    <!--会议室信息详情弹出窗口，点击会议室ID即可弹出(因为这个模态框被多个元素调用，因此放在根节点才能满足多个子节点去调用-->
    <div class="modal fade " id="showRoomDetailPop" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">会议室详情</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label for="roomID" class="col-xs-3 control-label">会议室号：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="roomID" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="capabilityShow" class="col-xs-3 control-label">容纳人数：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="capabilityShow"
                                           placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="deviceOwn" class="col-xs-3 control-label">配备设备：</label>
                                <div class="col-xs-6 ">
                                    <!-- <input type="text" class="form-control input-sm duiqi" id="deviceOwn" placeholder=""> -->
                                    <textarea class="form-control input-sm duiqi" id="deviceOwn"
                                              placeholder=""></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <!--预约员工信息详情弹出窗口，点击员工即可弹出-->
    <div class="modal fade" id="showStaffDetailPop" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">员工详情</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label for="staffID" class="col-xs-3 control-label">员工ID：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="staffID" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="staffNameShow" class="col-xs-3 control-label">姓名：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="staffNameShow"
                                           placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="departmemtShow" class="col-xs-3 control-label">部门：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="departmemtShow"
                                           placeholder="">

                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="positionShow" class="col-xs-3 control-label">职位：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="positionShow"
                                           placeholder="">

                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="phoneShow" class="col-xs-3 control-label">手机：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="phoneShow"
                                           placeholder="">

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <!--设备信息详情弹出窗口，点击设备名称即可弹出-->
    <div class="modal fade" id="showDeviceDetailPop" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">设备详情</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label for="deviceID" class="col-xs-3 control-label">设备ID：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="deviceID" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="deviceNameShow" class="col-xs-3 control-label">设备名：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="deviceNameShow"
                                           placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="deviceTypeShow" class="col-xs-3 control-label">设备型号：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" class="form-control input-sm duiqi" id="deviceTypeShow"
                                           placeholder="">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">关闭</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <!-- 定义模态框结束 -->


</div>
<script src="${basePath}resources/js/laydate/laydate.js"></script>
<script>
    laydate.render({
        elem: '#startDateBooked_1' //指定元素
    });
    laydate.render({
        elem: '#endDateBooked_1' //指定元素
    });
    laydate.render({
        elem: '#startTimeBooked_1', //指定元素
        type:'time'
    });
    laydate.render({
        elem: '#endTimeBooked_1', //指定元素
        type:'time'
    });
</script>

<script src="${basePath}resources/js/jquery.nouislider.js"></script>
<script src="${basePath}resources/js/manager.addroom.js"></script>
<script src="${basePath}resources/js/manager.addUser.js"></script>
<script src="${basePath}resources/js/manager.modifyRoom.js"></script>
<script src="${basePath}resources/js/exitLogin.js"></script>
<script src="${basePath}resources/js/manager.commom.js"></script>
<script src="${basePath}resources/js/manager.showRoom.js"></script>
<script src="${basePath}resources/js/manager.showNowBooked.js"></script>
<script src="${basePath}resources/js/manager.showHistoryBooked.js"></script>
<script src="${basePath}resources/js/manager.showUser.js"></script>
<script src="${basePath}resources/js/manager.modifyPass.js"></script>
<script src="${basePath}resources/js/manager.addDevice.js"></script>
<script src="${basePath}resources/js/manager.modifyDevice.js"></script>
<script src="${basePath}resources/js/manager.showDevice.js"></script>

</body>

</html>