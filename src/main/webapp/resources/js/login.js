function keyLogin(){
    var event =  window.event || arguments.callee.caller.arguments[0];
    if (event.keyCode==13)  //回车键的键值为13
        document.getElementById("login1").click(function (){
            //alert("点击了登录");
            var id = $("#userId").val();
            var password = $("#password").val();
            /*var position = $("input[name='position']:checked").val();*/
            console.log("id:" + id);
            console.log("password:" + password);
            /*console.log("position:" + position);*/
            var data = {
                staffNumber: id,
                password: password
            }

            $.ajax({
                type: "post",
                url: "validate",
                //contentType:"application/json",
                //contentType:"application/x-www-form-urlencoded",
                //data:JSON.stringify(data),
                data: data,
                success: function (result) {


                    //alert("result3:" + result);
                    //此时的result应该是String值，用parseJSON把其转换为boolean值
                    result = $.parseJSON(result);

                    if (result) {
                        //alert("true");
                        //能登录，转到相应页面,调用自定义函数,后台判断cookie属于哪种身份，就转到那个页面
                        $.navigate();
                    } else if (!result) {
                        //密码或账号错误，出现提示
                        //alert("false");
                        $("#loginTip").hide().html('<label class = "text-danger">账号或密码错误</label>').show(300);
                        //alert("false");
                    } else {
                        //alert("error");
                        $("#loginTip").hide().html('<label class = "text-danger">未知错误</label>').show(300);
                    }
                }
            });
        }); //调用登录按钮的登录事件
}

(function ($) {
    //函数定义
    $.navigate = function () {
        //函数内容
        //alert("position:" + position);
        //现在不靠传身份确定跳转到哪了，后台判断cookie
        var url = "./navigate";
        //var url = "./navigate?position="+position+"&id="+id ;
        //把请求转发
        window.location.href = url;
    }
})(jQuery);

$(document).ready(function () {

    //隐藏loginTip
    $("#loginTip").hide();
    //点击enter登录
    keyLogin();

    $("#login1").click(function () {
        //alert("点击了登录");
        var id = $("#userId").val();
        var password = $("#password").val();
        /*var position = $("input[name='position']:checked").val();*/
        console.log("id:" + id);
        console.log("password:" + password);
        /*console.log("position:" + position);*/
        var data = {
            staffNumber: id,
            password: password
        }

        $.ajax({
            type: "post",
            url: "validate",
            //contentType:"application/json",
            //contentType:"application/x-www-form-urlencoded",
            //data:JSON.stringify(data),
            data: data,
            success: function (result) {


                //alert("result3:" + result);
                //此时的result应该是String值，用parseJSON把其转换为boolean值
                result = $.parseJSON(result);

                if (result) {
                    //alert("true");
                    //能登录，转到相应页面,调用自定义函数,后台判断cookie属于哪种身份，就转到那个页面
                    $.navigate();
                } else if (!result) {
                    //密码或账号错误，出现提示
                    //alert("false");
                    $("#loginTip").hide().html('<label class = "text-danger">账号或密码错误</label>').show(300);
                    //alert("false");
                } else {
                    //alert("error");
                    $("#loginTip").hide().html('<label class = "text-danger">未知错误</label>').show(300);
                }
            }
        });
    });
});