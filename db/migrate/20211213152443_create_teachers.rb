class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :specialty
      t.text :description
      t.decimal :price, :precision => 4, :scale => 2
      t.string :city_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
