require 'rails_helper'

RSpec.describe ImportFile, type: :model do
  it { should have_many :sales }
  
  it { is_expected.to respond_to :id }

  context 'test gross revenue' do
    before do
      test_file = File.new("#{Rails.root}/spec/support/dados_test.txt", 'r')
      @file = ImportFile.new
      @file.file = test_file
      @file.save
    end

    it 'should return gross revenue 95.0' do
      expect(@file.gross_revenue.to_f).to eq(95.0)
    end
  end
end
