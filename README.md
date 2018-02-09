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

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
