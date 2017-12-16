class AddPaymentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :card_number, :string
    add_column :users, :card_name, :string
    add_column :users, :card_exp_year, :integer
    add_column :users, :card_exp_month, :integer
    add_column :users, :card_cvv, :integer
  end
end
