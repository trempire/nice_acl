module NiceAcl
  module Generators
    class NiceAclGenerator < Rails::Generators::NamedBase
      namespace :nice_acl

      argument :name, type: :string, default: "User"

      def invoke_models_generator
        invoke "nice_acl:models"
      end

      def invoke_migrations_generator
        invoke "nice_acl:migrations"
      end
    end
  end
end
