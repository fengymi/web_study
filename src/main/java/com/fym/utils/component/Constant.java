package com.fym.utils.component;

/**
 * 静态常量
 */
public interface Constant {
    int SUCCESS_CODE = 1;
    int PASSWORD_NULL = -1;
    int NO_USER = 0;

    int MACHINE_USER_USED = 0; //使用中
    int MACHINE_USER_USE = 1; //可以使用

    String SESSION_USER = "sessionUser";
    String SESSION_USER_PERMISSION = "permission";

    //文件系统信息
    String FILE_PROTOCOL = "http";
    String FILE_HOST_NAME = "fileHost";
    String FILE_HOST = "www.fengymi.cn";
    int FILE_PORT = 8888;

    //默认分页信息
    int PAGE_SIZE = 10;
    int PAGE_NUM = 1;
}
