Sub setupNetwork(setupParams As Object)

    stop

    if type(setupParams.setupEthernet) = "roBoolean" and setupParams.setupEthernet and type(setupParams.ethernetParams) = "roAssociativeArray" then
        nc = CreateObject("roNetworkConfiguration", 0)
        if type(nc) = "roNetworkConfiguration" then
            ConfigureNetwork(nc, setupParams.ethernetParams)
        endif
    endif

    if type(setupParams.setupWireless) = "roBoolean" and setupParams.setupWireless and type(setupParams.wirelessParams) = "roAssociativeArray" then
        nc = CreateObject("roNetworkConfiguration", 1)
        if type(nc) = "roNetworkConfiguration" then
            ConfigureNetwork(nc, setupParams.wirelessParams)
        endif
    else
        DisableWireless()
    endif

End Sub


Sub ConfigureNetwork(nc As Object, networkingParameters As Object)

    if networkingParameters.useDHCP then
        nc.SetDHCP()
    else
		nc.SetIP4Address(networkingParameters.staticIPAddress)
		nc.SetIP4Netmask(networkingParameters.subnetMask)
		nc.SetIP4Gateway(networkingParameters.gateway)
		if networkingParameters.dns1 <> "" then nc.AddDNSServer(networkingParameters.dns1)
		if networkingParameters.dns2 <> "" then nc.AddDNSServer(networkingParameters.dns2)
		if networkingParameters.dns3 <> "" then nc.AddDNSServer(networkingParameters.dns3)
    endif

    nc.SetRoutingMetric(-1)

	nc.SetTimeServer(networkingParameters.timeServer)
	nc.SetProxy(networkingParameters.proxySpec)
    nc.SetProxyBypass(networkingParameters.bypassProxyHosts)
	nc.SetInboundShaperRate(-1)

	ok = nc.Apply()
stop

End Sub


Sub DisableWireless()
	nc = CreateObject("roNetworkConfiguration", 1)
	if type(nc) = "roNetworkConfiguration" then
		nc.SetDHCP()
		nc.SetWiFiESSID("")
		nc.SetObfuscatedWifiPassphrase("")
		nc.Apply()
	endif
End Sub
