class CreateNiceACLRolesUsers < ActiveRecord::Migration
  def change
    create_table :nice_acl_roles_users do |t|
      t.belongs_to :nice_acl_role
      t.belongs_to :user
    end

    add_index :nice_acl_roles_users, %i[nice_acl_role_id user_id], unique: true
  end
end
