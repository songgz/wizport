# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Row
      attr_accessor :table, :cells, :index
      def initialize(columns,tbl = nil)
        @table = tbl
        @cells = []
        @index = @table.rows.size

        @table.elements << Command.new(:trowd)
        @table.elements << Command.new(:trautofit1)
        @table.elements << Command.new(:intbl)
        columns.each_index do |i|
          @cellx_index = nil
          @cellt_index = nil
          @cells << Cell.new(columns[i],self)
        end
        @table.elements << Command.new(:row)
      end

      def cellx_command(cmd)
        @cellx_index = @cellx_index || @table.elements.size
        @table.elements.insert @cellx_index, cmd
        @cellx_index += 1
      end

      def cellt_command(cmd)
        @cellt_index = @cellt_index || @table.elements.size
        @table.elements.insert @cellt_index, cmd
        @cellt_index += 1
      end

    end
  end
end
