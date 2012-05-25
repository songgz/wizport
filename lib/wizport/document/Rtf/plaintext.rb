# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Plaintext < Element
      attr_accessor :txt

      def initialize(txt)
        txt = txt.gsub("{", "\\{").gsub("}", "\\}").gsub("\\", "\\\\")
        txt = txt.encode("UTF-16LE", :undef=>:replace).each_codepoint.map {|n| n < 128 ? n.chr : "\\u#{n}\\'3f"}.join('')
        @txt = txt
      end

    end
  end
end
