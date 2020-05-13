require "spec_helper"

require "generators/nice_acl/models_generator"

RSpec.describe NiceAcl::Generators::ModelsGenerator, type: :generator do
  destination File.expand_path("../../../../spec/tmp", __FILE__)

  before { prepare_destination }

  describe "#create_role_model" do
    it "creates app/model/nice_acl/role.rb class" do
      invoke_task :create_role_model

      model_file = file("app/models/nice_acl/role.rb")

      expect(model_file).to exist
      expect(model_file).to have_correct_syntax
      expect(model_file).to contain(/class NiceAcl::Role < ApplicationRecord/)
      expect(model_file).to contain(/has_many :nice_acl_roles_users, class: "NiceAcl::RolesUser"/)
      expect(model_file).to contain(/has_many :nice_acl_permissions_roles, class: "NiceAcl:PermissionsRole"/)
    end
  end

  describe "#create_permission_model" do
    it "creates app/model/nice_acl/permission.rb class" do
      invoke_task :create_permission_model

      model_file = file("app/models/nice_acl/permission.rb")

      expect(model_file).to exist
      expect(model_file).to have_correct_syntax
      expect(model_file).to contain(/class NiceAcl::Permission < ApplicationRecord/)
      expect(model_file).to contain(/has_many :nice_acl_permissions_roles, class: "NiceAcl:PermissionsRole"/)
    end
  end
end
