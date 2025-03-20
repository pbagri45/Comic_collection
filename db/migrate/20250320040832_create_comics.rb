class CreateComics < ActiveRecord::Migration[7.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :series, null: false, foreign_key: true

      t.timestamps
    end
  end
end
