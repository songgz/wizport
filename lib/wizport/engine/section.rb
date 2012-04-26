# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
class Section
  attr_accessor :group, :title, :sub

  def initialize(options)
    @group = options[:group]
    @title = options[:title]
  end

end
end