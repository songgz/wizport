# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Text < Element
      ALIGN_MAP = {left:'ql',center:'qc'}

      def initialize(rtf, str = '', styles = {})
        super(rtf)
        styles = {:align => :left,:size => 24}.merge(styles)
        group do
          cmd :part
          cmd ALIGN_MAP[styles[:align]]
          cmd :fs,styles[:size]
          txt str
          cmd :par
        end
      end
    end
  end
end
