class Customer < ActiveRecord::Base
  has_many :jobs
end
