# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  class Text
    attr_accessor :str, :size, :styles
    def initialize(str,options)
      @str = str
      @size = options[:size] || 10
      @styles = options[:styles]
    end
  end
end