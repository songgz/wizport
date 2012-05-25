# encoding: utf-8

require "../../../../spec/spec_helper"

describe Wizport::Rtf::Document do

  it "a simple example of Rtf" do
      rtf = Wizport::Rtf::Document.new
      rtf.text "学生综合素质评价"
      rtf.table [[1,1,1,"综合"],[1,1,1,2],[1,1,1,3]]
      rtf.save('c:/r.rtf')
  end
end