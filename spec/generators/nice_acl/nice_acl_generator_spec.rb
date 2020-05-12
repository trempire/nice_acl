require "spec_helper"

require "generators/nice_acl/nice_acl_generator"

RSpec.describe NiceACL::Generators::NiceACLGenerator, type: :generator do
  destination File.expand_path("../../../../spec/tmp", __FILE__)

  before { prepare_destination }

  it "runs copy_roles_migration command" do
    gen = generator
    allow(gen).to receive(:copy_roles_migration)

    gen.invoke_all

    expect(gen).to have_received :copy_roles_migration
  end

  describe "#copy_roles_migration" do
    it "copies nice_acl_create_roles template to migrate folder" do
      run_generator

      file = migration_file("db/migrate/nice_acl_create_roles.rb")

      expect(file).to exist
    end
  end
end
