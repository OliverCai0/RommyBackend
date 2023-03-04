class UserTableToken < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tokens do |t|
      t.references :user, index: true, foreign_key: true
      t.string :token
      t.timestamps
    end
  end
end
