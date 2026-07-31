# わたしの本棚

## 1.アプリ概要
読んだ本だけでなく読みたい本も管理できるアプリです。<br>
本のタイトル・著者・読書状況・入手方法・媒体、読書期間、感想などを登録し、管理することができます。

## 2.アプリ画像
### 書籍一覧画面
<img width="1920" height="986" alt="書籍一覧画面コピー" src="https://github.com/user-attachments/assets/cbceddfc-f7a2-43c4-967b-5231f4381bbe" />

### 書籍詳細画面
<img width="1920" height="965" alt="書籍詳細画面コピー" src="https://github.com/user-attachments/assets/3f8d592a-0489-4551-8b93-2a79d58fdf16" />

## 3.主な機能

### ユーザー機能
- ユーザー登録
- ログイン / ログアウト
- ゲストログイン
- ユーザーごとの書籍管理

### 書籍管理機能
- 書籍の登録
- 書籍一覧表示
- 書籍詳細表示
- 書籍編集
- 書籍削除

### 検索・絞り込み機能
- タイトル・著者名で検索
- 読書状況で絞り込み
  - 未読
  - 読書中
  - 読了
- 入手方法で絞り込み
  - 購入
  - 借りた
  - 未入手
- 媒体で絞り込み
  - 紙書籍
  - 電子書籍

## 4.開発動機
読んだことがあるかないか、その本を持っているのか持っていないのか、持っている場合媒体は何かなど、自分が興味を持った本をまとめて管理できるアプリが欲しいと考え、開発しました。

## 5.工夫した点
検索機能を充実させました。<br>
本のタイトル、著者だけでなく読書状況・入手方法・媒体も含めて検索することができます。

## 6.ER図

```mermaid
erDiagram

  users ||--o{ books :registers

users {
  bigint id PK
  string email
  string password_digest
}

books {
  bigint id PK
  bigint user_id FK
  string title
  string author
  date started_on
  date finished_on
  integer reading_status
  integer acquisition_type
  boolean paper
  boolean ebook
  text memo
}
