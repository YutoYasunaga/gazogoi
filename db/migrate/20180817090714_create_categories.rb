class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :en
      t.string :vi
      t.string :slug

      t.timestamps
    end
  end
end
