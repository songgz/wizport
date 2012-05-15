# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Table < Group
      attr_accessor :rows, :cells
      def initialize(rows = [], &block)
        super()
        @rows = []
        @cells = {}
        rows.each do |r|
          row r
        end
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def row(r = [])
        @rows << Row.new(self,r)
      end

      def [](r,c)
        @cells["#{r},#{c}"]
      end

      def [](r,c,v)
        @cells["#{r},#{c}"] = v
      end
    end
  end
end
