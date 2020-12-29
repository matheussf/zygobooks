class CreateCreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :create_books do |t|
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
