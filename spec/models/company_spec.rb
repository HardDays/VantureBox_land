require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:current_stage) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:contact_email) }

  it { should belong_to(:user) }
end
