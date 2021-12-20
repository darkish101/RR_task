json.extract! user, :id, :name, :email, :password, :role, :created_at, :updated_at
json.url home_index_url("home#index", format: :json)
