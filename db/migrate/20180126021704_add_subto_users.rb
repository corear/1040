class AddSubtoUsers < ActiveRecord::Migration
  def change
    add_column :users, :subsriptionId, :string
  end
end
