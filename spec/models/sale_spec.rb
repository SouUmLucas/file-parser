require 'rails_helper'

RSpec.describe Sale, type: :model do
  it { is_expected.to respond_to :buyer }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :unit_price }
  it { is_expected.to respond_to :amount }
  it { is_expected.to respond_to :address }
  it { is_expected.to respond_to :provider }
end
