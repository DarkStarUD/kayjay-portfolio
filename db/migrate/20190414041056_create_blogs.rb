class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :body
      t.string :image
      t.integer :status
      t.references :topic, foreign_key: true
      t.timestamps
    end
  end
end
