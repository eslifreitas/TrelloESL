json.extract! person, :id, :name, :email, :role, :created_at, :updated_at
json.url person_url(person, format: :json)
