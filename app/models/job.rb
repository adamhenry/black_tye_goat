class Job < ActiveRecord::Base
  belongs_to :customer
  
  def customerName
    if self.customer then
      self.customer.name
    else
      "NA"
    end
  end

end
