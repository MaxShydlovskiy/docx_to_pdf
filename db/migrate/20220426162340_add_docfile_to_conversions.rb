class AddDocfileToConversions < ActiveRecord::Migration[7.0]
  def change
    add_column :conversions, :doc_file, :string
  end
end
