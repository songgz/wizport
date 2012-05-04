# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

require "../../../spec/spec_helper"
require "mongoid"

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("godfather")
end

class Person
  include Mongoid::Document
  field :name
  field :sex
  field :tel
end

#Person.delete_all
#Person.create({name:"sgz1",sex:"男",tel:"1223121"})
#Person.create({name:"sgz2",sex:"男",tel:"852471"})
#Person.create({name:"sgz3",sex:"女",tel:"963952"})

describe Wizport::Report do

  it "a simple example of report" do
    rpt = Wizport::Report.new(:title => "人员性别统计表",:source => Person.all)
    rpt.column({:title => "姓名",:name => :name})
    rpt.column({:title => "性别",:name => :sex})
    rpt.column({:title => "电话",:name => :tel})
    rpt.section({:title => "性别",:group => :sex})
    rpt.save('c:/rpt.rtf')
  end

end