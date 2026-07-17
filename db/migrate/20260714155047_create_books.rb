class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      # 必須項目のためNULLを保存しない項目にはnull: falseを記述
      t.string :title, null: false
      t.string :author
      t.date :started_on
      t.date :finished_on
      t.integer :reading_status, null: false
      t.integer :acquisition_type, null: false
      t.boolean :paper, default: false, null: false
      t.boolean :ebook, default: false, null: false
      t.text :memo

      t.timestamps
    end
  end
end
