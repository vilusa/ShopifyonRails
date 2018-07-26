class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.integer :stock
      t.references :product, foreign_key: true
    end
  end
end
