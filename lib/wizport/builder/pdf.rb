# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Builder
    class Pdf
      def initialize(report)
        @rpt = report
        @pdf = Wizport::Document::Pdf.new
      end

      def header
        @pdf.text @rpt.title
      end

      def grid
        tbl = []
        tbl << @rpt.columns.map {|c| c.title }
        @rpt.source.all.each do |obj|
          tbl << @rpt.columns.map {|c| obj.send(c.name)}
        end
        @pdf.table tbl
      end

      def section(section)
        @tbl = []
        @rpt.source.groups(section).each do |group|
          section_header(section,group)
          section_body(section,group)
          section_footer(section,group)
        end
        @pdf.table @tbl
      end

      def section_header(section,group)
        @tbl << ["#{section.title}:#{group}"]
      end

      def section_body(section,group)
        rows = []
        rows << @rpt.columns.map {|c| c.title }
        objs = @rpt.source.filter({section.group => group})
        objs.each do |obj|
          rows << @rpt.columns.map {|c| obj.send(c.name)}
        end
        @tbl << [@pdf.make_table(rows)]
      end

      def section_footer(section,group)

      end

      def footer

      end

      def save(file)
        @pdf.save(file)
      end

    end
  end
end
