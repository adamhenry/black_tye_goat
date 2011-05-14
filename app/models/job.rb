class Job < ActiveRecord::Base
  belongs_to :customer
  
  def input_file
    file_name = super
    return file_name unless file_name.blank?
    "No file name"
  end

  def pending?
    !completed
  end

  def due?
    completed && !paid
  end

  def paid?
    done?
  end

  def done?
    completed && paid
  end

  def total_price
    price_per_page.to_f * page_count
  end

  def customer_name
    if self.customer then
      self.customer.name
    else
      "NA"
    end
  end

end

class Boolean
  def to_s
    self ? 'yes' : 'no'
  end
end
