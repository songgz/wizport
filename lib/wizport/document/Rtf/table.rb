# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Table < Element

      def initialize(rtf, rows = [], options = {}, &block)
        super(rtf)
        @row_spans = {}
        rows.each_index do |index|
          add_row rows[index]
        end
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def add_row(cells = [])
        cmd :trowd
        cmd :trautofit1
        cmd :intbl
        @col_offset = 1
        cells.each do |cell|
          if row_spanned? @col_offset
            add_cell ""
            add_cell cell
          elsif row_spanned? @col_offset + 1
            add_cell cell
            add_cell ""
          else
            add_cell cell
          end
        end
        cmd :row
      end

      def add_cell(cell)
        if cell.is_a?(Hash)
          rowspan = cell[:rowspan]
          colspan = cell[:colspan]
          content = cell[:content]
          @row_spans[@col_offset] = cell if cell[:rowspan]
        end
        colspan = colspan || 1
        rowspan = rowspan || 1
        content = content || cell

        cmd :celld
        if rowspan > 1
          cmd :clvmgf
          @col_offset += colspan
        elsif row_spanned? @col_offset
          cmd :clvmrg
          @row_spans[@col_offset][:rowspan] -= 1
          @col_offset += row_spans_with_colspan
        else
          @col_offset += colspan
        end
        cmd :cellx, (@col_offset - 1)* 2000
        txt content
        cmd :cell
      end

      def row_spanned?(offset)
        @row_spans[offset] && @row_spans[offset][:rowspan].to_i > 1
      end

      def row_spans_with_colspan
        return @row_spans[@col_offset][:colspan] || 1
      end

    end
  end
end
