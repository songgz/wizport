# encoding: utf-8

require "spec_helper"

describe Wizport::Html::Document do

  it "should do something" do
    html = Wizport::Html::Document.new do
     text "报表",'text-align' => :center
     table [[1,2,3]] do
      add_row [4,{content:'ss',colspan:2}]
     end
    end

    p html.to_doc
    html.save('c:\h.html')


  end
end