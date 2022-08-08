class CreateRecipeTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_tag_relations do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :recipes, :id,                   unique: true
    add_index :tags, :id,                   unique: true
  end
end
