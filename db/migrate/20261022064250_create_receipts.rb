class CreateReceipts < ActiveRecord::Migration[7.2]
  def change
    create_table :receipts do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.integer :amount
      t.date :issued_date
      t.string :account_item
      t.text :memo

      t.timestamps
    end
  end
end
