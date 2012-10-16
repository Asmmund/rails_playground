class User < ActiveRecord::Base
  attr_accessible :address, :company_info, :email, :name
end
