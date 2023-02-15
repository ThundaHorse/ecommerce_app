class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :description
      t.string :name, presence: true, index: { unique: true }
      t.decimal :price, precision: 11, scale: 2

      t.timestamps
    end
  end
end
