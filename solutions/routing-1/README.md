# Routing 1 - Solution

## Assignment 1

以降、解答ではIPアドレスを以下のように設定しています。
各自の環境に合わせて読み替えるようにしてください。

![IP Setting](/assets/ip-setting.drawio.svg)

[rEX]
```
root@150-95-184-195:~# attach rEX
vyos@rEX:/$ config
[edit]
vyos@rEX# set protocols static route 192.168.0.0/28 next-hop 192.168.0.2

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
vyos@r1# set protocols static route 192.168.0.8/30 next-hop 192.168.0.6

vyos@r1# set protocols static route 192.168.0.16/30 next-hop 192.168.0.6

vyos@r1# commit
vyos@r1# save
[edit]
vyos@r1# exit
exit
```

[r2]
```
root@150-95-184-195:~# attach r2
vyos@r2:/$ config
[edit]
vyos@r2# set protocols static route 0.0.0.0/0 next-hop 192.168.0.5

vyos@r2# commit
vyos@r2# save
[edit]
vyos@r2# exit
exit
```

[r3]
```
root@150-95-184-195:~# attach r3
vyos@r3:/$ config
[edit]
vyos@r3# set protocols static route 0.0.0.0/0 next-hop 192.168.0.9

vyos@r3# commit
vyos@r3# save
[edit]
vyos@r3# exit
exit
```

[r5]
```
root@150-95-184-195:~# attach r5
vyos@r5:/$ config
[edit]
vyos@r5# set protocols static route 0.0.0.0/0 next-hop 192.168.0.17

vyos@r5# commit
vyos@r5# save
[edit]
vyos@r5# exit
exit
```
