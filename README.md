# インターネット構築講習会

この講習会では、仮想的に接続された機器の設定を通して、インターネットが動くのに必要な要素技術を実用的な形で学習します。

講習会は一連の講義で構成されており、各講義には対応するリポジトリがあるので詳しくは各リポジトリのREADME.mdを参照してください。

- [インターネット構築講習会](#インターネット構築講習会)
  - [Introduction](#introduction)
  - [First Step: Setup](#first-step-setup)
  - [Table of Contents](#table-of-contents)

## Introduction

1969年にその原型となったARPANETが誕生して以来、インターネットは今や生活のあらゆる場面に登場し、社会インフラの一部となりました。
この講習会では、インターネットを支える技術のなかでも識別子の扱いや経路制御、名前解決などに注目して掘り下げていきます。(前提知識は特に要求しません)

各講義は作業の背景知識となる**Lesson**と、実際に手を動かしてネットワークの設定を行う**Assignment**で構成されています。

長年かけて発展してきたインターネットの技術を網羅的に扱う都合上、Lessonにはあまり詳しい内容は書かないので各自で積極的に調べるようにしてください。
Assignmentの解答は[solution](/solution/README.md)以下にあるので困ったときは参考にしてください。

## First Step: Setup
- 動作環境
  - Ubuntu 20.04 LTS
  - GCP e2-micro
    - vCPU x2
    - memory 1GB

Exec this script:  
`curl https://raw.githubusercontent.com/FujishigeTemma/InternetArchLecture/main/setup/setup.sh | bash`

## Table of Contents
1. [IP Address](/ip-address/README.md)
1. [NAT](/nat/README.md)
1. [Routing 1](/routing-1/README.md)
1. [Routing 2](/routing-2/README.md)
1. [DHCP](/dhcp/README.md)
1. [IP Tunneling](/ip-tunneling/README.md)
1. [BGP](/bgp/README.md)
1. [DNS 1](/dns-1/README.md)
1. [DNS 2](/dns-2/README.md)
1. [DNS 3](/dns-3/README.md)