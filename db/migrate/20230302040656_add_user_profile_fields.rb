class AddUserProfileFields < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :email, :string
    add_column :users, :device_token, :string

    create_table :group do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :join_group_users do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end

  end
end
