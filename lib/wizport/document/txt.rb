# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Document
    class Txt
      def initialize()
        @doc = []
      end

      def text(txt)
        @doc << txt << "\n"
      end

      def table(rows)

      end


    end
  end
end