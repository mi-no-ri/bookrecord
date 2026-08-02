# わたしの本棚

## 1.アプリ概要
読んだ本だけでなく読みたい本も管理できるアプリです。<br>
本のタイトル・著者・読書状況・入手方法・媒体、読書期間、メモや感想などを登録し、管理することができます。

## 2.アプリのURL
https://bookrecord.onrender.com

## 3.アプリ画像
### ログイン画面
<img width="1920" height="985" alt="ログイン画面コピー" src="https://github.com/user-attachments/assets/07aadc77-a925-4dc4-afc5-3a014228263c" />

### ユーザー新規登録画面
<img width="1920" height="979" alt="ユーザー新規登録画面コピー" src="https://github.com/user-attachments/assets/122e216c-695e-437c-8dfb-66fb62e1f181" />

### 書籍一覧画面
<img width="1920" height="990" alt="書籍一覧画面" src="https://github.com/user-attachments/assets/c58aaf54-4d78-410b-afcf-6b3481020a0c" />

### 書籍新規登録画面
<img width="1920" height="976" alt="書籍新規登録画面" src="https://github.com/user-attachments/assets/696cfa99-aa21-424e-add9-424ea82344a2" />

### 書籍編集画面
<img width="1920" height="988" alt="書籍編集画面" src="https://github.com/user-attachments/assets/316de8ac-8bd9-4a16-90c0-a9787e3c8134" />

### 書籍詳細画面
<img width="1920" height="972" alt="書籍詳細画面" src="https://github.com/user-attachments/assets/4f76a991-41f8-4420-a404-0d34d6d44b8b" />

## 4.主な機能
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

## 5.開発動機
読んだことがあるかないか、その本を持っているのか持っていないのか、持っている場合媒体は何かなど、自分が興味を持った本をまとめて管理できるアプリが欲しいと考え、開発しました。

## 6.工夫した点
検索機能を充実させました。<br>
本のタイトル、著者だけでなく読書状況・入手方法・媒体も含めて検索することができます。

## 7.ER図

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
