class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.bigint :user_id, null: false
      t.string :image
      t.string :title, null: false, default: ""
      t.text :introduction, null: false
      t.string :material, null: false, default: ""
      t.string :amount, null: false, default: ""
      t.text :flow, null: false
      t.string :advise
      t.integer :bookmarks_count, null: false, default: 0

      t.timestamps
    end
    add_index :users, :id,                   unique: true
  end
end
