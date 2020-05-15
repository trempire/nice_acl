require "spec_helper"

require "generators/nice_acl/nice_acl_generator"

RSpec.describe NiceAcl::Generators::NiceAclGenerator, type: :generator do
  destination File.expand_path("../../../../spec/tmp", __FILE__)

  before { prepare_destination }

  describe "#invoke_models_generator" do
    it "runs generator for all models" do
      invoke_task :invoke_models_generator

      expect(file("app/models/nice_acl/role.rb")).to exist
      expect(file("app/models/nice_acl/permission.rb")).to exist
      expect(file("app/models/nice_acl/roles_user.rb")).to exist
      expect(file("app/models/nice_acl/permissions_role.rb")).to exist
    end
  end

  describe "#invoke_migrations_generator" do
    it "runs generator for all migrations" do
      invoke_task :invoke_migrations_generator

      expect(migration_file("db/migrate/create_nice_acl_roles.rb")).to exist
      expect(migration_file("db/migrate/create_nice_acl_permissions_roles.rb")).to exist
      expect(migration_file("db/migrate/create_nice_acl_permissions.rb")).to exist
      expect(migration_file("db/migrate/create_nice_acl_roles_users.rb")).to exist
    end
  end
end
