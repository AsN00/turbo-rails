json.extract! mypet, :id, :name, :age, :animal_type, :created_at, :updated_at
json.url mypet_url(mypet, format: :json)
