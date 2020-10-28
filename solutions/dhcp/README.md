# DHCP - Solution

## Assignment 1

[r4]
```
root@150-95-184-195:~# attach r4
vyos@r6:/$ config
[edit]
vyos@r4# set interfaces ethernet eth100 address 192.168.0.142/28

vyos@r4# set protocols ospf area 0 network 192.168.0.128/28

vyos@r4# set protocols ospf passive-interface eth100

vyos@r4# set service dhcp-server shared-network-name dhcp_scope_01 subnet 192.168.0.128/28 default-router 192.168.0.142 ; 送信先ネットワークに対してデフォルトルート(今回はDHCPホストサーバー)を設定

vyos@r4# set service dhcp-server shared-network-name dhcp_scope_01 subnet 192.168.0.128/28 start 192.168.0.129 stop 192.168.0.139 ; DHCPで使用するネットワークとその中で割り振る範囲を設定

vyos@r4# commit
vyos@r4# save
[edit]
vyos@r4# exit
exit

vyos@r6:/$ show dhcp server statistics

Pool                      Pool size   # Leased    # Avail
----                      ---------   --------    -------
dhcp_scope_01             10          0           10
```

`show dhcp server statistics`で割り振りが行われているか確認可能です。

[s1~s3]
```
root@s1:~# dhclient eth0
```
でDHCPの再リースが可能です。

割り振り前後で`ip address`コマンドの結果を比較してみると良いでしょう。
