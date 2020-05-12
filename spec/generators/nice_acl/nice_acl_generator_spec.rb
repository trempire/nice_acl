require "spec_helper"

require "generators/nice_acl/nice_acl_generator"

RSpec.describe NiceACL::Generators::NiceACLGenerator, type: :generator do
  destination File.expand_path("../../../../spec/tmp", __FILE__)

  before { prepare_destination }

  describe "#copy_roles_migration" do
    it "copies nice_acl_create_roles template to migrate folder" do
      invoke_task :copy_roles_migration

      file = migration_file("db/migrate/create_nice_acl_roles.rb")

      expect(file).to exist
      expect(file).to have_correct_syntax
      expect(file).to have_method(:change)
      expect(file).to contain(/create_table :nice_acl_roles/)
      expect(file).to contain(/string :name/)
    end
  end

  describe "#copy_permissions_roles_migration" do
    it "copies create_nice_acl_premissions_roles template to migrate folder" do
      invoke_task :copy_permissions_roles_migration

      file = migration_file("db/migrate/create_nice_acl_permissions_roles.rb")

      expect(file).to exist
      expect(file).to have_correct_syntax
      expect(file).to have_method(:change)
      expect(file).to contain(/create_table :nice_acl_permissions_roles/)
      expect(file).to contain(/belongs_to :nice_acl_permission/)
      expect(file).to contain(/belongs_to :nice_acl_role/)
      expect(file).to contain(/add_index :nice_acl_permissions_roles/)
      expect(file).to contain(/[nice_acl_permission_id nice_acl_role_id]/)
      expect(file).to contain(/unique: true/)
    end
  end

  describe "#copy_roles_users_migration" do
    it "copies create_nice_acl_roles_users template to migrate folder" do
      invoke_task :copy_roles_users_migration

      file = migration_file("db/migrate/create_nice_acl_roles_users.rb")

      expect(file).to exist
      expect(file).to have_correct_syntax
      expect(file).to have_method(:change)
      expect(file).to contain(/create_table :nice_acl_roles_users/)
      expect(file).to contain(/belongs_to :nice_acl_role/)
      expect(file).to contain(/belongs_to :user/)
      expect(file).to contain(/add_index :nice_acl_roles_users/)
      expect(file).to contain(/[nice_acl_role_id user_id]/)
      expect(file).to contain(/unique: true/)
    end
  end
end
