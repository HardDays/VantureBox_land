class AddLoginPageToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :is_interested_in_access, :boolean, default: false
    add_column :companies, :is_interested_in_insights, :boolean, default: false
    add_column :companies, :is_interested_in_capital, :boolean, default: false
    add_column :companies, :is_interested_in_marketplace, :boolean, default: false
    add_column :companies, :markets, :integer
    add_column :companies, :founded_in, :integer
    add_column :companies, :current_stage, :integer
    add_column :companies, :evaluation, :string
    add_column :companies, :is_revenue_consumer, :boolean, default: false
    add_column :companies, :is_revenue_wholesale, :boolean, default: false
    add_column :companies, :is_revenue_other, :boolean, default: false
    add_column :companies, :investor_deck_link, :string
    add_column :companies, :investor_deck_file, :string
    add_column :companies, :current_revenue, :integer
    add_column :companies, :current_stage_description, :string
    add_column :companies, :primary_market, :string
    add_column :companies, :target_market, :string
    add_column :companies, :target_revenue, :integer
  end
end
