class CreateNiceACLPermissions < ActiveRecord::Migration
  def change
    create_table :nice_acl_permissions do |t|
      t.string :name
      t.string :model
      t.string :action
    end
  end
end
