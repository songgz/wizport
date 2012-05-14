# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Visitable
    def accept(visitor)
      visitor.visit_for self
    end
  end

  module Visitor
    def self.included(base)
      base.extend(ClassMethods)
      base.class_eval do
        include InstanceMethods
      end
    end

    module InstanceMethods
      def visit_for(visitable)
        visitable.class.ancestors.each do |ancestor|
          method_name = "visit_#{ancestor.name}"
          p method_name
          return send method_name, visitable if respond_to? method_name
        end
        raise "Can't handle #{visitable.class}"
      end
    end

    module ClassMethods
      def visit(*klasses, &block)
        klasses.each do |klass|
          define_method(:"visit_#{klass.name}", block)
        end
      end
    end
  end
end