module DataMapper
  module Is
    module Extendable

      ##
      # fired when your plugin gets included into Resource
      #
      def self.included(base)

      end

      ##
      # Methods that should be included in DataMapper::Model.
      # Normally this should just be your generator, so that the namespace
      # does not get cluttered. ClassMethods and InstanceMethods gets added
      # in the specific resources when you fire is :extendable
      ##

      def is_extendable(options)

        # Add class-methods
        extend  DataMapper::Is::Extendable::ClassMethods
        # Add instance-methods
        include DataMapper::Is::Extendable::InstanceMethods

      end

      module ClassMethods

      end # ClassMethods

      module InstanceMethods

      end # InstanceMethods

    end # Extendable
  end # Is
end # DataMapper
