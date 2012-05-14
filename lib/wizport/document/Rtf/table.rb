# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Table < Group
      def initialize(rows)
        super()
        rows.each do |r|
          row r
        end
      end

      def row(r = [])
        elements << Command.new(:trowd)
        elements << Command.new(:trautofit1)
        elements << Command.new(:intbl)
        r.each_index do |i|
          elements << Command.new(:cellx, i)
        end
        r.each_index do |i|
          elements << Plaintext.new(r[i])
          elements << Command.new(:cell)
        end

        elements << Command.new(:row)
      end
    end
  end
end
