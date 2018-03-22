class ImportFilesController < ApplicationController
  before_action :set_imported_file, only: [:show]

  def index
    @imported_files = ImportFile.all
  end

  def new
    @import_file = ImportFile.new
  end

  def create
    @import_file = ImportFile.new
    @import_file.file = sellings_params[:file]
    @import_file.file_name = sellings_params[:file]
    
    respond_to do |format|
      if @import_file.save
        format.html { redirect_to import_file_path @import_file }
      end
    end
    
  end

  def show
  end

  private
    def sellings_params
      params.require(:import_file).permit(:file)
    end

    def set_imported_file
      @imported_file = ImportFile.find(params[:id])
    end
end
