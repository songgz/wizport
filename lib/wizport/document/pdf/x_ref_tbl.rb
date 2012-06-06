# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Pdf
    class XRefTbl
      def initialize(count)
        @tbl = StringIO.new
        @tbl << "xref\n0 #{count}\n0000000000 65535 f \n";
      end

      def add(pos, ver = '00000', used = 'n')
        @tbl.printf "%010d #{ver} #{used} \n", pos
      end

      def to_s
        @tbl.string
      end

    end
  end
end
