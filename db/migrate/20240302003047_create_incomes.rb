class CreateIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.decimal :amount
      t.string :kind
      t.string :origin
      t.date :when
      t.text :description

      t.timestamps
    end
  end
end
