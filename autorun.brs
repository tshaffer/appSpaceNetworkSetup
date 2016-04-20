Library "setupNetwork.brs"

Sub Main()

    setupParams = {}

    setupParams.setupEthernet = true

    setupParams.ethernetParams = {}

    setupParams.ethernetParams.useDHCP = false

    setupParams.ethernetParams.staticIPAddress = "10.1.0.180"
    setupParams.ethernetParams.subnetMask = "255.255.255.0"
    setupParams.ethernetParams.gateway = "10.1.0.1"
    setupParams.ethernetParams.dns1 = "10.1.0.25"
    setupParams.ethernetParams.dns2 = "10.1.0.35"
    setupParams.ethernetParams.dns3 = ""

    setupParams.ethernetParams.timeServer = "http://time.brightsignnetwork.com"
    setupParams.ethernetParams.proxySpec = ""
    setupParams.ethernetParams.bypassProxyHosts = []

    setupParams.setupWireless = true

    setupParams.wirelessParams.useDHCP = false

    setupParams.wirelessParams.staticIPAddress = "10.1.0.180"
    setupParams.wirelessParams.subnetMask = "255.255.255.0"
    setupParams.wirelessParams.gateway = "10.1.0.1"
    setupParams.wirelessParams.dns1 = "10.1.0.25"
    setupParams.wirelessParams.dns2 = "10.1.0.35"
    setupParams.wirelessParams.dns3 = ""

    setupParams.wirelessParams.timeServer = "http://time.brightsignnetwork.com"
    setupParams.wirelessParams.proxySpec = ""
    setupParams.wirelessParams.bypassProxyHosts = []

    setupNetwork(setupParams)

    msgPort = CreateObject("roMessagePort")
    while true
        event = wait(0, msgPort)
    end while

End Sub

