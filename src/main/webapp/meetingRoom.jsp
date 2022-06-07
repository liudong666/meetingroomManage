<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- 引入jstl -->
<%@include file="WEB-INF/jsp/common/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="WEB-INF/jsp/common/head.jsp" %>
    <meta charset='utf-8'/>
    <script src="resources/js/jquery.min.js"></script>
    <link href='core/main.css' rel='stylesheet'/>
    <link href='daygrid/main.css' rel='stylesheet'/>
    <link href='timegrid/main.css' rel='stylesheet'/>
    <link href='list/main.css' rel='stylesheet'/>
    <script src='core/main.js'></script>
    <script src='interaction/main.js'></script>
    <script src='daygrid/main.js'></script>
    <script src='timegrid/main.js'></script>
    <script src='list/main.js'></script>
    <script>
        var Request = new Object();
        Request = GetRequest();
        var roomId = Request["roomId"];
        //alert(roomId);
        document.addEventListener('DOMContentLoaded', function () {
            $("#roomNumber1").html(roomId);
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                buttonText: {
                    today: '今天',
                    month: '月显示',
                    week: '周显示',
                    day: '日显示'
                },
                locale: 'zh-cn', //汉化
                allDayText: "全天",
                timeFormat: {
                    '': 'H:mm{-H:mm}'
                },
                weekMode: "variable",
                columnFormat: {
                    month: 'dddd',
                    week: 'dddd M-d',
                    day: 'dddd M-d'
                },
                navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                editable: false,
                //每个版本所需要的参数是不一样的，所以错误
                events: function (info, successCallback, failureCallback) {
                    $.ajax({
                        type: 'post',
                        url: 'room/getMeetingRoom',
                        data: {
                            roomId :roomId,
                        },
                        dataType: 'json',
                        success: function (json) {
                            var events = [];

                            if (json) {
                                for (var i = 0; i < json.length; i++) {
                                    if (json[i].status == 1){ //预约成功
                                        events.push({
                                            title: json[i].creator + ":" + json[i].creatorPhone + " 会议室名：" + json[i].roomTitle,
                                            start: json[i].startDateStr,
                                            end: json[i].endDateStr,
                                            color: "#257e4a"
                                        });
                                    }else if (json[i].status == 3){ //进行中
                                        events.push({
                                            title: json[i].creator + ":" + json[i].creatorPhone + " 会议室名：" + json[i].roomTitle,
                                            start: json[i].startDateStr,
                                            end: json[i].endDateStr,
                                            color: "#BE81F7"
                                        });
                                    }else if (json[i].status == 0){ //取消
                                        events.push({
                                            title: json[i].creator + ":" + json[i].creatorPhone + " 会议室名：" + json[i].roomTitle,
                                            start: json[i].startDateStr,
                                            end: json[i].endDateStr,
                                            color: "#B40431"
                                        });
                                    } else {
                                        events.push({ //已过期
                                            title: json[i].creator + ":" + json[i].creatorPhone + " 会议室名：" + json[i].roomTitle,
                                            start: json[i].startDateStr,
                                            end: json[i].endDateStr,
                                            color: "#999999"
                                        });
                                    }
                                }
                            }
                            successCallback(events);
                        }
                    });
                }
            });
            calendar.render();
        });
        //获取网址上的值
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }

    </script>
    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>




</head>
<body>
<div style="margin-left: auto">
    <h4 style="color: #2d2d2d">会议室<span id="roomNumber1" style="color: #ad1b22"></span>  图形界面详情</h4>
</div>


<div id='calendar' style=""></div>

<div style="margin-right: auto">
    <p><span style="background-color: #257e4a">绿色</span>表示会议室被预约成功</p>
    <p><span style="background-color: #999999">灰色</span>表示会议室过期</p>
    <p><span style="background-color: #B40431">红色</span>表示会议室取消（取消的会议室可重新预约）</p>
    <p><span style="background-color: #BE81F7">紫色</span>表示会议室正在进行</p>
</div>

</body>
</html>
