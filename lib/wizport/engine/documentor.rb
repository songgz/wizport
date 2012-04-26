# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  class Documentor
    attr_accessor :elements
    def initialize(format = nil)
      @format = format
      @elements = []
    end

    #def self.open(format)
    #  begin
    #    doc = new(format)
    #    block.call(doc) if  block_given?
    #    return doc
    #  rescue Exception => e
    #    p e
    #  ensure
    #    doc.close unless doc.nil?
    #  end
    #end
    def add(element)
      @elements << element
    end

    def text(str,options = {})
      @elements << Wizport::Text.new(str,options)
    end

    def table(data = [],options = {})
      tbl = Wizport::Table.new(data,options)
      @elements << tbl
      tbl
    end

    def save_pdf(file)
      Wizport::PdfBuilder.new(self).save(file)
    end

  end
end