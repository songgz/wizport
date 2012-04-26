require "../../../spec/spec_helper"

describe "table" do

  it "row" do
    t = Wizport::Table.new
    t.row [3,5]

    p t.rows

  end
end