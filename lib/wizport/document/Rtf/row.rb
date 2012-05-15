# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Row
      def initialize(tbl, columns)
        @tbl = tbl
        @cells = []
        @index = @tbl.rows.size
        @tbl.elements << Command.new(:trowd)
        @tbl.elements << Command.new(:trautofit1)
        @tbl.elements << Command.new(:intbl)
        @tbl.elements << Command.new(:celld)

        columns.each_index do |i|
          @tbl.elements << Command.new(:cellx, i*1000)
        end
        columns.each_index do |i|
          @cells << @tbl.cells["#{@index},#{i}"] = Cell.new(@tbl,columns[i], i)
          @tbl.elements << Command.new(:cell)
        end
        @tbl.elements << Command.new(:row)
      end
    end
  end
end
