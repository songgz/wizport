require "../../../spec/spec_helper"

describe "documentor" do

  it "a simple example f" do
    doc = Wizport::Documentor.new
    doc.text "hello song d"
    doc.table [[1,1,1,1,1,1],[1,1,1,1,1,2],[1,1,1,1,1,3]]
    doc.save_pdf('c:/p.pdf')
  end
end