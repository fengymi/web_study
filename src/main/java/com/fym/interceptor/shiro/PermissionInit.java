package com.fym.interceptor.shiro;

import com.alibaba.fastjson.JSON;
import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Map;

public abstract class PermissionInit{
    private final Logger logger = LoggerFactory.getLogger(PermissionInit.class);

    private String definitions = "";

    @Resource
    private ShiroFilterFactoryBean shiroFilterFactoryBean;

    @PostConstruct
    public void intiPermission() {
        shiroFilterFactoryBean.setFilterChainDefinitionMap(obtainPermission());
        logger.debug("initialize shiro permission success...");
    }

    public void updatePermission(Map<String,String> map) {
        synchronized (PermissionInit.class) {
            AbstractShiroFilter shiroFilter = null;
            try {
                shiroFilter = (AbstractShiroFilter) shiroFilterFactoryBean.getObject();
            } catch (Exception e) {
                logger.error(e.getMessage());
            }

            // 获取过滤管理器
            PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter
                    .getFilterChainResolver();
            DefaultFilterChainManager manager = (DefaultFilterChainManager) filterChainResolver.getFilterChainManager();

            // 清空初始权限配置
            manager.getFilterChains().clear();
            shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();

            // 重新构建生成
            shiroFilterFactoryBean.setFilterChainDefinitions(definitions);
            Map<String, String> chains = shiroFilterFactoryBean.getFilterChainDefinitionMap();
            chains.putAll(map);
            for (Map.Entry<String, String> entry : chains.entrySet()) {
                String url = entry.getKey();
                String chainDefinition = entry.getValue().trim().replace(" ", "");
                manager.createChain(url, chainDefinition);
            }
            logger.debug("update shiro permission success...");
        }
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
        logger.debug("全部权限\r\n"+ JSON.toJSONString(section));
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
