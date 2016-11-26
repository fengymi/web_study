document.write('<a href="http://www.51.la/?17385502" target="_blank" title="51.La &#x7F51;&#x7AD9;&#x6D41;&#x91CF;&#x7EDF;&#x8BA1;&#x7CFB;&#x7EDF;"><img alt="51.La &#x7F51;&#x7AD9;&#x6D41;&#x91CF;&#x7EDF;&#x8BA1;&#x7CFB;&#x7EDF;" src="http://icon.51.la/icon_7.gif" style="border:none" /></a>\n');
var a5502tf = "51la";
var a5502pu = "";
var a5502pf = "51la";
var a5502su = window.location;
var a5502sf = document.referrer;
var a5502of = "";
var a5502op = "";
var a5502ops = 1;
var a5502ot = 1;
var a5502d = new Date();
var a5502color = "";
if (navigator.appName == "Netscape") {
    a5502color = screen.pixelDepth;
} else {
    a5502color = screen.colorDepth;
}
try {
    a5502tf = top.document.referrer;
} catch (e) {
}
try {
    a5502pu = window.parent.location;
} catch (e) {
}
try {
    a5502pf = window.parent.document.referrer;
} catch (e) {
}
try {
    a5502ops = document.cookie.match(new RegExp("(^| )a5502_pages=([^;]*)(;|$)"));
    a5502ops = (a5502ops == null) ? 1 : (parseInt(unescape((a5502ops)[2])) + 1);
    var a5502oe = new Date();
    a5502oe.setTime(a5502oe.getTime() + 60 * 60 * 1000);
    document.cookie = "a5502_pages=" + a5502ops + ";path=/;expires=" + a5502oe.toGMTString();
    a5502ot = document.cookie.match(new RegExp("(^| )a5502_times=([^;]*)(;|$)"));
    if (a5502ot == null) {
        a5502ot = 1;
    } else {
        a5502ot = parseInt(unescape((a5502ot)[2]));
        a5502ot = (a5502ops == 1) ? (a5502ot + 1) : (a5502ot);
    }
    a5502oe.setTime(a5502oe.getTime() + 365 * 24 * 60 * 60 * 1000);
    document.cookie = "a5502_times=" + a5502ot + ";path=/;expires=" + a5502oe.toGMTString();
} catch (e) {
}
try {
    if (document.cookie == "") {
        a5502ops = -1;
        a5502ot = -1;
    }
} catch (e) {
}
a5502of = a5502sf;
if (a5502pf !== "51la") {
    a5502of = a5502pf;
}
if (a5502tf !== "51la") {
    a5502of = a5502tf;
}
a5502op = a5502pu;
try {
    lainframe
} catch (e) {
    a5502op = a5502su;
}
a5502src = 'http://web.51.la:82/go.asp?svid=11&id=17385502&tpages=' + a5502ops + '&ttimes=' + a5502ot + '&tzone=' + (0 - a5502d.getTimezoneOffset() / 60) + '&tcolor=' + a5502color + '&sSize=' + screen.width + ',' + screen.height + '&referrer=' + escape(a5502of) + '&vpage=' + escape(a5502op) + '&vvtime=' + a5502d.getTime();
setTimeout('a5502img = new Image;a5502img.src=a5502src;', 0);