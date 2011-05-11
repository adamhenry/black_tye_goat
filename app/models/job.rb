class Job < ActiveRecord::Base
  belongs_to :customer
  
  def customerName
    if job.customer then
      job.customer.name
    else
      "NA"
    end
  end

end
