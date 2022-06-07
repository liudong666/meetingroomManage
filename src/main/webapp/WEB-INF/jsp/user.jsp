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
    <meta name="description" content="会议室预约系统用户页面">
    <meta name="keywords" content="会议室 管理 ">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>会议室预约系统用户首页</title>
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
            });

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
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/jquery.nouislider.min.css">
    <link rel="stylesheet" type="text/css" href="${basePath}resources/css/ownDefine.css">

</head>

<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="会议室预约系统" src="${basePath}resources/images/logo.png"><span>会议室预约系统</span>
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

            <!-- 预约管理折叠 -->
            <div class="meun-title" onClick="changeA()" role="button" data-toggle="collapse" data-parent="#accordion"
                 href="#collapseBookedFunction" aria-expanded="true" aria-controls="collapseOne">
                <span id="topB" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>预约功能</span>
            </div>
            <div id="collapseBookedFunction" class="collapse in" aria-expanded="true">
                <div class="meun-item" id="userBookedRoom" href="#showNowBookedPane" aria-controls="showNowBookedPane"
                     role="tab" data-toggle="tab"><img src="${basePath}resources/images/icon_house_grey.png">预约会议室
                </div>
                <div class="meun-item" id="userBookedRecord_1" href="#showHistoryBookedPane_1"
                     aria-controls="showHistoryBookedPane_1" role="tab" data-toggle="tab"><img
                        src="${basePath}resources/images/icon_chara_grey.png">个人预约记录
                </div>
                <div class="meun-item" id="userBookedRecord" href="#showHistoryBookedPane"
                     aria-controls="showHistoryBookedPane" role="tab" data-toggle="tab"><img
                        src="${basePath}resources/images/icon_source_grey.png">全部预约记录
                </div>
            </div>
            <!-- 用户管理折叠 -->
            <div class="meun-title" onClick="changeA()" role="button" data-toggle="collapse" data-parent="#accordion"
                 href="#collapseStaffFunction" aria-expanded="true" aria-controls="collapseOne">
                <span id="top111" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>个人信息</span>
            </div>
            <div id="collapseStaffFunction" class="collapse " aria-expanded="true">
                <div class="meun-item" id="modifyMyInfoMenu1" href="#modifyInformation"
                     aria-controls="modifyInformation" role="tab" data-toggle="tab"><img
                        src="${basePath}resources/images/icon_house_grey.png">修改个人信息
                </div>
                <div class="meun-item" id="modifyMyPassMenu" href="#modifyPassword" aria-controls="modifyPassword"
                     role="tab" data-toggle="tab"><img src="${basePath}resources/images/icon_rule_grey.png">修改密码
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

            <!-- 预约会议室模块 -->
            <div role="tabpanel" class="tab-pane" id="showNowBookedPane">
                <div class="check-div form-inline">
                    <div class="col-xs-2">
                        <button class="btn btn-yellow btn-xs">预约会议室</button>
                    </div>
                    <div class="col-xs-7">

                    </div>
                    <div class="col-lg-3  col-xs-3" style=" padding-right: 40px;text-align: right;">

                    </div>
                </div>
                <div class="data-div">
                    <!--自己写table -->
                    <table class="table" id="bookedTable">
                        <caption>
                            <div align="center" class="text-success" id="bookedTableTip">可预约信息</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-1">编号</th>
                            <th class="col-xs-1">会议室号</th>
                            <th class="col-xs-1">容纳人数</th>
                            <th class="col-xs-2">会议室属性</th>
                            <th class="col-xs-2">设备信息</th>
                            <th class="col-xs-3">可预约时段</th>
                            <th class="col-xs-2">操作</th>

                        </tr>
                        </thead>
                        <tbody class="tablebody" id="BookedBody">
                        </tbody>
                    </table>
                </div>

                <!--预约弹出窗口  bootstrap-datetimepicker-->
                <div class="modal fade " id="bookedPop" role="dialog" tabindex="-1" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">预约</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal">
                                        <div class="form-group ">
                                            <label for="roomNumberBooked" class="col-xs-3 control-label">会议室号：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="roomNumberBooked">
                                            </div>
                                        </div>
                                        <%--会议名称--%>
                                        <div class="form-group ">
                                            <label for="roomTitle" class="col-xs-3 control-label">会议名称：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="roomTitle">
                                            </div>
                                        </div>
                                        <%--主持人--%>
                                        <div class="form-group ">
                                            <label for="roomCompere" class="col-xs-3 control-label">主持人：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="roomCompere">
                                            </div>
                                        </div>
                                        <%--参会部门--%>
                                        <div class="form-group ">
                                            <label for="roomDepartment" class="col-xs-3 control-label">参会部门：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="roomDepartment">
                                            </div>
                                        </div>
                                        <%--参会领导--%>
                                        <div class="form-group ">
                                            <label for="roomLeader" class="col-xs-3 control-label">厂级领导：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="roomLeader">
                                            </div>
                                        </div>
                                        <%--申请人--%>
                                        <div class="form-group ">
                                            <label for="roomproposer" class="col-xs-3 control-label">申请人：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="roomproposer">
                                            </div>
                                        </div>
                                        <%--申请人电话--%>
                                        <div class="form-group ">
                                            <label for="peoplePhone" class="col-xs-3 control-label">联系方式：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       id="peoplePhone">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="startDateBooked" class="col-xs-3 control-label">开始日期：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi "
                                                       id="startDateBooked">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="endDateBooked" class="col-xs-3 control-label">结束日期：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi "
                                                       id="endDateBooked">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="startTimeBooked" class="col-xs-3 control-label">开始时间：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi "
                                                       id="startTimeBooked" >
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="endTimeBooked" class="col-xs-3 control-label">结束时间：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi "
                                                       id="endTimeBooked" >
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal"
                                        id="cancelBooked">取 消
                                </button>
                                <button type="button" class="btn btn-xs btn-green" data-dismiss="modal"
                                        id="confirmBooked">确定
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->



            </div>

            <!-- 查看全部预约记录模块 -->
            <div role="tabpanel" class="tab-pane" id="showHistoryBookedPane">
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
                    <table class="table" id="showMyHistoryTable">
                        <caption>
                            <div align="center" class="text-success" id="modifyMeetingTableTip">全部预约记录</div>
                        </caption>
                        <thead class="row tableHeader">
                        <tr>
                            <th class="col-xs-0">编号</th>
                            <th class="col-xs-1">会议室号</th>
                            <th class="col-xs-1">会议属性</th>
                            <th class="col-xs-1">会议名</th>
                            <th class="col-xs-1">申请人</th>
                            <th class="col-xs-1">联系电话</th>
                            <th class="col-xs-1">主持人</th>
                            <th class="col-xs-1">厂级领导</th>
                            <th class="col-xs-2">参会部门</th>
                            <th class="col-xs-2">预约时间</th>
                            <th class="col-xs-1">状态</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="showMyHistoryBody">
                        </tbody>

                    </table>
                </div>

                <%--取消弹出窗口 <th class="col-xs-1">更改</th>--%>
