[:us:](../../README.md) :jp: [![Build Status](https://travis-ci.org/sachin21/dmm-crawler.svg?branch=master)](https://travis-ci.org/sachin21/dmm-crawler) ![Gem Version](https://badge.fury.io/rb/dmm-crawler.svg) [![Build Status](https://travis-ci.org/sachin21/dmm-crawler.svg?branch=master)](https://travis-ci.org/sachin21/dmm-crawler) [![Code Climate](https://codeclimate.com/github/sachin21/dmm-crawler/badges/gpa.svg)](https://codeclimate.com/github/sachin21/dmm-crawler) [![Gem](https://img.shields.io/gem/dt/dmm-crawler.svg)](https://rubygems.org/gems/dmm-crawler)

# DMM Crawler

## :warning: 注意 :warning:

FANZA(旧DMM.R18)はクロールを禁止しているので、使用しないことをおすすめします。
dmm-crawlerを利用するにあたって不利益や損害が生じたとしても一切の責任を負わないものとします。

## DMM Crawlerとは

DMM.R18のクロールしたデータを取得するgemです。現在、**同人**のランキングにのみ対応しております。

## インストール

Gemfileに以下を追記してください。

```
gem 'dmm-crawler'
```

## 使い方

データを使いたい`.rb`ファイルで以下を実行したらクロールしたデータが取得出来ます。

```ruby
require 'dmm-crawler'

include DMMCrawler

client = Client.new do |agent|
  agent.ignore_bad_chunking = false
end

client.rankings(term: '24', submedia: 'cg')
# =>
# {
#   title: "タイトル",
#   title_link: "タイトルURL",
#   image_url: "画像URL",
#   submedia: "cg",
#   tags: ["タグ1", "タグ2"]
# }
```

この例ではCG作品の24時間ランキングのデータを取得しています。

### 使用可能な引数
- termの引数は`all, comic, cg, game, voice`のみ利用可能です。
- submediaの引数は`24, weekly, monthly, total`のみ利用可能です。

## コントリビューション

1. フォークする
2. 新しくブランチを切る (`git checkout -b my-new-feature`)
3. 変更をコミットする (`git commit -am 'Add some feature'`)
4. 変更をプッシュする (`git push origin my-new-feature`)
5. プルリクエストを投げる :+1:
