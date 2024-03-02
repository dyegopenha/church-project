class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :kind
      t.string :favored
      t.date :when
      t.text :description

      t.timestamps
    end
  end
end
