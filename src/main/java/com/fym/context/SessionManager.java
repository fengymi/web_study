package com.fym.context;

import com.fym.service.guacamole.GuacamoleTokenSessionService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class SessionManager {
    public static final int VISITOR = 1;                //游客
    public static final int USER = 2;                   //用户
    public static final int CONNECTION_USER = 3;        //已连接用户

    private int visitorNum;                             //游客数
    private int userNum;                                //用户数

    @Resource
    private GuacamoleTokenSessionService guacamoleTokenSessionService;

    public int getVisitorNum() {
        return visitorNum;
    }
    public int getUserNum() {
        return userNum;
    }
    public int getConnectionNum(){
        return guacamoleTokenSessionService.getNum();
    }

    public synchronized void addNum(int type) {
        switch (type){
            case VISITOR:
                this.visitorNum ++;break;
            case USER :
                this.userNum ++;break;
        }
    }
    public synchronized void delNum(int type) {
        switch (type){
            case VISITOR:
                if(this.visitorNum>=1){
                    this.visitorNum --;
                }
                break;
            case USER :
                if(this.userNum>=1){
                    this.userNum --;
                }
                break;
        }
    }
}
