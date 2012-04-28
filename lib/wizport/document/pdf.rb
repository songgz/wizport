# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Document
    class Pdf
      def initialize
        @pdf = Prawn::Document.new
        @pdf.font "#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf"
      end

      def text(txt)
        @pdf.text txt
      end

      def table(rows,options={}, &block)
        @pdf.table(rows,options.merge({:width => @pdf.bounds.width}), &block)
      end

      def make_table(rows)
        @pdf.make_table(rows,:width => @pdf.bounds.width)
      end

      def save(file)
        @pdf.render_file(file)
      end
    end
  end
end