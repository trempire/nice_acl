# frozen_string_literal: true

require "rails/generators/active_record"
require "active_support/core_ext"
require "erb"

module ActiveRecord
  module Generators
    class NiceACLGenerator < ActiveRecord::Generators::Base
      # source_root File.expand_path('templates', __dir__)

      argument :user_cname, type: :string, default: "User", banner: "User"

      def generate_model
        invoke "active_record:model", [name], migration: false
      end

      def inject_role_class
        require "#{ENGINE_ROOT}/app/models/#{user_cname.downcase}.rb"
        inject_into_class(model_path, class_name, model_content)
      end

      # def copy_nice_acl_migration
      #   migration_template "migration.rb", "db/migrate/nice_acl_create_#{table_name}.rb", migration_version: migration_version
      # end

      private

      def model_path
        File.join("app", "models", "#{file_path}.rb")
      end

      def model_content
        # ERB.new(File.read(File.join(__dir__, 'templates/model.rb'))).result(binding)
      end

      def rails5?
        Rails.version.start_with? "5"
      end

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if rails5?
      end
    end
  end
end