<%--                <div class="modal fade" id="cancelPop" role="dialog" aria-labelledby="gridSystemModalLabel">--%>
<%--                    <div class="modal-dialog" role="document">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--%>
<%--                                        aria-hidden="true">&times;</span></button>--%>
<%--                                <h4 class="modal-title">提示</h4>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body">--%>
<%--                                <div class="container-fluid">--%>
<%--                                    确定要取消该会议室？取消后后不可恢复！--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>--%>
<%--                                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal"--%>
<%--                                        id="confirmCancelDevice">确定--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- /.modal-content -->--%>
<%--                    </div>--%>
<%--                    <!-- /.modal-dialog -->--%>
<%--                </div>--%>

                <%--修改弹出窗口--%>
<%--                <div class="modal fade" id="modifyAll" role="dialog" aria-labelledby="gridSystemModalLabel">--%>
<%--                    <div class="modal-dialog" role="document">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--%>
<%--                                        aria-hidden="true">&times;</span></button>--%>
<%--                                <h4 class="modal-title">修改信息</h4>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body">--%>
<%--                                <div class="modal-body">--%>
<%--                                    <div class="container-fluid">--%>
<%--                                        <form class="form-horizontal">--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="roomTitle_1"--%>
<%--                                                       class="col-xs-3 control-label">会议名：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi"--%>
<%--                                                           id="roomTitle_1" placeholder="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="creator_1"--%>
<%--                                                       class="col-xs-3 control-label">申请人：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi"--%>
<%--                                                           id="creator_1" placeholder="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="compere_1"--%>
<%--                                                       class="col-xs-3 control-label">主持人：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi"--%>
<%--                                                           id="compere_1" placeholder="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="leaderJoin_1"--%>
<%--                                                       class="col-xs-3 control-label">厂级领导：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi"--%>
<%--                                                           id="leaderJoin_1" placeholder="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="depJoin_1"--%>
<%--                                                       class="col-xs-3 control-label">参会部门：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi"--%>
<%--                                                           id="depJoin_1" placeholder="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="creatorPhone_1"--%>
<%--                                                       class="col-xs-3 control-label">联系方式：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi"--%>
<%--                                                           id="creatorPhone_1" placeholder="">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="startDateBooked_1" class="col-xs-3 control-label">开始日期：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi "--%>
<%--                                                           id="startDateBooked_1">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="endDateBooked_1" class="col-xs-3 control-label">结束日期：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi "--%>
<%--                                                           id="endDateBooked_1">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="startTimeBooked_1" class="col-xs-3 control-label">开始时间：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi "--%>
<%--                                                           id="startTimeBooked_1" >--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="form-group ">--%>
<%--                                                <label for="endTimeBooked_1" class="col-xs-3 control-label">结束时间：</label>--%>
<%--                                                <div class="col-xs-6 ">--%>
<%--                                                    <input type="text" class="form-control input-sm duiqi "--%>
<%--                                                           id="endTimeBooked_1" >--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消修改</button>--%>
<%--                                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal"--%>
<%--                                        id="confirmCancelDevice_1">确定修改--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- /.modal-content -->--%>
<%--                    </div>--%>
<%--                    <!-- /.modal-dialog -->--%>
<%--                </div>--%>
                <!-- /.modal -->
            </div>

            <!-- 查看个人预约记录 -->
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
                            <th class="col-xs-0">编号</th>
                            <th class="col-xs-0">会议室号</th>
                            <th class="col-xs-1">会议属性</th>
                            <th class="col-xs-1">会议名</th>
                            <th class="col-xs-1">申请人</th>
                            <th class="col-xs-1">联系电话</th>
                            <th class="col-xs-1">主持人</th>
                            <th class="col-xs-1">厂级领导</th>
                            <th class="col-xs-2">参会部门</th>
                            <th class="col-xs-2">预约时间</th>
                            <th class="col-xs-1">状态</th>
                            <th class="col-xs-1">更改</th>
                        </tr>
                        </thead>
                        <tbody class="tablebody" id="showMyHistoryBody_1">
                        </tbody>

                    </table>
                </div>

                <%--取消弹出窗口--%>
                <div class="modal fade" id="cancelPop" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要取消该会议室？取消后后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal"
                                        id="confirmCancelDevice">确定
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>

                <%--修改弹出窗口--%>
                <div class="modal fade" id="modifyAll" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改信息</h4>
                            </div>
                            <div class="modal-body">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <form class="form-horizontal">
                                            <div class="form-group ">
                                                <label for="roomTitle_2"
                                                       class="col-xs-3 control-label">会议名：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi"
                                                           id="roomTitle_2" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="creator_2"
                                                       class="col-xs-3 control-label">申请人：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi"
                                                           id="creator_2" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="compere_2"
                                                       class="col-xs-3 control-label">主持人：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi"
                                                           id="compere_2" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="leaderJoin_2"
                                                       class="col-xs-3 control-label">厂级领导：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi"
                                                           id="leaderJoin_2" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="depJoin_2"
                                                       class="col-xs-3 control-label">参会部门：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi"
                                                           id="depJoin_2" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="creatorPhone_2"
                                                       class="col-xs-3 control-label">联系方式：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi"
                                                           id="creatorPhone_2" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="startDateBooked_2" class="col-xs-3 control-label">开始日期：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi "
                                                           id="startDateBooked_2">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="endDateBooked_2" class="col-xs-3 control-label">结束日期：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi "
                                                           id="endDateBooked_2">
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="startTimeBooked_2" class="col-xs-3 control-label">开始时间：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi "
                                                           id="startTimeBooked_2" >
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="endTimeBooked_2" class="col-xs-3 control-label">结束时间：</label>
                                                <div class="col-xs-6 ">
                                                    <input type="text" class="form-control input-sm duiqi "
                                                           id="endTimeBooked_2" >
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取消修改</button>
                                <button type="button" class="btn  btn-xs btn-danger" data-dismiss="modal"
                                        id="confirmCancelDevice_1">确定修改
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>

            <!-- 修改个人信息模块 -->
            <div role="tabpanel" class="tab-pane" id="modifyInformation">
                <div class="check-div from-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">修改个人信息</button>
                    </div>
                </div>
                <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="myId" class="col-xs-4 control-label">工号：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="myId" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myName" class="col-xs-4 control-label">姓名：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="myName" placeholder="222"
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myDepartment" class="col-xs-4 control-label">部门：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="myDepartment" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myPosition" class="col-xs-4 control-label">职位：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="myPosition" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myPhone" class="col-xs-4 control-label">手机：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="myPhone" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myPhone" class="col-xs-4 control-label">邮箱：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="myEmail" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myBirthday" class="col-xs-4 control-label">生日：</label>
                            <div class="col-xs-5">
                                <input type="date" class="form-control input-sm duiqi" id="myBirthday"
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="myAddress" class="col-xs-4 control-label">住址：</label>
                            <!-- <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="myAddress" placeholder="" style="margin-top: 7px;">
                            </div> -->
                            <div class="col-xs-5">
                                <textarea class="form-control input-sm duiqi" id="myAddress" style="margin-top: 7px;"
                                          rows="3" cols="20">输入住址..</textarea>
                            </div>

                        </div>


                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green" id="modifyInformationBtn">修改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--修改个人信息模块结束(上面的div) -->


            <!-- 修改密码 模块-->
            <div role="tabpanel" class="tab-pane" id="modifyPassword">
                <div class="check-div">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs">修改密码</button>
                    </div>
                    <!-- 原始密码为12312313 -->
                    <!-- 用于显示用户修改密码操作结果 -->
                    <div align="center"><span id="isTwoPassSame"></span></div>
                </div>
                <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="userIdModifyP" class="col-xs-4 control-label">ID：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="userIdModifyP" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="oldPassword" class="col-xs-4 control-label">原密码：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="oldPassword" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="newPassword" class="col-xs-4 control-label">新密码：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="newPassword" placeholder=""
                                       style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="defineNewPassword" class="col-xs-4 control-label">确认密码：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" id="defineNewPassword"
                                       placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green" id="modifyPasswordBtn">修改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--修改密码模块结束(上面的div) -->


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
                    <h4 class="modal-title">会议室详情</h4>
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
                    <h4 class="modal-title">员工详情</h4>
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
                    <h4 class="modal-title">设备详情</h4>
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


    <!-- 定义模态框结束type="range" -->


