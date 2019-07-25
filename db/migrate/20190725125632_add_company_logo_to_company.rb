class AddCompanyLogoToCompany < ActiveRecord::Migration[5.2]
  def change
    rename_column :companies, :name, :company_name
    add_column :companies, :company_logo, :string
    add_column :companies, :company_email, :string
    add_column :companies, :investment, :integer
  end
end
