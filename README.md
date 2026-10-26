# MikroTik OSPF Lab + Zabbix SNMP Monitoring

3 MikroTik CHR routers (RouterOS 7) in VMware, connected in a triangle, running OSPF and monitored by Zabbix via SNMP.

## Topology
          R1 (10.0.0.1)
         /            \
  10.0.12.0/30    10.0.13.0/30
       /                \
 R2 (10.0.0.2) ---- R3 (10.0.0.3)
        10.0.23.0/30

Management: ether1 on 192.168.233.0/24 (R1 .11, R2 .12, R3 .13), outside OSPF.

## What I configured
- IP addressing: /30 point-to-point links, /32 loopbacks as Router IDs
- OSPF area 0 (backbone): neighbors, learned routes, ECMP
- SSH with a dedicated user, admin disabled, Telnet/FTP disabled
- SNMP v2c with a restricted community → Zabbix (Network Generic Device by SNMP)

## Tests
- Link failure (R1–R2 down): OSPF rerouted traffic through R3, ping kept working
- Zabbix raised "Interface ether2: Link down" and resolved it after reconnecting

## Files
- `configs/R1.rsc`, `R2.rsc`, `R3.rsc`: router exports (`/export`), community hidden

## What I learned
OSPF (neighbors, LSDB, cost, ECMP, areas), loopbacks, /30 vs /32, management vs data network, SNMP polling, interface monitoring and link-down alarms.