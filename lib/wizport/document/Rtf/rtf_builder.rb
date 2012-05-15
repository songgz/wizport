# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class RtfBuilder
      include Wizport::Visitor

      def initialize
        @rtf = StringIO.new
      end

      visit Group do |element|
        @rtf << '{'
        element.elements.each do |el|
          el.accept(self)
        end if element.is_a?(Wizport::Rtf::Group)
        @rtf << '}'
      end

      visit Command do |element|
        @rtf << '\\'
        @rtf << element.ctrl
      end

      visit Plaintext do |element|
        @rtf << ' '
        @rtf << element.txt
      end

      def to_rtf
        @rtf.string
      end

    end
  end
end
