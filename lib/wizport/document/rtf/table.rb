# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Table < Element
      DEFAULT_COLUMN_WIDTH = 40

      def initialize(rtf, rows = [], options = {}, &block)
        super(rtf)
        @row_spans = {}
        @column_widths = options[:column_widths] || DEFAULT_COLUMN_WIDTH
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
        @right_width = 0
        cells.each do |cell|
          add_cell cell
        end
        cmd :row
      end

      def add_cell(cell,merge = false)
        add_cell "",true if !merge && row_spanned?(@col_offset)
        if cell.is_a?(Hash)
          rowspan = cell[:rowspan]
          colspan = cell[:colspan]
          content = cell[:content]
          @row_spans[@col_offset] = cell if cell[:rowspan]
        end
        colspan = colspan || 1
        rowspan = rowspan || 1
        content = content || cell

        if rowspan > 1
          v_merge = :gf
        elsif row_spanned? @col_offset
          v_merge = :rg
          @row_spans[@col_offset][:rowspan] -= 1
          colspan = @row_spans[@col_offset][:colspan] || colspan
        end
        colspan.times do
          @right_width += column_width(@col_offset)
          @col_offset += 1
        end

        cmd :celld
        cmd :clvmgf if v_merge == :gf
        cmd :clvmrg if v_merge == :rg
        cmd :cellx, @right_width
        txt content
        cmd :cell

        add_cell "",true if  row_spanned?(@col_offset)
      end

      def row_spanned?(offset)
        @row_spans[offset] && @row_spans[offset][:rowspan].to_i > 1
      end

      def column_width(offset)
        return 20 * (@column_widths[offset] || DEFAULT_COLUMN_WIDTH) if @column_widths.is_a?(Hash)
        @column_widths * 20
      end

    end
  end
end
