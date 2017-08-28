class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :publish_date
      t.integer :page_number
      t.string :preview
      t.text :detail
      t.string :image
      t.float :rate
      t.references :catagorie, index: true, foreign_key: true

      t.timestamps
    end
  end
end
