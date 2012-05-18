# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Cell
      attr_accessor :col_span, :row_span
      def initialize(data,row = nil)
        @row = row
        @index = @row.cells.size
        @col_span = 1
        @row_span = 1
        @text = ""
        if data.is_a?(Hash)
          @col_span = data[:col_span] if data[:col_span]
          @row_span = data[:row_span] if data[:row_span]
          @text = data[:text]
        else
          @text = data
        end

        @row.cellx_command Command.new(:clvmgf) if @row_span > 1
        @row.cellx_command Command.new(:clvmrg) if row_spanned?
        @row.cellx_command Command.new(:cellx, (@index+1)*1000)
        @row.cellt_command Plaintext.new(@text)
        @row.cellt_command Command.new(:cell)
      end

      def col_spanned?
        @index.times do |c|
          return true if @row.cells[c].col_span + c > @index
        end
        return false
      end

      def row_spanned?
        @row.index.times do |r|
          return true if @row.table.rows[r].cells[@index].row_span + r > @row.index
        end
        return false
      end



    end
  end
end
