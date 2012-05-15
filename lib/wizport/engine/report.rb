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
      if sections.size > 0
      sections.each do |section|
        builder.section(section)
      end
      else
        builder.grid
      end
      builder.footer
      builder
    end

    def save(file)
      build(:pdf).save(file)
    end

  end
end