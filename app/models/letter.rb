class Letter < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :user

  def sent?
    !!self.date_sent
  end

  def received?
    !!self.date_received
  end
end
