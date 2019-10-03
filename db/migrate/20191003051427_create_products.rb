class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :title,                null: false
      t.text :description,          null: false
      t.string :image,              null: false
      t.string :product_url,        null: false
      t.string :language,           null: false
      t.string :term,               null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
