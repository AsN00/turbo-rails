class AddGenderToMypets < ActiveRecord::Migration[7.1]
  def change
    add_column :mypets, :gender, :string
  end
end
