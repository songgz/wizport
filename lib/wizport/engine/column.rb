# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  class Column
    TYPE = {default:0, image:1}
    ALIGN = {}

    attr_accessor :title, :name, :width, :clazz

    def initialize(options = {})
      @title = options.delete(:title) || ""
      @name = options.delete(:name) || ""
      @width = options.delete(:width) || 50
      @clazz = options.delete(clazz) || Object

    end

  end
end