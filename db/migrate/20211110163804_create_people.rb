class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :nombre
      t.string :apellido
      t.string :cui

      t.timestamps
    end
  end
end
