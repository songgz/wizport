# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "../../../spec/spec_helper"

describe Wizport::Rtf::Document do

  it "a simple example of Rtf" do
    rtf = Wizport::Rtf::Document.new
    rtf.text "hello sgz"
    rtf.table [[1,1,1,""],[1,1,1,2],[1,1,1,3]]
    rtf.save('c:/r.rtf')

  end
end