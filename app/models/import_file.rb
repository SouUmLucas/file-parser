class ImportFile < ApplicationRecord
  attr_accessor :file
  has_many :sales

  def save
    self.file_name = file.original_filename
    super
    save_sales
  end

  def gross_revenue
    sales.map { |n| n.unit_price * n.amount }.reduce(&:+)
  end

  private
    def save_sales
      data = file.read.split(/\r?\n|\r/).drop(1)
      values = get_sellings_from_data(data)
      fast_insert(values)
    end

    def get_sellings_from_data(data)
      values = []

      data.drop(0).each do |selling|
        s = selling.split(/\t/)
        values << "(#{id}, \"#{s[0]}\", \"#{s[1]}\", #{s[2].to_f}, #{s[3].to_f}, \"#{s[4]}\", \"#{s[5]}\")"
      end

      values
    end

    def fast_insert(values)
      ActiveRecord::Base.connection.execute(
        "INSERT INTO sales (import_file_id, buyer, description, unit_price, amount, address, provider) VALUES #{values.join(',')}"
      )
    end
end
