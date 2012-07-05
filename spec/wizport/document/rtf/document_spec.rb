# encoding: utf-8

require "../../../../spec/spec_helper"

describe Wizport::Rtf::Document do

  it "a simple example of Rtf" do
      rtf = Wizport::Rtf::Document.new do
        text "学生综合素质评价", :align => :center, 'font-size' => 48
        page_break
        text "ss"
        table [[{content:'e',rowspan:4},{content:'4',rowspan:4},1,{content:'1',colspan:2}],
               [{content:'4',rowspan:3,colspan:2},8],
               [11]],column_widths:{1=>100,2 => 100,3 => 50,4 => 50,5 => 50} do
          add_row [1]
        end

        #table [["姓名", "person.name", "性别", {content: "{Core::Person::GENDER_TYPE[person.gender]}", colspan: 3}, "出生日期", {content: "nil}", colspan: 2}, {content: "一寸照片", colspan: 2, rowspan: 3}],
        #      ["民族", {content: "{Core}", colspan: 2}, "入队(团)时间", {content: '', colspan: 5}],
        #      ["家庭住址", {content: "person", colspan: 8}]]


        #table [["入学身高", "", "体重", "", "视力", "左", "", "右", "", "血型", ""],
        #      [{content:"简历", rowspan: 3}, {content:"日期", colspan: 2}, {content: "升(入)学前所在学校", colspan: 6}, {content: "担任何职务", colspan: 2}],
        #      [{content:"", colspan: 2}, {content:"", colspan: 6}, {content:"", colspan: 2}]]
      end

      rtf.save('c:/r.rtf')

  end
end