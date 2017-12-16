class BanhammerAndSuch < ActiveRecord::Migration
  def change
    add_column :users, :banhammer, :boolean, :default => "false"
    add_column :users, :auto_renew, :boolean, :default => "true"
  end
end
