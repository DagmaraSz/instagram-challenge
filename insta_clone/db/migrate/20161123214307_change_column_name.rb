class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :photos, :name, :placeholder
  end
end
