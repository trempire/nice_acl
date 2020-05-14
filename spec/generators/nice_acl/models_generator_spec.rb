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

  describe "#create_roles_user_model" do
    it "creates app/model/nice_acl/roles_user.rb class" do
      invoke_task :create_roles_user_model

      model_file = file("app/models/nice_acl/roles_user.rb")

      expect(model_file).to exist
      expect(model_file).to have_correct_syntax
      expect(model_file).to contain(/class NiceAcl::RolesUser < ApplicationRecord/)
      expect(model_file).to contain(/belongs_to :user/)
      expect(model_file).to contain(/belongs_to :nice_acl_role, class: "NiceAcl::Role"/)
    end
  end

  describe "#create_permissions_role_model" do
    it "creates app/model/nice_acl/permissions_role.rb class" do
      invoke_task :create_permissions_role_model

      model_file = file("app/models/nice_acl/permissions_role.rb")

      expect(model_file).to exist
      expect(model_file).to have_correct_syntax
      expect(model_file).to contain(/class NiceAcl::PermissionsRole < ApplicationRecord/)
      expect(model_file).to contain(/belongs_to :nice_acl_permission, class: "NiceAcl::Permission"/)
      expect(model_file).to contain(/belongs_to :nice_acl_role, class: "NiceAcl::Role"/)
    end
  end
end