</div>
<script src="${basePath}resources/js/laydate/laydate.js"></script>
<script>
    laydate.render({
        elem: '#startDateBooked' //指定元素
    });
    laydate.render({
        elem: '#endDateBooked' //指定元素
    });
    laydate.render({
        elem: '#startTimeBooked', //指定元素
        type:'time'
    });
    laydate.render({
        elem: '#endTimeBooked', //指定元素
        type:'time'
    });
    laydate.render({
        elem: '#startDateBooked_2', //指定元素
    });
    laydate.render({
        elem: '#endDateBooked_2', //指定元素
    });
    laydate.render({
        elem: '#startTimeBooked_2', //指定元素
        type:'time'
    });
    laydate.render({
        elem: '#endTimeBooked_2', //指定元素
        type:'time'
    });
</script>
<script src="${basePath}resources/js/jquery.nouislider.min.js"></script>
<script src="${basePath}resources/js/exitLogin.js"></script>
<script src="${basePath}resources/js/user.commom.js"></script>
<script src="${basePath}resources/js/user.modifyInfo.js"></script>
<script src="${basePath}resources/js/user.modifyMyPassword.js"></script>
<script src="${basePath}resources/js/user.myBookedRecord.js"></script>
<script src="${basePath}resources/js/user.allBookedRecord.js"></script>
<script src="${basePath}resources/js/user.booked.js"></script>
</body>
</html>