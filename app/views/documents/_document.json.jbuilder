json.extract! document, :id, :file, :department_id, :title, :when, :description, :created_at, :updated_at
json.url document_url(document, format: :json)
json.file url_for(document.file)
