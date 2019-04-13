json.extract! portfolio, :id, :category_id, :name, :description, :image, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
