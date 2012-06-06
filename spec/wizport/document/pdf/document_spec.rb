# encoding: utf-8

require "../../../../spec/spec_helper"

describe Wizport::Pdf::Document do

  it "a simple example of pdf" do
    pdf = Wizport::Pdf::Document.new

    pdf.save('c:\t.pdf')
    pdf.to_pdf.each_line do |line|
      p line
    end
  end

  it "ss" do
    str = StringIO.new
    str << "hello"
    p str.pos
    printf("%010d", str.pos)
  end
end