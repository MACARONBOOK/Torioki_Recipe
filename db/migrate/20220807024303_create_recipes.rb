class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :tag, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.string :material, null: false, default: ""
      t.string :amount, null: false, default: ""
      t.text :flow, null: false, default: ""
      t.string :advise

      t.timestamps
    end
    add_index :recipes, :id,                   unique: true
    add_index :users, :id,                   unique: true
  end
end
