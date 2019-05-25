class AddProgramsToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :is_cross_border_expantion, :boolean, default: false
    add_column :companies, :is_consumer_connect, :boolean, default: false
  end
end
