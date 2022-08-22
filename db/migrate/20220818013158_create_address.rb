class CreateAddress < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :contact, index: true, foreign_key: true, null: false
      t.string :cep
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.integer :number

      t.timestamps
    end
  end
end
