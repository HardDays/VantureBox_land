class ChangeMarketType < ActiveRecord::Migration[5.2]
  def change
    change_column :company, :markets, :string
  end
end
