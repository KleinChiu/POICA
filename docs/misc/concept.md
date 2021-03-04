# Concept

## System

出席管理サイト
＜概要>
・Webカメラを使用した顔認証とSuicaなどの定期券を使用した認証でログインできる
・出席状況に応じたポイント付与があり、ポイントを利用して引き換えできる
—まずはここまで—
・出席管理
・顔認証 ・定期券認証
・ポイントシステム
・課題管理

メイン

出席管理
課題管理
ポイント

プラス

顔認証
スイカ認証
管理用サイト、デスクトップアプリ (electron)

## Files

## 定義書

背景
現行アルファ委員による出席・課題管理は非効率的で、手間がかかる。正直めんどくさい

目標
簡単で使いや出席・課題登録システムを生徒に使う。
いちいち授業前で出席のため時間を長く取らずにに済む。

要件
コモン
ログイン

学生版
出席確認
課題提出
課題提出確認
フレンド登録

教師版
課題発行
課題回収
出席確認

使用性要求
ブラウザーだけで普通に使える
スイカの出席確認だけがPC必要

セキュリティー要求
SSH、HTTPS
パスワードがHASHとして保存

制約条件
Apache LTS
UA 95%

スケージュール
3月1日にまで完成

用語
ポイント 出席・課題提出するたびにもらえる点数、それをプレセントに交換できる