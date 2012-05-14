# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com


module Wizport
  module Rtf
    class Group < Element
      attr_accessor :elements
      def initialize()
        @elements = []
      end

      def add(element)
        @elements << element
      end

      def to_s

      end

    end
  end
end
