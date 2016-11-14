/**
 * js全屏
 * @type {{}}
 */
/**
 * 全屏
 * @param element
 */
function full_screen(element) {
    element = element||document.getElementById("content");
    this.element = element;
    //此方法不可以在異步任務中執行，否則火狐無法全屏
    if(element.requestFullscreen) {
        element.requestFullscreen();
    } else if(element.mozRequestFullScreen) {
        element.mozRequestFullScreen();
    } else if(element.msRequestFullscreen){
        element.msRequestFullscreen();
    } else if(element.oRequestFullscreen){
        element.oRequestFullscreen();
    } else if(element.webkitRequestFullscreen){
        element.webkitRequestFullScreen();
    }else{
        toastr["error"]("该浏览器暂不支持全屏");
    }
}
function exit_full_screen(element) {
    element = element||document.getElementById("content");
    this.element = element;
    if (document.exitFullscreen) {
        document.exitFullscreen();
    }else if (document.webkitExitFullscreen) {
        document.webkitExitFullscreen();
    }else if (document.msExitFullscreen) {
        document.msExitFullscreen();
    }else if (document.mozCancelFullScreen) {
        document.mozCancelFullScreen();
    }else{
        toastr["info"]("退出全屏");
    }
}
