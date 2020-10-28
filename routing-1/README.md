# Chapter3: Routing 1

この章では、静的経路制御(Static Routing)の基礎知識とその設定を学びます。

- [Chapter3: Routing 1](#chapter3-routing-1)
	- [Lesson](#lesson)
		- [経路制御](#経路制御)
	- [Assignment](#assignment)
		- [1. 静的ルーティングによってr3からrEX, r5, `8.8.8.8`のすべてに`ping`が通るようにしてみよう](#1-静的ルーティングによってr3からrex-r5-8888のすべてにpingが通るようにしてみよう)

## Lesson

### 経路制御

ここまでは1hop(直接接続した機器同士)のパケット送信でしたが、普段インターネットを利用する上では通信先の間には数多くのルーターが存在します。
パケットは送信元から送信先へバケツリレーのように運ばれていくわけですが、この経路は一意ではありません。

様々な経路制御手法によってパケットの送信経路はコントロールされますが、ここでは各ルーターに対して宛先に対応する次のノードを指定することでパケットの経路制御を実現してみましょう。

## Assignment

### 1. 静的ルーティングによってr3からrEX, r5, `8.8.8.8`のすべてに`ping`が通るようにしてみよう

<details>
<summary>ヒント1</summary>

Chapter1と同様に使用する各NICにはIPアドレスを割り当てる必要があります。
</details>

<details>
<summary>ヒント２</summary>

`ping`の応答パケットのルーティングも必要です。
</details>

<details>
<summary>ヒント3</summary>

「VyOS static route set」などで検索してみると良いでしょう。
</details>

***

[解答を見る](../solutions/routing-1/README.md)

[TOPへ](../README.md)
