class Customer < ActiveRecord::Base
  has_many :jobs
  acts_as_authentic
end
