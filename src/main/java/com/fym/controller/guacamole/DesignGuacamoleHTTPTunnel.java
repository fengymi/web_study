package com.fym.controller.guacamole;

import com.fym.service.guacamole.GuacamoleTokenSessionService;
import com.fym.utils.component.SpringBeanGetter;
import com.fym.utils.data.HashPageData;
import org.glyptodon.guacamole.GuacamoleException;
import org.glyptodon.guacamole.net.AbstractGuacamoleTunnel;
import org.glyptodon.guacamole.net.GuacamoleSocket;

import java.util.UUID;

public class DesignGuacamoleHTTPTunnel extends AbstractGuacamoleTunnel {

    private final UUID uuid = UUID.randomUUID();
    private final GuacamoleSocket socket;

    public DesignGuacamoleHTTPTunnel(GuacamoleSocket socket, HashPageData user) {
        this.socket = socket;
        SpringBeanGetter.getBean(GuacamoleTokenSessionService.class).addTunnelUser(uuid.toString(),user);
    }

    @Override
    public UUID getUUID() {
        return this.uuid;
    }
    @Override
    public GuacamoleSocket getSocket() {
        return this.socket;
    }
    @Override
    public void close() throws GuacamoleException {
        super.close();
        SpringBeanGetter.getBean(GuacamoleTokenSessionService.class).remove(this.getUUID().toString());
    }
}
