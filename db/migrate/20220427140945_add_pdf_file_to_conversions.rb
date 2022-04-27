class AddPdfFileToConversions < ActiveRecord::Migration[7.0]
  def change
    add_column :conversions, :pdf_file, :string
  end
end
