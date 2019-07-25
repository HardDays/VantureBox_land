class Company < ApplicationRecord
  validates_presence_of :user_id, :name, :current_stage, :description
  validates :website, url: true, unless: Proc.new { |a| a.website.blank? }
  validates :website, http_url: true, unless: Proc.new { |a| a.website.blank? }
  validates :contact_email, :presence => true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :evaluation, :inclusion => 1..99, unless: Proc.new { |a| a.evaluation.blank? }
  validates_uniqueness_of :user_id

  belongs_to :user
  
  enum current_stage: [:round_a, :round_b, :round_c, :idea, :pre_seed, :seed]
  enum current_revenue: [:zero, :two_hundred, :million, :universe]
  enum target_revenue: [:hundred, :five_hundred, :one_million, :more]
end
