class CreateContacts < ActiveRecord::Migration[7.0]
  def change  
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :cpf, :unique =>  true
      t.string :email, :unique =>  true
      t.datetime :birth_date
      

      t.timestamps
    end
  end
end
