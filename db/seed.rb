bob = User.new(username: 'bob', password: 'password')
paul = User.new(username: 'paul', password: 'password')
mary = User.new(username: 'mary', password: 'password')

martha = Recipient.new(name: 'martha', address: '123 Penbrook Rd.', user_id: bob.id)
steve = Recipient.new(name: 'steve', address: '123 Addlebird Rd.', user_id: bob.id)
jammie = Recipient.new(name: 'jammie', address: '789 Zipline Dr.', user_id: bob.id)

martha = Recipient.new(name: 'martha', address: '123 Penbrook Rd.', user_id: paul.id)
amanda = Recipient.new(name: 'amanda', address: '123 Addlebird Rd.', user_id: paul.id)
martin = Recipient.new(name: 'martin', address: '789 Zipline Dr.', user_id: paul.id)

ricardo = Recipient.new(name: 'ricardo', address: '123 Penbrook Rd.', user_id: mary.id)
martson = Recipient.new(name: 'martson', address: '123 Addlebird Rd.', user_id: mary.id)
dennision = Recipient.new(name: 'dennision', address: '789 Zipline Dr.', user_id: mary.id)

bob_martha = Letter.new(notes: 'Letter from bob to martha', user_id: bob.id, recipient_id: martha.id, date_sent: DateTime.new(2020,1,12), date_received: DateTime.new(2020,1,28))
bob_steve
bob_jammie
