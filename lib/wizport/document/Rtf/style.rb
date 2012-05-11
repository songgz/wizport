# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Style
      STYLES = {
          :text_align => {
            :map =>{
              :left => {:prefix =>'\ql ', :suffix => nil},
              :right => {:prefix =>'\qr ', :suffix => nil},
              :center => {:prefix =>'\qc ', :suffix => nil},
              :justify => {:prefix =>'\qj ', :suffix => nil},
              :distribute => {:prefix =>'\qd ', :suffix => nil}
            },
            :wrap => proc {|t,v|
              "#{p};#{t};#{s}"
            }
          },
          :font_size => {:prefix => :fs, :suffix => nil}
          # "\\fs#{}"
      }

      def initialize(txt)
        @txt = txt || ''
      end

      def self.text(key,value)
        Tag.new(@@text_styles[key][value])
      end

      def wrap(style)
        STYLES[style.key]
          #suffix = STYLES[key][value][:suffix]
          #suffix = "\\#{suffix}" unless suffix.nil?
          #txt = "\\#{STYLES[key][value][:prefix]} #{txt} #{suffix}"
          txt = "#{STYLES[key][:map][value][:prefix]}#{txt}#{STYLES[key][:map][value][:suffix]}"

      end
    end
  end
end
