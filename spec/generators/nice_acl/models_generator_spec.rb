require "spec_helper"

require "generators/nice_acl/models_generator"

RSpec.describe NiceAcl::Generators::ModelsGenerator, type: :generator do
  destination File.expand_path("../../../../spec/tmp", __FILE__)

  before { prepare_destination }

  describe "#create_role_model" do
    it "creates app/model/role.rb class" do
      gen = generator
      gen.invoke_all

      model_file = file("app/models/nice_acl/role.rb")

      expect(model_file).to exist
      expect(model_file).to have_correct_syntax
      expect(model_file).to contain(/class NiceAcl::Role < ApplicationRecord/)
      expect(model_file).to contain(/has_many :nice_acl_roles_users, class: "NiceAcl::RolesUser"/)
      expect(model_file).to contain(/has_many :nice_acl_permissions_roles, class: "NiceAcl:PermissionsRole"/)
    end
  end
end
