# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Cell
      def initialize(row,data,index)
        @row = row
        @index = index
        @col_span = 1
        @row_span = 1

        @row.cellx_command Command.new(:celld)
        @row.cellx_command Command.new(:cellx, (index+1)*1000)

        @row.cellt_command @data = Plaintext.new(data)
        @row.cellt_command Command.new(:cell)
      end

    end
  end
end
