class AddCostPerYearToMypets < ActiveRecord::Migration[7.1]
  def change
    add_column :mypets, :cost_per_year, :float
  end
end
