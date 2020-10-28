# IP Address - Solution

## Assignment 1

[rEX]
```
root@150-95-184-195:~# attach rEX
vyos@rEX:/$ config
[edit]
vyos@rEX# set interfaces ethernet eth10 address 192.168.XXX.1/30

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
vyos@r1# set interfaces ethernet eth12 address 192.168.XXX.2/30

vyos@r1# commit
vyos@r1# save
[edit]
vyos@r1# exit
exit
```