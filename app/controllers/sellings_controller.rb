class SellingsController < ApplicationController

  def index
    @sellings = Selling.all
  end

  def new
    @selling = Selling.new
  end

  def create
    data = sellings_params[:file].read.split(/\r?\n|\r/).drop(1)
    sellings = get_sellings_from_data(data)

    fast_insert(sellings)

    redirect_to sellings_path
  end

  def show
  end

  private
    def sellings_params
      params.require(:selling).permit(:file)
    end

    def get_sellings_from_data(data)
      values = []

      data.drop(0).each do |selling|
        s = selling.split(/\t/)
        values << "(\"#{s[0]}\", \"#{s[1]}\", #{s[2].to_f}, #{s[3].to_f}, \"#{s[4]}\", \"#{s[5]}\")"
      end

      values
    end

    def fast_insert(values)
      ActiveRecord::Base.connection.execute(
        "INSERT INTO sellings (buyer, description, unit_price, amount, address, provider) VALUES #{values.join(',')}"
      )
    end
end
