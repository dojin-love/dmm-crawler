:us: [:jp:](./doc/ja/README.md) [![Build Status](https://travis-ci.org/sachin21/dmm-crawler.svg?branch=master)](https://travis-ci.org/sachin21/dmm-crawler) ![Gem Version](https://badge.fury.io/rb/dmm-crawler.svg) [![Build Status](https://travis-ci.org/sachin21/dmm-crawler.svg?branch=master)](https://travis-ci.org/sachin21/dmm-crawler) [![Code Climate](https://codeclimate.com/github/sachin21/dmm-crawler/badges/gpa.svg)](https://codeclimate.com/github/sachin21/dmm-crawler) [![Gem](https://img.shields.io/gem/dt/dmm-crawler.svg)](https://rubygems.org/gems/dmm-crawler)

# DMM Crawler

## :warning: Cation :warning:

FANZA does not accept crawling pages so I don't recommend to use this gem.

I do not take any responsibility or liability for any damage or loss caused by mine gem.

## What is DMM Crawler

Show DMM and DMM.R18's crawled data. Now, All rankings for doujin is crawlable.

## Installation

On your gemfile.

```
gem 'dmm-crawler'
```

## Usage

### DMM.R18 Doujin Ranking

```ruby
require 'dmm-crawler'

include DMMCrawler

client = Client.new do |agent|
  agent.ignore_bad_chunking = false
end

client.rankings(term: '24', submedia: 'cg')
# =>
# {
#   title: "title",
#   title_link: "title url",
#   image_url: "Link to title"s main image",
#   submedia: "cg",
#   author: "author",
#   informations: [{key: 'key', value: 'value'}],
#   rank: '1'
#   tags: ["tag1", "tag2"]
# }
```

For example, Above command will show the doujin cg 24's ranking.

#### Available arguments

- Arguments for the term is available to use `all, comic, cg, game, voice`.
- Arguments for the submedia is available to use `24, weekly, monthly, total`.

### From an art's URL

```ruby
require 'dmm-crawler'

include DMMCrawler

client = Client.new do |agent|
  agent.ignore_bad_chunking = false
end

URL = 'https://www.dmm.co.jp/dc/doujin/-/detail/=/cid=d_087090'

client.get_attributes(URL)
# =>
# [
# ...
# ]
```

It returns art information by Array.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
