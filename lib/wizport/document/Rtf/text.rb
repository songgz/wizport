# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Text < Element

      def initialize(txt)
        @txt = txt
      end

      def to_rtf
        " #{@txt}"
      end

    end
  end
end
