json.extract! payment, :id, :amount, :kind, :favored, :when, :file, :description, :created_at, :updated_at
json.url payment_url(payment, format: :json)
json.file url_for(payment.file)
