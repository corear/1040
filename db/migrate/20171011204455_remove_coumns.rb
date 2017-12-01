class RemoveCoumns < ActiveRecord::Migration
  def change
      remove_column :users, :quiz1correct, :integer
      remove_column :users, :quiz1total, :integer
      remove_column :users, :quiz2correct, :integer
      remove_column :users, :quiz2total, :integer
      remove_column :users, :quiz3correct, :integer
      remove_column :users, :quiz3total, :integer
      remove_column :users, :quiz4correct, :integer
      remove_column :users, :quiz4total, :integer
      remove_column :users, :quiz5correct, :integer
      remove_column :users, :quiz5total, :integer
      remove_column :users, :quiz6correct, :integer
      remove_column :users, :quiz6total, :integer
      remove_column :users, :quiz7correct, :integer
      remove_column :users, :quiz7total, :integer
      remove_column :users, :quiz8correct, :integer
      remove_column :users, :quiz8total, :integer
      remove_column :users, :quiz9correct, :integer
      remove_column :users, :quiz9total, :integer
      remove_column :users, :quiz10correct, :integer
      remove_column :users, :quiz10total, :integer
      remove_column :users, :quiz11correct, :integer
      remove_column :users, :quiz11total, :integer
      remove_column :users, :quiz12correct, :integer
      remove_column :users, :quiz12total, :integer
      remove_column :users, :quiz13correct, :integer
      remove_column :users, :quiz13total, :integer
  end
end
