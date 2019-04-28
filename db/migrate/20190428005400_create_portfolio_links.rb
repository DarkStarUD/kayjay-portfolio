class CreatePortfolioLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_links do |t|
      t.references :portfolio, foreign_key: true
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
