bob = User.create(username: 'bobmorgan', password: 'password')
paul = User.create(username: 'paulweaver', password: 'password')
mary = User.create(username: 'marydrummond', password: 'password')

martha = Recipient.create(name: 'martha', address: '123 Penbrook Rd.', user_id: bob.id)
steve = Recipient.create(name: 'steve', address: '123 Addlebird Rd.', user_id: bob.id)
jammie = Recipient.create(name: 'jammie', address: '789 Zipline Dr.', user_id: bob.id)

macy = Recipient.create(name: 'Robert R. Henry', address: '1846 Kovar Road
Worcester, MA 01610', user_id: paul.id)
amanda = Recipient.create(name: 'Jason D. Chapman', address: '471 Fincham Road
El Centro, CA 92243', user_id: paul.id)
martin = Recipient.create(name: 'Florence M. Stevenson', address: '325 Whitetail Lane
Dallas, TX 75234', user_id: paul.id)

ricardo = Recipient.create(name: 'Don Y. Lundquist', address: '3614 Leo Street
Aurora, CO 80014', user_id: mary.id)
martson = Recipient.create(name: 'Lesley L. Quick', address: '738 Poplar Street
Chicago, IL 60607', user_id: mary.id)
dennision = Recipient.create(name: 'Laura T. Lawson', address: '3764 Jarvisville Road
Huntington, NY 11743', user_id: mary.id)

paul_macy = Letter.create(notes: 'Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.', user_id: paul.id, recipient_id: macy.id, date_sent: DateTime.new(2020,1,12), date_received: DateTime.new(2020,1,28))
paul_amanda = Letter.create(notes: 'Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring', user_id: paul.id, recipient_id: amanda.id, date_sent: DateTime.new(2020,2,12), date_received: DateTime.new(2020,2,28))
paul_martin = Letter.create(notes: 'Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.', user_id: paul.id, recipient_id: martin.id, date_sent: DateTime.new(2020,3,2), date_received: DateTime.new(2020,3,9))

bob_martha = Letter.create(notes: 'Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.', user_id: bob.id, recipient_id: martha.id, date_sent: DateTime.new(2020,1,12), date_received: DateTime.new(2020,1,28))
bob_steve = Letter.create(notes: 'Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.', user_id: bob.id, recipient_id: steve.id, date_sent: DateTime.new(2020,2,12), date_received: DateTime.new(2020,2,28))
bob_jammie = Letter.create(notes: 'Efficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions.', user_id: bob.id, recipient_id: jammie.id, date_sent: DateTime.new(2020,3,2), date_received: DateTime.new(2020,3,9))

mary_ricardo = Letter.create(notes: 'Completely synergize resource taxing relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service.', user_id: mary.id, recipient_id: ricardo.id, date_sent: DateTime.new(2020,1,12), date_received: DateTime.new(2020,1,28))
mary_martson = Letter.create(notes: 'Objectively innovate empowered manufactured products whereas parallel platforms. Holisticly predominate extensible testing procedures for reliable supply chains. Dramatically engage top-line web services vis-a-vis cutting-edge deliverables.', user_id: mary.id, recipient_id: martson.id, date_sent: DateTime.new(2020,2,12), date_received: DateTime.new(2020,2,28))
mary_dennision = Letter.create(notes: 'Proactively envisioned multimedia based expertise and cross-media growth strategies. Seamlessly visualize quality intellectual capital without superior collaboration and idea-sharing. Holistically pontificate installed base portals after maintainable products.', user_id: mary.id, recipient_id: dennision.id, date_sent: DateTime.new(2020,3,2), date_received: DateTime.new(2020,3,9))
