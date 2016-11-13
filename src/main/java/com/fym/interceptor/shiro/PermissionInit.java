package com.fym.interceptor.shiro;

import com.fym.service.system.SystemPermissionService;
import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Map;

public abstract class PermissionInit{
    private final static Logger log = LoggerFactory.getLogger(PermissionInit.class);

    private String definitions = "";
    @Resource
    private SystemPermissionService systemPermissionService;

    @Resource
    private ShiroFilterFactoryBean shiroFilterFactoryBean;

    @PostConstruct
    public void intiPermission() {
        shiroFilterFactoryBean.setFilterChainDefinitionMap(obtainPermission());
        log.debug("initialize shiro permission success...");
    }

    /** 读取配置资源 */
    private Ini.Section obtainPermission() {
        Ini ini = new Ini();

        // log.info("资源文件："+definitions);
        ini.load(definitions); // 加载资源文件节点串
        Ini.Section section = ini.getSection("urls"); // 使用默认节点
        if (CollectionUtils.isEmpty(section)) {
            section = ini.getSection(Ini.DEFAULT_SECTION_NAME); // 如不存在默认节点切割,则使用空字符转换
        }
        Map<String, String> permissionMap = initOtherPermission();
        if (permissionMap != null && !permissionMap.isEmpty()) {
            section.putAll(permissionMap);
        }
        return section;
    }

    public abstract Map<String, String> initOtherPermission();

    public String getDefinitions() {
        return definitions;
    }

    public void setDefinitions(String definitions) {
        this.definitions = definitions;
    }
}
