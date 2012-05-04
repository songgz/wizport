# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Document
      def initialize(&block)
        @rtf = []
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def cmd(command, param = nil, &block)
        @rtf << '{'
        @rtf << command
        if param
          @rtf << ' '
          @rtf << param
        end
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
        @rtf << '}'
      end

      def to_s
        @rtf.join('')
      end

    end
  end
end

if __FILE__ == $0
  d = Wizport::Rtf::Document.new do
    cmd('\info') do
      cmd('\title', 'dkalfasf')
    end
  end

  p d


end

