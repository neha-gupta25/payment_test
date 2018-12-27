class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :user, index: true
      t.string :access_token
      t.integer :amount_received
      t.integer :amount_withdrawl
      t.timestamps null: false
    end
  end
end
