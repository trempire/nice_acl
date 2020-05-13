require "rails/generators/active_record"
require "erb"

module NiceAcl
  module Generators
    class ModelsGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates/models", __FILE__)

      argument :name, type: :string, default: "Role"
      namespace :nice_acl

      def create_role_model
        create_model(:role)
      end

      private

      def create_model(model_name)
        invoke "active_record:model", ["nice_acl/#{model_name}"], migration: false
        inject_into_class(model_path(model_name), "NiceAcl::#{model_name.to_s.capitalize}", model_content(model_name))
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
