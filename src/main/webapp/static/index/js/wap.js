// JavaScript Document

var bForcepc = fGetQuery("dv") == "pc";
function fBrowserRedirect(){
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";        
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        if(bIsIpad){
                var sUrl = location.href;    
                if(!bForcepc){
                        window.location.href = "http://m.bjsxt.com/";
                }
        }
        if(bIsIphoneOs || bIsAndroid){
                var sUrl = location.href;    
                if(!bForcepc){
                        window.location.href = "http://m.bjsxt.com/";
                }
        }
        if(bIsMidp||bIsUc7||bIsUc||bIsCE||bIsWM){
                var sUrl = location.href;    
                if(!bForcepc){
                        window.location.href = "http://m.bjsxt.com/";
                }
        }
}
function fGetQuery(name){
        var sUrl = window.location.search.substr(1);
        var r = sUrl.match(new RegExp("(^|&)" + name + "=([^&]*)(&|$)"));
        return (r == null ? null : unescape(r[2]));
}
function fShowVerBlock(){        
        if(bForcepc){
                document.getElementById("dv_block").style.display = "block";
        }
        else{
                document.getElementById("ad_block").style.display = "block";
        }
}
fBrowserRedirect();

