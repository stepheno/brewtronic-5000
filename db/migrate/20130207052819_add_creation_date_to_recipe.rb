class AddCreationDateToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :creation_date, :date
  end
end
