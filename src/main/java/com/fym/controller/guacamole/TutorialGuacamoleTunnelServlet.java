package com.fym.controller.guacamole;

import com.fym.service.guacamole.GuacamoleTokenSessionService;
import com.fym.service.guacamole.TunnelRequestService;
import com.fym.utils.component.SpringBeanGetter;
import com.fym.utils.data.HashPageData;
import org.glyptodon.guacamole.GuacamoleException;
import org.glyptodon.guacamole.net.GuacamoleTunnel;
import org.glyptodon.guacamole.servlet.GuacamoleHTTPTunnelServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

@WebServlet("/tunnel")
public class TutorialGuacamoleTunnelServlet
        extends GuacamoleHTTPTunnelServlet {

    @Override
    protected GuacamoleTunnel doConnect(HttpServletRequest request)
            throws GuacamoleException {
        TunnelRequestService service = SpringBeanGetter.getBean(TunnelRequestService.class);
        return service.createTunnel(new HashPageData(request));
//        System.out.println("start");
//        // Create our configuration
//        GuacamoleConfiguration config = new GuacamoleConfiguration();
//        //tencent
//        config.setProtocol("ssh");
//        config.setParameter("hostname", "115.159.55.209");
//        config.setParameter("port", "22");
//        config.setParameter("username", "ssh_user1");
//        config.setParameter("password", "123456");
//        //window7
//        config.setParameter("hostname", "192.168.182.130");
//        config.setProtocol("rdp");
//        config.setParameter("port", "3389");
//        config.setParameter("username", "fengymi");
//        config.setParameter("password", "feng1234");
//
//        config.setProtocol("vnc");
//        config.setParameter("port", "5900");
//        config.setParameter("username", "root");
//        config.setParameter("password", "feng1234");
//
//        // Connect to guacd - everything is hard-coded here.
//        GuacamoleSocket socket = null;
//        socket = new ConfiguredGuacamoleSocket(
//                new InetGuacamoleSocket("192.168.182.137", 4822),
////                new InetGuacamoleSocket("192.168.182.138", 4822),
////                new InetGuacamoleSocket("developfym.yundanche.cn", 80),
////                new InetGuacamoleSocket("192.168.68.140", 4822),
//                config
//        );
//        System.out.println("end");
//        // Return a new tunnel which uses the connected socket
//        return new SimpleGuacamoleTunnel(socket);

    }

    @Override
    protected void registerTunnel(GuacamoleTunnel tunnel) {
        super.registerTunnel(tunnel);
    }

    @Override
    protected void deregisterTunnel(GuacamoleTunnel tunnel) {
        SpringBeanGetter.getBean(GuacamoleTokenSessionService.class).remove(tunnel.getUUID().toString());
        super.deregisterTunnel(tunnel);
    }
}
