class CreateConversions < ActiveRecord::Migration[7.0]
  def change
    create_table :conversions do |t|

      t.timestamps
    end
  end
end
