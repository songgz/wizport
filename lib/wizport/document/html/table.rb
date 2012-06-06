# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Html
    class Table < Element
      def initialize(html,rows = [],options = {},&block)
        super html
        @html.write '<table><tbody>'
        rows.each do |row|
          add_row row, :headed => options[:headed]
        end
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
        @html.write '</tbody></table>'
      end

      def add_row(columns,options = {})
        tag_name = options[:headed] ? 'thread' : 'tr'
        @html.write '<'
        @html.write tag_name
        @html.write '>'
        columns.each do |column|
          add_cell column
        end
        @html.write '</'
        @html.write tag_name
        @html.write '>'
      end

      def add_cell(column)
        if column.is_a?(Hash)
          colspan = column[:colspan]
          rowspan = column[:rowspan]
          column = column[:content]
          @html.write '<td'
          @html.write " colspan='#{colspan}'" if colspan
          @html.write " rowspan='#{rowspan}'" if rowspan
          @html.write '>'
        else
          @html.write '<td>'
        end
        @html.write column
        @html.write '</td>'
      end
    end
  end
end
