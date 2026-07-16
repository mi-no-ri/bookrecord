class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :started_on
      t.date :finished_on
      t.integer :reading_status
      t.integer :acquisition_type
      t.boolean :paper, default: false, null: false
      t.boolean :ebook, default: false, null: false
      t.text :memo

      t.timestamps
    end
  end
end
