module NiceACL
  module Generators
    class NiceACLGenerator < Rails::Generators::NamedBase
      argument :name, :type => :string, :default => "User"
      namespace :nice_acl

      def hello_world
        'Hello world'
      end
    end
  end
end
