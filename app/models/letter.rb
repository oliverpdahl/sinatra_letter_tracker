class Letter < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :user
end
