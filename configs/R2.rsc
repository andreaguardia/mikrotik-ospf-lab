# 2026-10-26 19:49:43 by RouterOS 7.23.8
# system id = brTKevvb2yI
#
/interface bridge
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/routing ospf instance
add name=default router-id=10.0.0.2
/routing ospf area
add instance=default name=backbone
/snmp community
set [ find default=yes ] disabled=yes
add addresses=192.168.233.0/24 name=<SNMP_COMMUNITY>
/ip address
add address=192.168.233.12/24 interface=ether1 network=192.168.233.0
add address=10.0.12.2/30 interface=ether2 network=10.0.12.0
add address=10.0.23.1/30 interface=ether3 network=10.0.23.0
add address=10.0.0.2 interface=loopback network=10.0.0.2
/ip service
set ftp disabled=yes
set telnet disabled=yes
/routing ospf interface-template
add area=backbone networks=10.0.12.0/30,10.0.23.0/30,10.0.0.2/32
/snmp
set contact=Andrea enabled=yes location=Lab
/system identity
set name=R2
