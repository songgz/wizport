# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Command < Element
      attr_reader :ctrl

      def initialize(name,value = nil)
        @name = name
        @value = value
        @ctrl = @name.to_s + @value.to_s
      end

    end
  end
end
