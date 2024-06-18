class CreateMypets < ActiveRecord::Migration[7.1]
  def change
    create_table :mypets do |t|
      t.string :name
      t.float :age
      t.string :animal_type

      t.timestamps
    end
  end
end
