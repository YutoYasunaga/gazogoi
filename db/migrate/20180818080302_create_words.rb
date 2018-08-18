class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :ja
      t.string :furigana
      t.string :en
      t.string :vi
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
