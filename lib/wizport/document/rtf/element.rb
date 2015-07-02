# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Element
      def initialize(rtf = nil)
        @rtf = rtf || StringIO.new
      end

      def cmd(name, value = nil)
        @rtf.write '\\'
        @rtf.write name
        @rtf.write value if value
      end

      def txt(str)
        str = str.to_s
        str = str.gsub("{", "\\{").gsub("}", "\\}").gsub("\\", "\\\\")
        str = str.encode("UTF-16LE", :undef=>:replace).each_codepoint.map {|n| n < 128 ? n.chr : "\\u#{n}\\'3f"}.join('')
        @rtf.write ' '
        @rtf.write str
      end

      def group
        @rtf.write '{'
        yield if block_given?
        @rtf.write '}'
      end

      def delimit
        yield if block_given?
        @rtf.write ';'
      end
    end
  end
end
