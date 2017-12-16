class AddPdfToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :pdf, :string
  end
end
