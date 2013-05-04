# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

#require 'rtf'
#module Wizport
#  module Document
#    class Rtf
#      def initialize
#        @rtf = RTF::Document.new(RTF::Font.new(RTF::Font::ROMAN, 'Times New Roman'))
#      end
#
#      def text(txt)
#        @rtf.paragraph << txt
#      end
#
#      def table(rows)
#        r = rows.length
#        c = rows.first && rows.first.length
#        tbl = @rtf.table r, c
#        rows.each_index do |row|
#          rows[row].each_index do |col|
#            tbl[row][col] << rows[row][col].to_s
#          end
#        end
#        tbl
#      end
#
#      def save(file)
#        File.open(file, 'w') { |file| file.write(@rtf.to_rtf) }
#      end
#    end
#  end
#end