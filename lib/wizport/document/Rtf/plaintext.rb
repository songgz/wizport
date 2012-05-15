# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Plaintext < Element
      attr_reader :txt

      def initialize(txt)
        @txt = txt
      end

    end
  end
end
