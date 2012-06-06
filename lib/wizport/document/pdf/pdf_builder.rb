# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "stringio"
module Wizport
  module Pdf
    class PdfBuilder
      include Wizport::Visitor

      def initialize
        @pdf = StringIO.new
      end

      visit Document do |obj|
        xref = XRefTbl.new(obj.objs.size)
        @pdf << "%PDF-1.4\n"
        obj.objs.each do |o|
          o.accept(self)
          xref.add(@pdf.pos)
        end
        xref_pos = @pdf.pos
        @pdf << xref.to_s
        @pdf << "trailer <<\n"
        @pdf << "/Size #{obj.objs.size}\n"
        @pdf << "/Root #{obj.objs.first}\n"
        @pdf << ">>\n"
        @pdf << "startxref\n"
        @pdf << "#{xref_pos}\n"
        @pdf << "%%EOF\n"
      end

      visit Catalog do |obj|
        @pdf << "#{obj.id} #{obj.ver} obj <<\n"
        obj.dicts.each do |k, v|
          @pdf << "#{k} #{v.to_s}\n"
        end
        @pdf << ">>endobj\n"
      end

      visit Pages do |obj|
        @pdf << "#{obj.id} #{obj.ver} obj <<\n"
        obj.dicts.each do |k, v|
          @pdf << "#{k} #{v.to_s}\n"
        end
        @pdf << ">>endobj\n"
      end

      visit Page do |obj|
        @pdf << "#{obj.id} #{obj.ver} obj <<\n"
        obj.dicts.each do |k, v|
          @pdf << "#{k} #{v.to_s}\n"
        end
        @pdf << ">>endobj\n"
      end

      def to_pdf
        @pdf.string
      end
    end
  end
end
