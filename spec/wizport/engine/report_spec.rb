require "../../../spec/spec_helper"

describe "report" do

  it "a simple example" do
    rpt = Wizport::Report.new()
    rpt.source = [{id:"id1",name:"sgz1",pid:1},{id:"id3",name:"sgz3",pid:1},{id:"id2",name:"sgz2",pid:2}]
    rpt.columns = [
        Wizport::Column.new({:title => "ID",:name => "id",:pid=>1}),
        Wizport::Column.new({:title => "Name",:name => "name",:pid=>2})
    ]
    rpt.sections << Wizport::Section.new({:title => "Cat",:group => "pid"})
    rpt.save('c:/rpt.pdf')

  end
end