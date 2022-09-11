class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.bigint :user_id, null: false
      t.string :name, default: 'Principal'
      t.integer :type_a, default: 0
      t.boolean :enabled, default: true
      t.decimal :balance, precision: 15, scale: 2
      t.text :meta_data

      t.timestamps
    end
  end
end
