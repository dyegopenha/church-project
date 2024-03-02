class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.references :department, null: false, foreign_key: true
      t.date :when
      t.text :description

      t.timestamps
    end
  end
end
