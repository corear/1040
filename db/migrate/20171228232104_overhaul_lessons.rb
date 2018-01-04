class OverhaulLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :excel, :string
    add_column :lessons, :doc, :string
  end
end
