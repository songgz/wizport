# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Cell
      attr_accessor :colspan, :rowspan

      def initialize(data, row = nil)
        @row = row
        @index = @row.cells.size
        @colspan = 1
        @rowspan = 1
        @content = data
        #:content => "2x1", :colspan
        if data.is_a?(Hash)
          @colspan = data[:colspan] if data[:colspan]
          @rowspan = data[:rowspan] if data[:rowspan]
          @content = data[:content]
        end

        #unless col_spanned?
          @row.table.elements << Command.new(:celld)
          @row.table.elements << Command.new(:clvmgf) if @rowspan > 1
          @row.table.elements << Command.new(:clvmrg) if row_spanned?
          @row.table.elements << Command.new(:cellx, (col_spanned)*1000)
          @row.table.elements << Plaintext.new(@content.to_s)
          @row.table.elements << Command.new(:cell)
        #end

        #@row.cellx_command Command.new(:clvmgf) if @row_span > 1
        #@row.cellx_command Command.new(:clvmrg) if row_spanned?
        #@row.cellx_command Command.new(:cellx, (@index+@col_span)*1000)
        #@row.cellt_command Plaintext.new(@text)
        #@row.cellt_command Command.new(:cell)
      end

      def col_spanned?
        col_spanned >= (@index + 1) && colspan == 1
      end

      def col_spanned
        cols = 0
        (@index).times do |c|
          cols +=  @row.cells[c].colspan
        end
        cols += colspan
      end


      def row_spanned?
        @row.row_spanned?(col_spanned - colspan)
        #@row.index.times do |r|
        #  return true if  @row.table.rows[r].cells[@index] && @row.table.rows[r].cells[@index].rowspan + r > @row.index
        #end
        #return false
      end


    end
  end
end
