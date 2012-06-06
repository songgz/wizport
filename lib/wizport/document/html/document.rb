# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "stringio"
module Wizport
  module Html
    class Document
      def initialize(&block)
        @html = StringIO.new
        @html << "<div class='rpt'>"
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def text(txt)
        Wizport::Html::Text.new(self,txt)
      end

      def table(rows = [], &block)
        Wizport::Html::Table.new(self, rows, &block)
      end

      def write(txt)
        @html << txt
      end

      def to_html
        @html << '</div>'
        @html.string
      end

      def render

      end

      def save(file)
        File.open(file, 'w') { |file| file.write(to_html) }
      end
    end
  end
end
