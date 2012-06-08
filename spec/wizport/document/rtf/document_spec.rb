# encoding: utf-8

require "../../../../spec/spec_helper"

describe Wizport::Rtf::Document do

  it "a simple example of Rtf" do
      rtf = Wizport::Rtf::Document.new do
        text "学生综合素质评价"
        table [[1,{content:'1',colspan:2}],[3,{content:'4',rowspan:2,colspan:2}],[11]] do
          add_row [1,1,1]
        end
      end

      rtf.save('c:/r.rtf')

  end
end