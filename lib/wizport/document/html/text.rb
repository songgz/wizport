# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Html
    class Text < Element
      #options = {color:red, 'font-size':24, 'text-align' = left }
      def initialize(html,txt,options = {})
        super html
        tag 'p', txt, {:style => options.collect {|k, v| "#{k}:#{v}"}.join(';')}.delete_if {|k,v| v == nil || v == ''}
      end
    end
  end
end
