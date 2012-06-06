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
          temp = 0
          if columns[i].is_a?(Hash)
            temp += columns[i][:colspan].to_i
          else
            temp += 1
          end

          if row_spanned?(temp)
            @cells << Cell.new("",self)
          end
          @cells << Cell.new(columns[i],self)
          #if columns[i].is_a?(Hash)
          #  if columns[i][:colspan] && columns[i][:colspan] > 1
          #    (columns[i][:colspan]-1).times do
          #      @cells << Cell.new("",self)
          #    end
          #  end
          #end
        end
        @table.elements << Command.new(:row)
      end

      def row_spanned?(c_i)
        rs = 0

        (@index).times do |r|
          t = 0
          @table.rows[r].cells.each do |c|
            t += c.colspan
            if t == c_i + 1
              rs += c.rowspan
            end
          end

          #rs += @table.rows[r].cells[c_i].rowspan if @table.rows[r].cells[c_i] && @table.rows[r].cells[c_i].rowspan > 1
        end
        rs >= (@index + 1)
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
