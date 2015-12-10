require "assign/version"

module Assign
  class Assignable
    def initialize(obj)
      @target = obj
    end

    def method_missing(m, *args)
      m = @target.respond_to?(m) ? m : m.to_s.chomp('=')
      @target.__send__(m, *args)
    end

    def respond_to_missing?(m)
      @target.respond_to?(m.to_s.chomp('='))
    end
  end

  module ::Kernel
    def assign
      Assignable.new(self)
    end
  end
end
