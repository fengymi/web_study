package com.fym.service.test;

import com.fym.dao.test.TestMapper;
import com.fym.utils.data.HashPageData;
import com.fym.utils.data.TreePageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 测试service
 */
@Service
public class TestService {
    @Resource
    private TestMapper testMapper;

    public void test(){
        System.out.println("service test");
        List<HashPageData> list = testMapper.findAll();
        List<TreePageData> list2 = testMapper.findAllTree();
        System.out.println("hash:");
        for (HashPageData o : list) {
            System.out.println(o);
        }
        System.out.println("tree:");
        for (TreePageData o : list2) {
            System.out.println(o);
        }
        System.out.println("hash"+list);
        System.out.println("tree"+list2);
    }
}
