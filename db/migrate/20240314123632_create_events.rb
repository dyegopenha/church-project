class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
