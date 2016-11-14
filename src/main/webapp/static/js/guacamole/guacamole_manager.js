/**
 * guacamole 连接管理
 */

var GuacamoleManager = {
    client:null
};
GuacamoleManager.init = function (url) {
    var client = new Guacamole.Client(new Guacamole.HTTPTunnel(url));
    GuacamoleManager.client = client;
    var connect_toast = $("#connect_toast");
    var connect_text = $("#connection_text");
    //连接状态监控
    client.onstatechange = function (status) {
        connect_toast.fadeOut(200);
        switch (status){
            case 0:
                console.log(status+":连接空闲");
                break;
            case 1:
                console.log(status+":开始连接");
                break;
            case 2:
                connect_toast.fadeIn(200);
                connect_text.html("正在连接...");
                console.log(status+":正在连接");
                break;
            case 3:
                toastr["info"]("连接成功");
                console.log(status+":连接成功");
                break;
            case 4:
                connect_toast.fadeIn(200);
                connect_text.html("正在断开...");
                console.log(status+":正在断开");
                break;
            case 5:
                toastr["warning"]("连接已断开");
                console.log(status+":断开连接");
                break;

        }
        //绑定鼠标事件
        GuacamoleManager.bindMouse();
    };

    return client;
};

GuacamoleManager.bindMouse = function () {
    var mouse = new Guacamole.Mouse(GuacamoleManager.client.getDisplay().getElement());
    mouse.onmousedown =
        mouse.onmouseup =
            mouse.onmousemove = function (mouseState) {
                guac.sendMouseState(mouseState);
            };
};
GuacamoleManager.bindKey = function (docu) {
    var keyboard = new Guacamole.Keyboard(docu);
    keyboard.onkeydown = function (keysym) {
        guac.sendKeyEvent(1, keysym);
    };
    keyboard.onkeyup = function (keysym) {
        guac.sendKeyEvent(0, keysym);
    };
};
