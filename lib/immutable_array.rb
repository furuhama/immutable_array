require "immutable_array/version"

module ImmutableArray
  class ImmutableArray < Array
    def self.new(size=0, val=nil)
      if size.class == Array
        Array.new(size).recursive_freeze
      else
        # ここで引っかかる
        # given 2, expected 0 となる
        Array.new(size, val).recursive_freeze
      end
    end

    # prototype
    #
    # Usage:
    # [1, 3, 6, 7] << :freeze
    #
    # all elements and itself is frozen
    #
    # and override '<<' operator
    # not to add element destructively
    def <<(arg)
      arg = arg.to_sym if arg.class == String

      self.map(&arg)
      self.send(arg)
    end
  end

  class Array
     # freeze elements recursively
    def recursive_freeze
      self.each { |x|
        if x.class == Array
          x.recursive_freeze
        end

        x.freeze
      }
      self.freeze
    end
  end
end
