# BGP - Solution

## Assignment 1

[rEX]
```
root@150-95-184-195:~# attach rEX
vyos@rEX:/$ config
[edit]
vyos@rEX# edit protocols bgp <自分のAS番号> ;

vyos@rEX# set parameters router-id <自分のグローバルIP>

vyos@rEX# set neighbor <相手のグローバルIP> remote-as <相手のAS番号>

vyos@rEX# set network <広告したいネットワークの範囲> ;自分から見えるルーティングテーブルの範囲に存在しなければならない。

vyos@rEX# commit
vyos@rEX# save
[edit]
vyos@rEX# exit
exit
```

ルーティングテーブルは
```
vyos@rEX:/$ show ip route
```
で確認可能です。

BGPセッションの状態は
```
vyos@rEX# show ip bgp summary
```
で確認可能です。

| BGPの状態       | 説明                                                                                                                                                 |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Idle         | BGPの設定直後の状態。BGPネイバーへのIP到達性があればTCP接続を開始する状態。BGPネイバーへのIP到達性があれば「Connect」状態へ遷移する。                                                                     |
| Connect      | TCP接続の完了を待っている状態。TCP接続が成功した場合はOPENメッセージを送信して「OPEN Sent」状態へ遷移する。TCP接続が失敗した場合は「Active」状態へ遷移。                                                         |
| Active       | TCP接続を試行している状態。ネイバーのIPアドレス、AS番号、認証パスワードの設定ミスがある場合、Active状態のままとなるか「idle→Active→idle」という状態を繰り返す。                                                     |
| Open Sent    | OPENメッセージを送信し、BGPネイバーからのOPENメッセージ確認を待っている状態。OPENメッセージが受理できる場合、KEEPALIVEメッセージの送信を開始して、OPENConfirm状態に遷移。受理できない場合は、NOTIFICATIONを送信してidle状態へ遷移。        |
| Open Confirm | KEEPALIVEメッセージ、または、NOTIFICATIONメッセージを待っている状態。KEEPALIVEを受信すれば「Established」状態へ遷移（BGPネイバー確立の成功）        AS番号の不一致などによってNOTIFICATIONを受信した場合は「idle」状態へ遷移。 |
| Established  | BGPネイバーが正常に確立している状態。この状態の後、UPDATEメッセージを交換できBGPテーブルやルーティングテーブルが生成される。この「Established」状態になってもNOTIFICATIONメッセージを受信した場合には「idle」状態へ遷移する。                 |

## Assignment 1

Python3を使った例

[s1]
```
root@s1:~# echo "Success!" > index.html
root@s1:~# python3 -m http.server 80
```

[例: r1]
```
vyos@rEX:/$ curl http://server.{traQ ID}
Success!
```
