class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :client_name
      t.integer :amount
      t.date :event_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
