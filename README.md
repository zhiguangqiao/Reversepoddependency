# Reversepoddependency

cocoapods 辅助工具，用来分析 podspec 之间的依赖关系 ，目前只支持反向依赖的分析 
默认会 update repo 库，如果在官方的 master  repo 中分析 可能会耗时比较长

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reversepoddependency'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reversepoddependency

## Usage

```ruby
specbackwarddependency repopath podname
# 例如 specbackwarddependency ~/.cocoapods/repos/master AFNetworking
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/乔志广/reversepoddependency.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

