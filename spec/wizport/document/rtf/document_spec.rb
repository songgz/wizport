# encoding: utf-8

require "../../../../spec/spec_helper"

describe Wizport::Rtf::Document do

  it "a simple example of Rtf" do
      rtf = Wizport::Rtf::Document.new
      rtf.text "学生综合素质评价"
      rtf.table [[{content:'s',rowspan:3},{content:'s',colspan:2},{content:'s',colspan:2},{content:'s',rowspan:2},"ss"],
                 [1,2,3,4,11,6],
                 [1,2,3,4,11,6],
                 [0,1,2,3,4,11,6]]
      rtf.save('c:/r.rtf')
  end
end