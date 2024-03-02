json.extract! income, :id, :amount, :kind, :origin, :when, :file, :description, :created_at, :updated_at
json.url income_url(income, format: :json)
json.file url_for(income.file)
