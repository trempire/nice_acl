require "rails/generators/active_record"

module NiceAcl
  module Generators
    class MigrationsGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates/migrations", __FILE__)

      argument :name, type: :string, default: "User"

      def copy_roles_migration
        migration_template "create_nice_acl_roles.rb", "db/migrate/create_nice_acl_roles.rb"
      end

      def copy_permissions_roles_migration
        migration_template "create_nice_acl_permissions_roles.rb", "db/migrate/create_nice_acl_permissions_roles.rb"
      end

      def copy_roles_users_migration
        migration_template "create_nice_acl_roles_users.rb", "db/migrate/create_nice_acl_roles_users.rb"
      end

      def copy_permissions_migration
        migration_template "create_nice_acl_permissions.rb", "db/migrate/create_nice_acl_permissions.rb"
      end
    end
  end
end
