# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  class PdfBuilder
    def initialize(documentor)
      @doc = documentor
      @pdf = Prawn::Document.new
      @pdf.font "#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf"
      build
    end

    def build
      @doc.elements.each do |el|
        case el.class.to_s
          when "Wizport::Text"
            build_text(el)
          when "Wizport::Table"
            build_table(el)
        end
      end
    end

    def build_text(txt)
      @pdf.text txt.str
    end

    def build_table(tbl)
      @pdf.table tbl.rows.map{|row| convert_row(row)}
    end

    def convert_row(row)
      row.map do |r|
        if r.is_a?(Wizport::Cell)
          {:content => r.data,:rowspan => 1}
        else
          r
        end
      end
    end

    def to_pdf
      @pdf.render
    end

    def save(file)
      @pdf.render_file(file)
    end

  end
end