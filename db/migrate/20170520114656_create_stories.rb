class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.references :item, foreign_key: true
      t.string :title
      t.text :content
      t.string :img
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
