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
      @source = options.delete(:source)
      @doc = Wizport::Documentor.new
      @tbl = Wizport::Table.new
    end

    def add_column(column)
      @columns << column
    end

    def build
      build_sections
    end

    def build_sections
      @doc.add(@tbl)
      @sections.each do |section|
        build_section(section)
      end
    end

    def build_section(section)
      values = section_values(section)
      values.each do |v|
        build_section_header(section, v)
        build_section_body(section,v)
      end
    end

    def build_section_header(section, value)
      @tbl.row [section.title,value]
    end

    def build_section_body(section,value)
      @tbl.row << @columns.map {|col| col.title }
      rs = @source.select() {|r| r[:pid] == value}
      rs.each do |record|
      @tbl.row << @columns.map do|col|
        record[col.name.to_sym].to_s
      end
      end

    end

    def section_values(section)
      @source.map { |i| i[section.group.to_sym] }.uniq
    end

    def save(file)
      build
      #p @tbl.rows
      @doc.save_pdf(file)
    end

  end
end