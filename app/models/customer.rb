class Customer < ActiveRecord::Base
  has_many :jobs
  acts_as_authentic

  def job_groups
    {
      "Pending" => jobs_pending ,
      "Due" => jobs_due ,
      "Paid" => jobs_paid ,
      "Overdue" => jobs ,
      "Late" => jobs ,
    }
  end

  def jobs_pending
    jobs.select(&:pending?)
  end

  def jobs_due
    jobs.select(&:due?)
  end

  def jobs_paid
    jobs.select(&:done?)
  end

  def jobs_count
    if jobs
      return jobs.count
    else
      return "NA"
    end
  end

end
