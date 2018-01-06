class Yolo < ActiveRecord::Migration
  def change
    add_column :lessons, :shortDesc, :string
  end
end
