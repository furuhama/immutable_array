require "immutable_array/version"

module ImmutableArray
  refine Array do
    # Usage:
    # [1, 3, 6, 7] << :freeze
    #
    # all elements and itself is frozen
    #
    # and override '<<' operator
    # not to add element destructively
    def <<(method_sym)
      # argument should be Symbol class
      raise ArgumentError unless method_sym.is_a?(Symbol)

      # self.map(&arg)
      # self.send(arg)

      self.recursive_exec(method_sym)
    end

    def recursive_exec(method_sym)
      self.each { |element|
        if element.is_a?(Array)
          element.recursive_exec(method_sym)
        else
          element.send(method_sym)
        end
      }

      self.send(method_sym)
    end

    # method for debugging
    def recursive_bool_check(method_sym, ok=true)
      # check for elements recursively
      self.each { |element|
        if element.is_a?(Array)
          element.recursive_bool_check(method_sym, ok)
        else
          return false unless element.send(method_sym)
        end
      }

      # check receiver itself
      return false unless self.send(method_sym)

      # if no false for all elements,
      # return true finally
      return true
    end
  end
end
