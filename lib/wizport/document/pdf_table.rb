# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Document
    class PdfTable
      attr_accessor :rows
      def initialize(rows = nil,&block)
        @rows = rows || []
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def row(cells)
        @rows << cells
      end
    end
  end
end

