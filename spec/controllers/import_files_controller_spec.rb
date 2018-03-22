require 'rails_helper'

RSpec.describe ImportFilesController, type: :controller do
  describe '#create' do
    subject do
      post(
        :create, params: {
          import_file:{ 
            file: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/dados_test.txt", 'text/txt')
          }
        }
      )
    end

    it 'should upload a file' do
      expect(subject).to redirect_to(import_file_path(1))
    end
  end
end
