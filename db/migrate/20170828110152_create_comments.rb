class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :review, foreign_key: true, index: true
      t.text :detail
      t.date :date

      t.timestamps
    end
  end
end
