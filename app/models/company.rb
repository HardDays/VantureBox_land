class Company < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :website

  belongs_to :user


  enum markets: [:financial_markets]
  enum current_stage: [:round_a, :round_b]
  enum current_revenue: [:zero, :two_hundred, :million, :universe]
  enum target_revenue: [:hundred, :five_hundred, :million, :universe]
end
