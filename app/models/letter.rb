class Letter < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :user

  def sent?
    !!self.date_sent
  end

  def received?
    !!self.date_received
  end

  def date_sent_string
    sent? ? self.date_sent.strftime("Sent on %A, %B %e, %Y") : "Not yet sent"
  end

  def date_received_string
    received? ? self.date_received.strftime("Recieved on %A, %B %e, %Y") : "Not yet received"
  end
end
