class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.date :date
      t.string :message
      t.boolean :status

      t.timestamps
    end
  end
end
