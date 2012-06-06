# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Pdf
    class Catalog < Element
      def initialize(id, ver)
        super(id, ver)
        dict '/Type', '/Catalog'
      end
    end
  end
end
