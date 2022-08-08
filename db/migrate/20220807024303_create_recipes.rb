class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.bigint :user_id, null: false
      t.string :image
      t.string :title, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.string :material, null: false, default: ""
      t.string :amount, null: false, default: ""
      t.text :flow, null: false, default: ""
      t.string :advise

      t.timestamps
    end
    add_index :users, :id,                   unique: true
  end
end
