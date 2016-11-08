<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
</head>
<body>


<!-- Guacamole -->
<script type="text/javascript"
        src="static/js/guacamole/guacamole_all.js"></script>
<script type="text/javascript"
        src="static/js/guacamole/guacamole_manager.js"></script>

<button onclick="disConnection()">断开连接</button>
<!-- Display -->
<div id="display"></div>


<!-- Init -->
<script type="text/javascript"> /* <![CDATA[ */

// Get display div from document
var display = document.getElementById("display");

// Instantiate client, using an HTTP tunnel for communications.
var guac = GuacamoleManager.init("tunnel");

display.appendChild(guac.getDisplay().getElement());

guac.onerror = function (error) {
    alert(error);
};
var data = {
    "11":"aa",
    "22":"bb",
    "33":"cc"
};

try{

// Connect
guac.connect("11=22&bb=11");
}catch (error){
    console.log("11:connection error");
    console.log("12:"+error);
}
function disConnection() {
    guac.disconnect();
}

// Disconnect on close
window.onunload = function () {
    disConnection();
};

/* ]]> */ </script>

<script type="text/javascript"> /* <![CDATA[ */


// Mouse
var mouse = new Guacamole.Mouse(guac.getDisplay().getElement());

mouse.onmousedown =
        mouse.onmouseup =
                mouse.onmousemove = function (mouseState) {
                    guac.sendMouseState(mouseState);
                };

// Keyboard
var keyboard = new Guacamole.Keyboard(document);

keyboard.onkeydown = function (keysym) {
    guac.sendKeyEvent(1, keysym);
};

keyboard.onkeyup = function (keysym) {
    guac.sendKeyEvent(0, keysym);
};

/* ]]> */ </script>
</body>
</html>
