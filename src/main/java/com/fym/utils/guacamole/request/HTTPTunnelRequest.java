package com.fym.utils.guacamole.request;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * http类型的tunnel请求
 */
public class HTTPTunnelRequest extends TunnelRequest {

    private final Map<String, List<String>> parameterMap = new HashMap<>();

    public HTTPTunnelRequest(HttpServletRequest request) {

        for (Map.Entry<String, String[]> mapEntry : ((Map<String, String[]>)
                request.getParameterMap()).entrySet()) {

            String parameterName = mapEntry.getKey();
            List<String> parameterValues = Arrays.asList(mapEntry.getValue());

            parameterMap.put(
                    parameterName,
                    new ArrayList<String>(parameterValues)
            );

        }

    }

    @Override
    public String getParameter(String name) {
        List<String> values = getParameterValues(name);

        if (values != null && !values.isEmpty())
            return values.get(0);

        return null;
    }

    @Override
    public List<String> getParameterValues(String name) {
        return parameterMap.get(name);
    }
}
