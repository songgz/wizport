# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Text < Group
      ALIGN_MAP = {left:'ql',center:'qc'}
      def initialize(txt, styles = {:align => :left,:font_size => 48})
        super()
        elements << Command.new(:pard)
        elements << Command.new(ALIGN_MAP[styles[:align]]) if styles[:align]
        elements << Command.new(:fs,styles[:font_size]) if styles[:font_size]
        elements << Plaintext.new(txt)
        elements << Command.new(:par)
      end
    end
  end
end
