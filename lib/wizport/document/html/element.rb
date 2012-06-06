# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Html
    class Element
      def initialize(html)
        @html = html
      end

      def tag(name, *args) #text = nil, options = {})
        text = nil
        options = {}
        case args.size
          when 1
            if args.first.is_a?(Hash)
              options = args.first
            else
              text = args.first
            end
          when 2
            text = args.first
            options = args.last
        end
        @html.write '<'
        @html.write name
        options.each do |k, v|
          @html.write " #{k}='#{v}'"
        end
        @html.write '>'
        @html.write text if text
        yield if block_given?
        @html.write '</'
        @html.write name
        @html.write '>'
      end
    end
  end
end
