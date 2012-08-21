# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Text < Element
      ALIGN_MAP = {left:'ql',center:'qc',right:'qr'}
      FONT_MAP = {'font-size' => :fs}

      def initialize(rtf, str = '', styles = {})
        super(rtf)
        styles = {:align => :left,'font-size' => 24}.merge(styles)
        group do
          cmd :pard
          cmd ALIGN_MAP[styles[:align]]
          cmd FONT_MAP[styles['font-size']]
          txt str
          cmd :par
        end
      end
    end
  end
end
