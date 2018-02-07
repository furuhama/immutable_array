# ImmutableArray

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'immutable_array'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install immutable_array

## Usage

This module refines Array class.

To use this, first, you should write this where you wannna use

```ruby
using ImmutableArray
```

Override `<<` operator for Array class objects, and set symbolized method after it.

```ruby
some_array << :method_name
```

### Standard Usage

I made this gem to make completely frozen Array.

To do this,

```ruby:sample.rb
using ImmutableArray

arr = [1, 1, 2, 3, 5, 8]

arr << :freeze # arr becomes completely frozen
```

That's all.

### Debug

To debug this, I defined `recursive_bool_check` for Array class refinement.

```ruby:debug.rb
using ImmutableArray

arr = ['hoge', 15, [10, 'にゃーん', [:piyopiyo, 9326]]] << :freeze

p arr.recursive_bool_check(:frozen?) # this returns true, when all elements & itself returns true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/immutable_array. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ImmutableArray project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/immutable_array/blob/master/CODE_OF_CONDUCT.md).
