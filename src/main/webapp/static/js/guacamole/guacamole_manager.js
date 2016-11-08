/**
 * guacamole 连接管理
 */

var GuacamoleManager = {};
GuacamoleManager.init = function (url) {
    var client = new Guacamole.Client(new Guacamole.HTTPTunnel(url));

    //连接状态监控
    client.onstatechange = function (status) {
        switch (status){
            case 0:
                console.log(status+":连接空闲");
                break;
            case 1:
                console.log(status+":开始连接");
                break;
            case 2:
                console.log(status+":正在连接");
                break;
            case 3:
                console.log(status+":连接成功");
                break;
            case 4:
                console.log(status+":正在断开");
                break;
            case 5:
                console.log(status+":断开连接");
                break;

        }
    };

    return client;
};
