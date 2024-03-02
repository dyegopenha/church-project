json.extract! user, :id, :name, :cpf, :email, :phone, :zipcode, :address, :address_number, :address_opt, :birthday, :member, :member_at, :office, :department_id, :avatar, :about, :created_at, :updated_at
json.url user_url(user, format: :json)
json.avatar url_for(user.avatar)
