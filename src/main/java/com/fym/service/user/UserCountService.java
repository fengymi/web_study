package com.fym.service.user;

import com.fym.context.SessionManager;
import com.fym.dao.system.CountNumDao;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class UserCountService {
    @Resource
    private SessionManager sessionManager;
    @Resource
    private CountNumDao countNumDao;

    public List<HashPageData> getAll(){

        SimpleDateFormat simple = new SimpleDateFormat("MM月dd日HH点");
        List<HashPageData> history = countNumDao.getAllItems();
        history.parallelStream().forEach((data)->{
            Timestamp time = (Timestamp) data.get("create_time");
            data.put("create_time",simple.format(time));
        });
        return history;
    }

    public void setCount(){
        HashPageData data = new HashPageData();
        data.put("visitor_num",sessionManager.getVisitorNum());
        data.put("user_num",sessionManager.getUserNum());
        data.put("connection_num",sessionManager.getConnectionNum());
        countNumDao.addItem(data);
    }
}
