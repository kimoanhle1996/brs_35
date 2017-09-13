class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :fullname
      t.boolean :role, default: false
      t.string :img
      t.integer :active

      t.timestamps
    end
  end
end
