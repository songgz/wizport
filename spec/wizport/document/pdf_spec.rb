# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "../../../spec/spec_helper"

describe "My behaviour" do

  it "should do something" do

    pdf = Wizport::Document::Pdf.new
    pdf.text "hello sgz"
    pdf.table([
        ["A", {:content => "2x1", :colspan => 2}, "B"],
        [{:content => "1x2", :rowspan => 2}, "C", "D", "E"],
        [{:content => "2x2", :colspan => 2, :rowspan => 2}, "F"]
      ]) do
      row ["G", "H"]
    end
    pdf.save('c:/p.pdf')
  end
end