# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Text < Group
      ALIGN_MAP = {left:'ql',center:'qc'}

      def initialize(txt = '', styles = {})
        super()
        styles = {:align => :left,:size => 24}.merge(styles)
        elements << Command.new(:pard)
        elements << @align = Command.new(ALIGN_MAP[styles[:align]])
        elements << @size = Command.new(:fs,styles[:size])
        elements << @txt = Plaintext.new(txt)
        elements << Command.new(:par)
      end

      def size=(value)
        @size.value = value
      end

      def size
        @size.value
      end

      def align=(value)
        @align.name = ALIGN_MAP[styles[value]]
      end

      def align
        ALIGN_MAP.invert[@align.name]
      end

    end
  end
end
