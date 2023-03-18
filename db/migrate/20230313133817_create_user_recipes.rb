# frozen_string_literal: true

class CreateUserRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_recipes do |t|
      t.string :name
      t.float :preparation_time
      t.float :cooking_time
      t.text :description
      t.boolean :public, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
