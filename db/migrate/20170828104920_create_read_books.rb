class CreateReadBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :read_books do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.boolean :favorite
      t.boolean :reading
      t.boolean :readed
      t.date :date_read

      t.timestamps
    end
  end
end
