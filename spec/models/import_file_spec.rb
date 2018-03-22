require 'rails_helper'

RSpec.describe ImportFile, type: :model do
  it { should have_many :sales }
  
  it { is_expected.to respond_to :id }
end
