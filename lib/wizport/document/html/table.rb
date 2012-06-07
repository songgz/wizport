# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Html
    class Table < Element
      def initialize(html, rows = [], options = {}, &block)
        super html
        tag 'table',{style:'border:1px solid red;'} do
          tag 'tbody' do
            rows.each do |row|
              add_row row, :headed => options[:headed]
            end
            block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
          end
        end
      end

      private

      def add_row(columns, options = {})
        name = options[:headed] ? 'thread' : 'tr'
        tag name do
          columns.each do |column|
            add_cell column
          end
        end
      end

      def add_cell(column)
        content = column
        if column.is_a?(Hash)
          tag 'td', column.delete(:content), column
        else
          tag 'td', content
        end
      end
    end
  end
end
