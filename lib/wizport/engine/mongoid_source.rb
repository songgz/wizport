# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com


module Wizport
  class MongoidSource
    def initialize(source)
      @source = source
    end

    def groups(section)
      @source.distinct(section.group)
    end

    def filter(options)
      @source.where(options)
    end

    def each(&block)
      @source.each(&block)
    end


  end
end