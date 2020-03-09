bob = User.create(username: 'bob', password: 'password')
paul = User.create(username: 'paul', password: 'password')
mary = User.create(username: 'mary', password: 'password')

martha = Recipient.create(name: 'martha', address: '123 Penbrook Rd.', user_id: bob.id)
steve = Recipient.create(name: 'steve', address: '123 Addlebird Rd.', user_id: bob.id)
jammie = Recipient.create(name: 'jammie', address: '789 Zipline Dr.', user_id: bob.id)

macy = Recipient.create(name: 'macy', address: '123 Penbrook Rd.', user_id: paul.id)
amanda = Recipient.create(name: 'amanda', address: '123 Addlebird Rd.', user_id: paul.id)
martin = Recipient.create(name: 'martin', address: '789 Zipline Dr.', user_id: paul.id)

ricardo = Recipient.create(name: 'ricardo', address: '123 Penbrook Rd.', user_id: mary.id)
martson = Recipient.create(name: 'martson', address: '123 Addlebird Rd.', user_id: mary.id)
dennision = Recipient.create(name: 'dennision', address: '789 Zipline Dr.', user_id: mary.id)

paul_macy = Letter.create(notes: 'Letter from paul to macy', user_id: paul.id, recipient_id: macy.id, date_sent: DateTime.new(2020,1,12), date_received: DateTime.new(2020,1,28))
paul_amanda = Letter.create(notes: 'Letter from paul to amanda', user_id: paul.id, recipient_id: amanda.id, date_sent: DateTime.new(2020,2,12), date_received: DateTime.new(2020,2,28))
paul_martin = Letter.create(notes: 'Letter from paul to martin', user_id: paul.id, recipient_id: martin.id, date_sent: DateTime.new(2020,3,2), date_received: DateTime.new(2020,3,9))

bob_martha = Letter.create(notes: 'Letter from bob to martha', user_id: bob.id, recipient_id: martha.id, date_sent: DateTime.new(2020,1,12), date_received: DateTime.new(2020,1,28))
bob_steve = Letter.create(notes: 'Letter from bob to steve', user_id: bob.id, recipient_id: steve.id, date_sent: DateTime.new(2020,2,12), date_received: DateTime.new(2020,2,28))
bob_jammie = Letter.create(notes: 'Letter from bob to jammie', user_id: bob.id, recipient_id: jammie.id, date_sent: DateTime.new(2020,3,2), date_received: DateTime.new(2020,3,9))

mary_ricardo = Letter.create(notes: 'Letter from mary to ricardo', user_id: mary.id, recipient_id: ricardo.id, date_sent: DateTime.new(2020,1,12), date_received: DateTime.new(2020,1,28))
mary_martson = Letter.create(notes: 'Letter from mary to martson', user_id: mary.id, recipient_id: martson.id, date_sent: DateTime.new(2020,2,12), date_received: DateTime.new(2020,2,28))
mary_dennision = Letter.create(notes: 'Letter from mary to dennision', user_id: mary.id, recipient_id: dennision.id, date_sent: DateTime.new(2020,3,2), date_received: DateTime.new(2020,3,9))
