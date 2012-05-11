# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Tag < Element

      def initialize(name,value = nil)
        @name = name
        @value = value
        @ctrl = @name.to_s + @value.to_s
      end

      def to_rtf
        "\\#{@ctrl}"
      end

    end
  end
end
