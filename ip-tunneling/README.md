# Chapter6: IP Tunneling

この章では、IP Tunnelingの基礎知識とその設定を学びます。

- [Chapter6: IP Tunneling](#chapter6-ip-tunneling)
	- [Lesson](#lesson)
		- [Tunneling](#tunneling)
		- [IP in IP Tunneling](#ip-in-ip-tunneling)
	- [Assignment](#assignment)
		- [1. 他の人のサーバーとIPIPトンネリングを張って、トンネルに指定したIPに対してpingが通ることを確認してください。](#1-他の人のサーバーとipipトンネリングを張ってトンネルに指定したipに対してpingが通ることを確認してください)

## Lesson

### Tunneling

トンネリングとは、間に複数のネットワーク機器が挟まれた状態のネットワーク機器同士をあたかも直結しているかのように見せる手法のことです。
GREやIPIP、SITなどいくつか方法がありますがここではIP in IP Tunnelingを使用します。

### IP in IP Tunneling

IPIPでは、IPパケットの上に更にIPヘッダを付与しカプセル化することでトンネリングを実現します。

IPIPにはPoint to Pointインタフェースであるtunnelインターフェースが必要で、このインターフェースでカプセル化を解除します。
`Outer IP Header`にはtunnelインターフェースのエンドポイントを識別する情報が記載されています。

```
                                         +---------------------------+
                                         |                           |
                                         |      Outer IP Header      |
                                         |                           |
     +---------------------------+       +---------------------------+  　   +---------------------------+       
     |                           |       |                           |   　  |                           |       
     |         IP Header         |       |         IP Header         |　　　　|         IP Header         |
     |                           |       |                           |    　 |                           |       
     +---------------------------+ ====> +---------------------------+ ====> +---------------------------+
     |                           |       |                           |   　  |                           |
     |                           |       |                           |   　  |                           |
     |         IP Payload        |       |         IP Payload        |   　  |         IP Payload        |
     |                           |       |                           |   　  |                           |
     |                           |       |                           |   　  |                           |
     +---------------------------+       +---------------------------+  　   +---------------------------+
```

**[WARN]**  
tunnelインターフェース上でOSPFを有効化し、sourceやdestinationのIPをtunnelインターフェース経由で学習してしまわないように注意してください。\
OSPFはネットワークで指定するため、IPアドレスが同じ`eth0`とtunnelインタフェースの両方でOSPFが有効になり、外側にあるtunnelインタフェースで経路を学習するようになります。\
この場合、tunnel接続のためのNextHopがtunnelインタフェース自身になり`recursive routing`状態に陥ることで、tunnelインタフェースがUpDownを繰り返し、その結果OSPFのネイバーもUpDownを繰り返します。

## Assignment

### 1. 他の人のサーバーとIPIPトンネリングを張って、トンネルに指定したIPに対してpingが通ることを確認してください。

**[WARN]**  
トンネリングに使うIPアドレスは172.16.以下を利用してください。\
tunnelインターフェースはホスト側に作成し、トンネリング設定をVyOS内で行なってください。\
TTLを必ず指定してください(255程度)。\
Chapter7以降に進むために必須になります。

<details>
<summary>ヒント1</summary>

ホストでの操作は`ip`コマンドを使用すると良いでしょう。
</details>

<details>
<summary>ヒント２</summary>

自分のグローバルIPアドレスと相手のグローバルIPアドレスが必要です。
</details>

<details>
<summary>ヒント3</summary>

`encapsulation`の形式は`ipip`です。
</details>

***

[解答を見る](../solutions/ip-tunneling/README.md/README.md)

[TOPへ](../README.md)
