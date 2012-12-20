class ChangeStyleSubCategoryToString < ActiveRecord::Migration
  def up
    change_column :styles, :sub_category, :string
  end

  def down
    change_column :styles, :sub_category, :integer
  end
end
