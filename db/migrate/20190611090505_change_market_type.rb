class ChangeMarketType < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :markets, :string
  end
end
