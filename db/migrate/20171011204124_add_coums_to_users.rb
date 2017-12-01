class AddCoumsToUsers < ActiveRecord::Migration
  def change
      add_column :users, :quiz1correct, :integer
      add_column :users, :quiz1total, :integer
      add_column :users, :quiz2correct, :integer
      add_column :users, :quiz2total, :integer
      add_column :users, :quiz3correct, :integer
      add_column :users, :quiz3total, :integer
      add_column :users, :quiz4correct, :integer
      add_column :users, :quiz4total, :integer
      add_column :users, :quiz5correct, :integer
      add_column :users, :quiz5total, :integer
      add_column :users, :quiz6correct, :integer
      add_column :users, :quiz6total, :integer
      add_column :users, :quiz7correct, :integer
      add_column :users, :quiz7total, :integer
      add_column :users, :quiz8correct, :integer
      add_column :users, :quiz8total, :integer
      add_column :users, :quiz9correct, :integer
      add_column :users, :quiz9total, :integer
      add_column :users, :quiz10correct, :integer
      add_column :users, :quiz10total, :integer
      add_column :users, :quiz11correct, :integer
      add_column :users, :quiz11total, :integer
      add_column :users, :quiz12correct, :integer
      add_column :users, :quiz12total, :integer
      add_column :users, :quiz13correct, :integer
      add_column :users, :quiz13total, :integer
  end
end
