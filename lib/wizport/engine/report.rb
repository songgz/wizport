# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  class Report
    attr_accessor :title, :subtitle, :columns, :sections, :source

    def initialize(options = {})
      @title = options.delete(:title) || ""
      @subtitle = options.delete(:subtitle) || ""
      @columns = options.delete(:columns) || []
      @sections = options.delete(:sections) || []
      @source = Wizport::MongoidSource.new(options.delete(:source))

    end

    def column(options)
      @columns << Wizport::Column.new(options)
    end

    def section(options)
      @sections << Wizport::Section.new(options)

    end

    def add_column(column)
      @columns << column
    end

    def build(format = :pdf)
      builder = Wizport::Builder::Pdf.new(self)
      builder.header
      sections.each do |section|
        builder.section(section)
      end
      builder.footer
      builder
    end

    #def build_sections
    #  @tbl = Wizport::Table.new
    #  @doc.add(@tbl)
    #  @sections.each do |section|
    #    build_section(section)
    #  end
    #end
    #
    #def build_section(section)
    #  values = section_values(section)
    #  values.each do |v|
    #    build_section_header(section, v)
    #    build_section_body(section, v)
    #  end
    #end
    #
    #def build_section_header(section, value)
    #  @tbl.row ["#{section.title}:#{value}"]
    #end
    #
    #def build_section_body(section, value)
    #  tbl = Wizport::Table.new
    #  tbl.row @columns.map { |col| col.title }
    #  rs = @source.select() { |r| r[:pid] == value }
    #  rs.each do |record|
    #    tbl.row @columns.map {|col| record[col.name.to_sym].to_s }
    #  end
    #  @tbl.row [tbl]
    #end
    #
    #def section_values(section)
    #  @source.map { |i| i[section.group.to_sym] }.uniq
    #end

    def save(file)
      build(:pdf).save(file)
    end

  end
end