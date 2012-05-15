# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Cell
      def initialize(tbl,data,index)
        @tbl = tbl
        @data = data
        @index = index
        @col_span = 1
        @row_span = 1
        @tbl.elements << Plaintext.new(@data)
      end

      def render

      end

    end
  end
end
