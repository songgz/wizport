# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "stringio"
module Wizport
  module Rtf
    class Document < Element
      def initialize(file = nil, &block)
        super
        group do
          cmd :rtf, 1
          cmd :ansi
          cmd :ansicpg, 2052
          cmd :deff, 0
          group do
            cmd :fonttbl
            group do
              delimit do
                cmd :f, 0
                cmd :fcharset, 0
                write " Courier"
              end
            end
          end
          group do
            cmd :colortbl
            delimit
            delimit do
              cmd :red, 0
              cmd :green, 0
              cmd :blue, 0
            end
            delimit do
              cmd :red, 255
              cmd :green, 0
              cmd :blue,0
            end
          end
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

      #creates a new table.
      def table(rows = [],options = {}, &block)
        Wizport::Rtf::Table.new(self, rows, options, &block)
      end

      def image

      end

      def line_break
        cmd :par
      end

      #writes a page interruption (new page)
      def page_break
        cmd :page
      end


      def to_s

      end

      def to_doc
        @rtf.string
      end

      def save(file)
        File.open(file, 'w') { |file| file.write(to_doc) }
      end

    end
  end
end