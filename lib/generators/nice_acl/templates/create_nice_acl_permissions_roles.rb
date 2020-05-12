class CreateNiceACLPermissionsRoles < ActiveRecord::Migration
  def change
    create_table :nice_acl_permissions_roles do |t|
      t.belongs_to :nice_acl_permission
      t.belongs_to :nice_acl_role
    end

    add_index :nice_acl_permissions_roles, %i[nice_acl_permission_id nice_acl_role_id], unique: true
  end
end
