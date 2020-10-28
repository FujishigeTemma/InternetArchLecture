# IP Tunneling - Solution

## Assignment 1

[Host]
```
root@150-95-184-195:~# ip tunnel add tun0 mode ipip remote <相手のグローバルIP> local <自分のグローバルIP> ttl 255
root@150-95-184-195:~# ip link set up tun0
```

[rEX]
```
root@150-95-184-195:~# attach rEX
vyos@rEX:/$ config
[edit]
vyos@rEX# set interfaces tunnel tun0 address 172.16.0.1/30

vyos@rEX# set interfaces tunnel tun0 local-ip <自分のグローバルIP>

vyos@rEX# set interfaces tunnel tun0 remote-ip <相手のグローバルIP>

vyos@rEX# set interfaces tunnel tun0 encapsulation ipip

vyos@rEX# commit
vyos@rEX# save
[edit]
vyos@rEX# exit
exit
```