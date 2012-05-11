# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com


module Wizport
  module Rtf
    class Area < Element
      attr_accessor :elements
      def initialize(elements = [])
        @elements = elements
      end

      def add(element)
        @elements << element
      end

      def to_rtf
        rtf = StringIO.new
        rtf << '{'
        elements.each do |element|
          rtf << element.to_rtf
        end
        rtf << '}'
        rtf.string
      end

      def to_s

      end

    end
  end
end
