# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Html
    class Text < Element
      def initialize(html,txt)
        super html
        tag 'p', txt
      end
    end
  end
end
