class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :type_of_account
      t.integer :balance
      t.string :name

      t.timestamps null: false
    end
  end
end
