# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Row
      def initialize(tbl,columns)
        @tbl = tbl
        @index = @tbl.rows.size
        @tbl.elements << Command.new(:trowd)
        @tbl.elements << Command.new(:trautofit1)
        @tbl.elements << Command.new(:intbl)
        columns.each_index do |i|
          @tbl.cells["#{@index},#{i}"] = Cell.new(self,columns[i],i)
        end
        @tbl.elements << Command.new(:row)
      end

      def cellx_command(cmd)
        @cellx_index = @cellx_index || @tbl.elements.size
        @tbl.elements.insert @cellx_index, cmd
        @cellx_index += 1
      end

      def cellt_command(cmd)
        @cellt_index = @cellt_index || @tbl.elements.size
        @tbl.elements.insert @cellt_index, cmd
        @cellt_index += 1
      end


    end
  end
end
