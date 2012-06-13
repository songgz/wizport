# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "stringio"
module Wizport
  module Rtf
    class Document < Element
      def initialize(file = nil, &block)
        @rtf = StringIO.new
        group do
          cmd :rtf, 1
          cmd :ansi
          cmd :ansicpg, 2052
          block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
        end
        save file if file
      end

      def write(txt)
        @rtf << txt
      end

      def text(str, styles = {:align => :left})
        Wizport::Rtf::Text.new(self, str, styles)
      end

      def table(rows = [],options = {}, &block)
        Wizport::Rtf::Table.new(self, rows, options, &block)
      end


      def to_s

      end

      def to_rtf
        @rtf.string
      end

      def save(file)
        File.open(file, 'w') { |file| file.write(to_rtf) }
      end

    end
  end
end

if __FILE__ == $0
  #rtf = Wizport::Rtf::Document.new do
  #  text "学生综合素质评价"
  #  table [[1, {content :'1', colspan: 2}], [3, {content :'4', rowspan: 2, colspan: 2}], [1]]
  #end
  #rtf.save('c:/r.rtf')
end

