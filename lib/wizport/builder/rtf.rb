# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Builder
    class Rtf
      def initialize(report)
        @rpt = report
        @rtf = Wizport::Rtf::Document.new
      end

      def header
        @rtf.text @rpt.title
      end

      def section(section)
        @tbl = []
        @rpt.source.groups(section).each do |group|
          section_header(section, group)
          section_body(section, group)
          section_footer(section, group)
        end
        @rtf.table @tbl
      end

      def section_header(section, group)
        @tbl << ["#{section.title}:#{group}"]
      end

      def section_body(section, group)
        #rows = []
        #rows << @rpt.columns.map { |c| c.title }
        #objs = @rpt.source.filter({section.group => group})
        #objs.each do |obj|
        #  rows << @rpt.columns.map { |c| obj.send(c.name) }
        #end
        #@tbl << [@rtf.make_table(rows)]
      end

      def section_footer(section, group)

      end

      def footer

      end

      def save(file)
        @rtf.save(file)
      end

    end
  end
end
