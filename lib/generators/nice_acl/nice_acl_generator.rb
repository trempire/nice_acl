require "rails/generators/active_record"

module NiceACL
  module Generators
    class NiceACLGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      argument :name, type: :string, default: "User"
      namespace :nice_acl

      def copy_roles_migration
        migration_template "create_nice_acl_roles.rb", "db/migrate/create_nice_acl_roles.rb"
      end
    end
  end
end
