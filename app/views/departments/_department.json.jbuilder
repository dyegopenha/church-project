json.extract! department, :id, :name, :description, :avatar, :created_at, :updated_at
json.url department_url(department, format: :json)
json.avatar url_for(department.avatar)
