class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
