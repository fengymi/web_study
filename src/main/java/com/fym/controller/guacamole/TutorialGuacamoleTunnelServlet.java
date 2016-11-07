package com.fym.controller.guacamole;

import org.glyptodon.guacamole.GuacamoleException;
import org.glyptodon.guacamole.net.GuacamoleSocket;
import org.glyptodon.guacamole.net.GuacamoleTunnel;
import org.glyptodon.guacamole.net.InetGuacamoleSocket;
import org.glyptodon.guacamole.net.SimpleGuacamoleTunnel;
import org.glyptodon.guacamole.protocol.ConfiguredGuacamoleSocket;
import org.glyptodon.guacamole.protocol.GuacamoleConfiguration;
import org.glyptodon.guacamole.servlet.GuacamoleHTTPTunnelServlet;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TutorialGuacamoleTunnelServlet
        extends GuacamoleHTTPTunnelServlet {

    @Override
    protected GuacamoleTunnel doConnect(HttpServletRequest request)
            throws GuacamoleException {
        System.out.println("start");
        // Create our configuration
        GuacamoleConfiguration config = new GuacamoleConfiguration();
        config.setProtocol("ssh");
        config.setParameter("hostname", "115.159.55.209");
        config.setParameter("port", "22");
//        config.setParameter("username", "root");
//        config.setParameter("password", "feng1234");

        // Connect to guacd - everything is hard-coded here.
        GuacamoleSocket socket = null;
        socket = new ConfiguredGuacamoleSocket(
//                new InetGuacamoleSocket("192.168.182.137", 4822),
//                new InetGuacamoleSocket("192.168.182.138", 4822),
                new InetGuacamoleSocket("developfym.yundanche.cn", 80),
//                new InetGuacamoleSocket("192.168.68.140", 4822),
                config
        );
        System.out.println("end");
        // Return a new tunnel which uses the connected socket
        return new SimpleGuacamoleTunnel(socket);

    }

}
