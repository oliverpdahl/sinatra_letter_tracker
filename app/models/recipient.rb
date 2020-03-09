class Recipient < ActiveRecord::Base
  has_many :letters
  belongs_to :users
end
