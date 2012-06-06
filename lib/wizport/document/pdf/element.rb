# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Pdf
    class Element
      include Wizport::Visitable
      attr_reader :id, :ver, :dicts
      def initialize(id = nil,ver = 0, &block)
        @id = id
        @ver = ver
        @dicts = {}
        @streams = {}
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def type

      end

      def parent

      end

      def dict(k, v)
        @dicts[k] = v
      end

      def stream(k, v)
        @streams[k] = v
      end

      def to_s
        "#{id} #{ver} R"
      end
    end
  end
end
