# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Pdf
    class Pages < Element
      def initialize(id, ver)
        super(id,ver)
        dict '/Type', '/Pages'
      end
    end
  end
end
