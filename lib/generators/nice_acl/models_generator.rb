require "rails/generators/active_record"
require "erb"

module NiceAcl
  module Generators
    class ModelsGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates/models", __FILE__)

      argument :name, type: :string, default: "User"

      def create_role_model
        create_model(:role)
      end

      def create_permission_model
        create_model(:permission)
      end

      def create_roles_user_model
        create_model(:roles_user)
      end

      def create_permissions_role_model
        create_model(:permissions_role)
      end

      private

      def create_model(model_name)
        generator = ModelsGenerator.new([])
        generator.destination_root = destination_root
        generator.invoke "active_record:model", ["nice_acl/#{model_name}"], migration: false
        inject_into_class(model_path(model_name), "NiceAcl::#{model_name.to_s.camelcase}", model_content(model_name))
      end

      def model_content(model)
        ERB.new(File.read(File.join(__dir__, "templates/models/#{model}.rb"))).result(binding)
      end

      def model_path(model)
        File.join("app", "models", "nice_acl", "#{model}.rb")
      end
    end
  end
end
