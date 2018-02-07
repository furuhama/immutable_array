# main script for testing usage

require "immutable_array"

if __FILE__ == $0
  using ImmutableArray

  arr = [10, 'hoge', :haskell, [1, 'fuga', :nyaa]] << :freeze

  p arr.recursive_bool_check(:frozen?)
end
