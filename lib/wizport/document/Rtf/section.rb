# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "stringio"
module Wizport
  module Rtf
    class Section
      def initialize(io = nil)
        @io = io || StringIO.new
      end

      def sc(command, param = nil, &block)
        @parent << '{'
        @parent << command
        if param
        @parent << ' '
        @parent << param
        end
        block.call(self) if block_given?
        @parent << '}'
      end



      def to_s
        @parent.join('')
      end

    end
    s = Section.new
    s.sc('\info') do |d|
      d.sc('\title','dkalfasf')
    end

    p s

  end
end
