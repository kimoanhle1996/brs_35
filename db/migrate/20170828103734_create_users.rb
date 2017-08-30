class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :fullname
      t.boolean :role
      t.string :img
      t.integer :active

      t.timestamps
    end
  end
end
