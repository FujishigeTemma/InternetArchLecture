# Chapter2: NAT

この章では、NAT(Network Address Translation)の基礎知識とその設定を学びます。

- [Chapter2: NAT](#chapter2-nat)
	- [Lesson](#lesson)
		- [NAT(Network Address Translation)](#natnetwork-address-translation)
		- [Gateway](#gateway)
	- [Assignment](#assignment)
		- [1. r1から`8.8.8.8`に`ping`が通るようにしてみよう](#1-r1から8888にpingが通るようにしてみよう)

## Lesson

### NAT(Network Address Translation)

NATはその名の通りIPアドレスを変換するための技術です。
一般的にはプライベートIPアドレスとグローバルIPアドレスを相互に変換するために用いられます。

プライベートネットワーク内からグローバルネットワークに存在するホストを指定してパケットを送信するとき、つまりインターネットに接続して通信を行うとき、使用するIPアドレスはユニークなもの(=グローバルIPアドレス)でなければならないため、送信元IPアドレスをグローバルIPアドレスに変換する必要があります。

また、プライベートネットワーク内のホストを宛先にパケットを送信したい場合、NATサーバーが受け取った後適切に宛先IPアドレスをプライベートIPアドレスに書き換える必要があります。

**[INFO]**  
現実では、NAPT(Network Address Port Translation, IP masquerade)と呼ばれる技術を用いてポート番号を動的に変更することで、一つのIPアドレスに複数のホストを割り当てられるようにしています。

### Gateway

ゲートウェイは、通信プロトコルの異なるネットワーク同士が通信する際に中継する役割を備えた機器やそれに関するソフトウェアのことです。

**デフォルトゲートウェイ**はゲートウェイの一種で、内部ネットワークと外部ネットワークを接続するためのノードです。
一般に、経路の判明していないパケットはデフォルトゲートウェイに送られます。


## Assignment

### 1. r1から`8.8.8.8`に`ping`が通るようにしてみよう

<details>
<summary>ヒント1</summary>

`8.8.8.8`はGoogleの運用するパブリックDNSサーバーです。
プライベートネットワークの外と通信するためにはグローバルIPアドレスを使用する必要があります。
</details>

<details>
<summary>ヒント2</summary>

初期状態では、r1は`8.8.8.8`にパケットを送るための経路を知らないのでパケットを破棄します。
r1にrEXがデフォルトゲートウェイであることを設定する必要があります。
</details>

<details>
<summary>ヒント3</summary>

インターネットに接続しているrEXで、r1から来たパケットの送信元アドレスをグローバルIPアドレスに書き換える必要があります。
NAT時に必要な情報は、「どの範囲から来たパケットにNATを適用するか」です。
</details>

***

[解答を見る](../solutions/nat/README.md)

[TOPへ](../README.md)
