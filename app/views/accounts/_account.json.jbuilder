json.extract! account, :id, :username, :password_digest, :role, :created_at, :updated_at
json.url account_url(account, format: :json)
