class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.bigint :user_id, null: false
      t.string :tx_id, null:false
      t.string :sender_code, null: false
      t.string :receiver_code, null: false
      t.integer :status, default: 0
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.string :concept, default: ''
      t.text :meta_data

      t.timestamps
    end
  end
end
