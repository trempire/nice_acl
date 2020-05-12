class CreateNiceACLRoles < ActiveRecord::Migration
  def change
    create_table :nice_acl_roles do |t|
      t.string :name
    end
  end
end
