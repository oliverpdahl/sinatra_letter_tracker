class Recipient < ActiveRecord::Base
  has_many :letters
  has_many :users, through: :letters
end
