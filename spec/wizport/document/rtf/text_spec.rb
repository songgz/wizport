require "spec_helper"


describe Wizport::Rtf::Text do

  it "a instance of text" do
    t = Wizport::Rtf::Text.new
    t.size = 88
    p t.elements

    t.should_not nil


  end
end