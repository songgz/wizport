# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  class Table
    attr_accessor :rows
    def initialize(data = [], options = {})
      @rows = data
      @options = options
    end

    def row(data = [],options = nil)
      @rows << data
      #cells = data.map {|d| Wizport::Cell.new(d)}
      #@rows << Wizport::Row.new(cells)
    end

    #def rows(index = nil)
    #  index ? @rows[index] : @rows
    #end

    def cell(r,c)
      @rows[r][c]
    end

    def load(data)
      data.each do |r|
        row(r)
      end
    end
  end

  #class Row
  #  def initialize(cells = [],options = {})
  #    @cells = cells.is_a?(Array) ? cells : []
  #  end
  #
  #  def <<(cell)
  #    @cells << cell
  #  end
  #
  #  def push(cell)
  #    @cells << cell
  #  end
  #
  #  def [](index)
  #    @cells[index]
  #  end
  #end

  class Cell
    attr_accessor :data
    def initialize(data,options = {})
      @data = data
      @merger = nil
    end

    def merge(r,c)
      @merger = [r,c]
    end

    def to_s
      @data.to_s
    end
  end
end