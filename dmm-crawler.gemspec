# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dmm-crawler/version'

Gem::Specification.new do |spec|
  spec.name          = 'dmm-crawler'
  spec.version       = DMMCrawler::VERSION
  spec.authors       = ['Satoshi Ohmori']
  spec.email         = ['sachin21dev@gmail.com']

  spec.summary       = "Show DMM and DMM.R18's crawled data"
  spec.description   = "Show DMM and DMM.R18's crawled data. e.g. ranking"
  spec.homepage      = 'https://github.com/sachin21/dmm-crawler'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")

  spec.required_ruby_version = '>= 2.4.0'

  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'mechanize'
  spec.add_runtime_dependency 'rdmm'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '~> 0.69.0'
end
