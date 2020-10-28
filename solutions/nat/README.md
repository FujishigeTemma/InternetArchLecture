# IP Address - Solution

## Assignment 1

[rEX]
```
root@150-95-184-195:~# attach rEX
vyos@rEX:/$ config
[edit]
vyos@rEX# set nat source rule 1 outbound-interface eth0 ;グローバルネットワークとの接続点

vyos@rEX# set nat source rule 1 source address 192.168.XXX.0/24 ;NATを適用する送信元ネットワークの範囲

vyos@rEX# set nat source rule 1 translation address masquerade

vyos@rEX# commit
vyos@rEX# save
[edit]
vyos@rEX# exit
exit
```

[r1]
```
root@150-95-184-195:~# attach r1
vyos@r1:/$ config
[edit]
vyos@r1# set protocols static route 0.0.0.0/0 next-hop 192.168.XXX.1 ;送信先ネットワークに応じて次のノードを指定

vyos@r1# commit

vyos@r1# ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_req=1 ttl=55 time=1.59 ms
64 bytes from 8.8.8.8: icmp_req=2 ttl=55 time=1.06 ms
^C
--- 8.8.8.8 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 1.068/1.332/1.596/0.264 ms
```