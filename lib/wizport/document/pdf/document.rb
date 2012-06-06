# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Pdf
    class Document < Element
      attr_reader :objs
      def initialize
        @objs = []
        @objs << @catalog = Catalog.new(make_id, 0)
        @objs << @pages = Pages.new(make_id, 0)
        @catalog.dict '/Pages', @pages
        @objs << @page = Page.new(make_id, 0)
        @page.dict '/Parent', @pages
      end

      def make_id
        @objs.size + 1
      end

      def to_pdf
        builder = PdfBuilder.new
        accept(builder)
        builder.to_pdf
      end

      def save(file)
        File.open(file, 'w') { |file| file.write(to_pdf) }
      end

    end
  end
end
