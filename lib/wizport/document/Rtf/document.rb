# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "./element"
require "./text"
require "./tag"
require "./area"
require "./style"

module Wizport
  module Rtf
    class Document < Area
      def initialize(file = nil,&block)
        super()
        elements << Tag.new(:rtf,1)
        @rtf = StringIO.new
        cmd 'rtf1', &block
        save file if file
      end

      def cmd(command, param = nil, &block)
        @rtf << '{'
        @rtf << "\\#{command} "
        if param
          @rtf << param
        end
        block.arity<1 ? self.instance_eval(&block) : block.call(self) if block_given?
        @rtf << '}'
      end

      #styles = {align,font,font_size,color }
      def text(txt, styles = {:text_align => :left})
        #@rtf << '\pard '
        #@rtf << Wizport::Rtf::Style.new(styles).wrap(txt)
        #@rtf << '\par '
        elements << Tag.new(:pard)
        elements << Wizport::Rtf::Text.new(txt)
        elements << Tag.new(:par)
      end

      def colors(colours = ['ffffff'])


      end

      def style(txt,styles)

      end


      def method_missing(id,*args,&block)
        cmd id, *args, &block
      end

      def to_s
        @rtf.string
      end

      def save(file)
        File.open(file, 'w') { |file| file.write(to_rtf) }
      end

    end
  end
end

if __FILE__ == $0
  d = Wizport::Rtf::Document.new('c:/file.rtf') do
    text "我们", :text_align => :center
  end

  p d.to_rtf


end

