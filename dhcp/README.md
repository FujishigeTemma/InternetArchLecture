# Chapter5: DHCP

この章ではDHCPに関する基礎知識とその設定を学びます。

- [Chapter5: DHCP](#chapter5-dhcp)
	- [Lesson](#lesson)
		- [DHCP](#dhcp)
	- [Assignment](#assignment)
		- [1. DHCPを使ってs1~s3がインターネットに接続できるようにしてみよう](#1-dhcpを使ってs1s3がインターネットに接続できるようにしてみよう)

## Lesson

### DHCP

DHCP(Dynamic Host Configuration Protocol) は、ネットワーク接続するのに必要なIPアドレスなどの情報を自動的に割り当てるアプリケーション層プロトコルです。

DHCPは情報の割当を行うDHCPサーバーと情報を割り当てられるDHCPクライアントからなります。
最初は、DHCPクライアントは自身のIPアドレスも知らなければ、DHCPサーバのIPアドレスも知らないので全ての宛先(ブロードキャスト)にDHCP Discoverメッセージを送信して、ネットワーク全体に問い合わせを行います。

DHCP Discoverメッセージを受け取ったDHCPサーバは、クライアントに割り当てるIPアドレス設定などをアドレスプールから選択して提案します。
DHCPサーバの仕様によりDHCP Offerはブロードキャストで送信するので、その場合は宛先MACとIPはブロードキャストアドレスになります。

DHCP Offerを受け取ったDHCPクライアントは提案されたIPを使用する事を通知するためにDHCP Requestをブロードキャストします。

最後に、DHCPサーバはDHCPクライアントが使用するIPアドレスなどの設定情報をDHCP Ackで送信します。

これを受け取ることでDHCPクライアントは提案されたIPアドレスを自信のIPアドレスとして利用できるようになります。

DHCPサーバには色々な設定項目がありますが、DHCPクライアントにIPアドレスを割り当てる範囲のアドレスプール、サブネットマスク、デフォルトゲートウェイのアドレス、DNSサーバのIPアドレス、リース期間(IPアドレスの貸し出し期間)などが、基本的な設定項目となります。

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
