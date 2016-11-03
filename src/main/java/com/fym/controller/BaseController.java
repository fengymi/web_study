package com.fym.controller;

import com.fym.entity.utils.OperEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 基本的controller，所有的controller应该从该类继承
 */
public class BaseController {

    /**
     * 获取当前请求的request
     * @return request
     */
    protected HttpServletRequest getRequest(){
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /**
     * 获取操作数据库对象
     * @return 操作数据库的对象
     */
    protected OperEntity getOper(){
        OperEntity operEntity = new OperEntity();
        HashPageData data = new HashPageData(getRequest());
        operEntity.setData(data);
        operEntity.setOper(data.getString("oper"));
        data.remove("oper");
        return operEntity;
    }

    /**
     * 获取分页信息
     * @return 分页信息
     */
    protected PageEntity getPage(){
        PageEntity page = new PageEntity();
        HttpServletRequest request = getRequest();

        page.setPageNum(Integer.parseInt(request.getParameter("pageNum")+""));
        page.setPageSize(Integer.parseInt(request.getParameter("pageSize")+""));
        page.setOrder(request.getParameter("order"));
        page.setSidx(request.getParameter("sidx"));
        return page;
    }

    /**
     * 获取session
     * @return session
     */
    protected HttpSession getSession(){
        return getRequest().getSession();
    }

    /**
     * 获取根目录
     * @return 根目录
     */
    protected String getBasePath(){
        HttpServletRequest request = getRequest();
        return request.getScheme()+"://"+ request.getServerName()+":"+ request.getServerPort()+request.getContextPath();
    }
}
