class UserCategory < ActiveRecord::Base
belongs_to :user
belongs_to :category
  # attr_accessible :title, :body
end
