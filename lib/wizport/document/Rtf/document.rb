# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "../../visitor"
require "./element"
require "./plaintext"
require "./command"
require "./group"
require "./text"
require "./table"
require "./rtf_builder"
require "./style"

module Wizport
  module Rtf
    class Document < Group
      def initialize(file = nil, &block)
        super()
        elements << Command.new(:rtf, 1)
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
        save file if file
      end

      #styles = {align,font,font_size,color }
      def text(txt, styles = {:align => :left})
        elements << Text.new(txt,styles)
      end

      def table(rows)
        elements << Table.new(rows)

      end

      def colors(colours = ['ffffff'])


      end

      def style(txt, styles)

      end


      def method_missing(id, *args, &block)
        cmd id, *args, &block
      end

      def to_s

      end

      def to_rtf
        builder = RtfBuilder.new
        accept(builder)
        builder.to_rtf
      end

      def save(file)
        File.open(file, 'w') { |file| file.write(to_rtf) }
      end

    end
  end
end

if __FILE__ == $0
  d = Wizport::Rtf::Document.new('c:/file.rtf') do
    text "我们", :align => :center, :font_size => 48
    text "春风不度玉门关", :align => :left, :font_size => 24
    table [[1,1,1,1],[1,1,1,2],[1,1,1,3]]

  end

  p d.to_rtf


end

