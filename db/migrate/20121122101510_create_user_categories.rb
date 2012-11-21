class CreateUserCategories < ActiveRecord::Migration
  def change
    create_table :user_categories do |t|
      t.references :category
      t.references :user
      t.timestamps
    end
  end
end
