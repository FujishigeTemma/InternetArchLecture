# Chapter8: DNS 1

この章ではDNS(Domain Name System)に関する基礎知識とその設定を学びます。

- [Chapter8: DNS 1](#chapter8-dns-1)
	- [Lesson](#lesson)
		- [DNS](#dns)
	- [Assignment](#assignment)
		- [1. DHCPを使ってs1~s3がインターネットに接続できるようにしてみよう](#1-dhcpを使ってs1s3がインターネットに接続できるようにしてみよう)

## Lesson

### DNS



## Assignment

### 1. DHCPを使ってs1~s3がインターネットに接続できるようにしてみよう

**[INFO]**  
s1~s3は`dhclient`導入済みUbuntu 20.04 LTSです。

<details>
<summary>ヒント1</summary>

ここではr4がDHCPサーバー、s1~s3がDHCPクライアントです。
</details>

<details>
<summary>ヒント2</summary>

最初はこれまでと同様にr4の`eth100`に対してIPアドレスやOSPFの設定を行う必要があります。
</details>

<details>
<summary>ヒント3</summary>

DHCPサーバーには少なくとも割り当てる範囲のアドレスプール・サブネットマスク、デフォルトゲートウェイのアドレスの3つが必要です。
</details>

***

[解答を見る](../solutions/dhcp/README.md)

[TOPへ](../README.md)
