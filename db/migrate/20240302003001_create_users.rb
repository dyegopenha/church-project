class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :phone
      t.integer :zipcode
      t.string :address
      t.string :address_number
      t.string :address_opt
      t.date :birthday
      t.boolean :member
      t.date :member_at
      t.string :office
      t.references :department, null: false, foreign_key: true
      t.text :about

      t.timestamps
    end
  end
end
