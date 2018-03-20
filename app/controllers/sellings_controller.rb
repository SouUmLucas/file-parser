class SellingsController < ApplicationController

  def index
    @sellings = Selling.all
  end

  def new
  end

  def create
  end

  def show
  end

  private
    def sellings_params
      params.require(:selling).permit(:file)
    end
end
