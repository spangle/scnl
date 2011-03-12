namespace :db do
  desc "Fill database with initial user data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
		make_users
		make_drivers
		make_races
		make_race_relations
  end
end

def make_users
  admin = User.create!(:name => "David Spangle",
											:nickname => "Spiff",
                       :email => "david.spangle@gmail.com",
                       :password => "yuckfou",
                       :password_confirmation => "yuckfou")
  admin.toggle!(:admin)
  User.create!(:name => "Mike Tonies",
							:nickname => "Commish",	
               :email => "example@railstutorial.org",
               :password => "123456",
               :password_confirmation => "123456")
  User.create!(:name => "Dean Noda",
							:nickname => "Danica",
               :email => "example-1@railstutorial.org",
               :password => "123456",
               :password_confirmation => "123456")
  User.create!(:name => "Nick Ortega",
							:nickname => "Nico Bag O'Donuts",
               :email => "example-2@railstutorial.org",
               :password => "123456",
               :password_confirmation => "123456")
  User.create!(:name => "Jason Rath",
							:nickname => "The 18 Car",
               :email => "example-3@railstutorial.org",
               :password => "123456",
               :password_confirmation => "123456")
  User.create!(:name => "Kevin Andrade",
							:nickname => "Dr. KY",
               :email => "example-4@railstutorial.org",
               :password => "123456",
               :password_confirmation => "123456")
  User.create!(:name => "Dante Ardite",
							:nickname => "MCV",
               :email => "example-5@railstutorial.org",
               :password => "123456",
               :password_confirmation => "123456")
end

def make_drivers
  Driver.create!(	:name => "AJ Allmendinger",
               		:number => "43")
  Driver.create!(	:name => "Aric Almirola",
               		:number => "09")
  Driver.create!(	:name => "Marcos Ambrose",
               		:number => "9")
  Driver.create!(	:name => "Trevor Bayne",
               		:number => "21")
  Driver.create!(	:name => "Norm Benning",
               		:number => "57")
  Driver.create!(	:name => "Greg Biffle",
               		:number => "16")
  Driver.create!(	:name => "Dave Blaney",
               		:number => "66")
  Driver.create!(	:name => "Mike Bliss",
               		:number => "36")
  Driver.create!(	:name => "Geoffrey Bodine",
               		:number => "64")
  Driver.create!(	:name => "Todd Bodine",
               		:number => "60")
  Driver.create!(	:name => "Clint Bowyer",
               		:number => "33")
  Driver.create!(	:name => "Jeff Burton",
               		:number => "31")
  Driver.create!(	:name => "Kurt Busch",
               		:number => "22")
  Driver.create!(	:name => "Kyle Busch",
               		:number => "18")
  Driver.create!(	:name => "Landon Cassill",
               		:number => "60")
  Driver.create!(	:name => "Ted Christopher",
               		:number => "")
  Driver.create!(	:name => "Kevin Conway",
               		:number => "97")
  Driver.create!(	:name => "Terry Cook",
               		:number => "46")
  Driver.create!(	:name => "Derrike Cope",
               		:number => "175")
  Driver.create!(	:name => "Dale Earnhardt Jr",
               		:number => "88")
  Driver.create!(	:name => "Carl Edwards",
               		:number => "99")
  Driver.create!(	:name => "Bill Elliott",
               		:number => "21")
  Driver.create!(	:name => "Jeff Fuller",
               		:number => "97")
  Driver.create!(	:name => "Mike Garvey",
               		:number => "73")
  Driver.create!(	:name => "David Gilliland",
               		:number => "38")
  Driver.create!(	:name => "Jeff Gordon",
               		:number => "24")
  Driver.create!(	:name => "Robby Gordon",
               		:number => "7")
  Driver.create!(	:name => "Denny Hamlin",
               		:number => "11")
  Driver.create!(	:name => "Kevin Harvick",
               		:number => "29")
  Driver.create!(	:name => "James Hylton",
               		:number => "60")
  Driver.create!(	:name => "Jimmie Johnson",
               		:number => "48")
  Driver.create!(	:name => "Kasey Kahne",
               		:number => "4")
  Driver.create!(	:name => "Matt Kenseth",
               		:number => "17")
  Driver.create!(	:name => "Brad Keselowski",
               		:number => "2")
  Driver.create!(	:name => "Brian Keselowski",
               		:number => "92")
  Driver.create!(	:name => "Travis Kvapil",
               		:number => "28")
  Driver.create!(	:name => "Bobby Labonte",
               		:number => "47")
  Driver.create!(	:name => "Terry Labonte",
               		:number => "32")
  Driver.create!(	:name => "Andy Lally",
               		:number => "71")
  Driver.create!(	:name => "Joey Logano",
               		:number => "20")
  Driver.create!(	:name => "Carl Long",
               		:number => "146")
  Driver.create!(	:name => "Mark Martin",
               		:number => "5")
  Driver.create!(	:name => "Jeremy Mayfield",
               		:number => "41")
  Driver.create!(	:name => "Michael McDowell",
               		:number => "55")
  Driver.create!(	:name => "Jamie McMurray",
               		:number => "1")
  Driver.create!(	:name => "Casey Mears",
               		:number => "07")
  Driver.create!(	:name => "Paul Menard",
               		:number => "27")
  Driver.create!(	:name => "Juan Pablo Montoya",
               		:number => "42")
  Driver.create!(	:name => "Joe Nemechek",
               		:number => "87")
  Driver.create!(	:name => "Ryan Newman",
               		:number => "39")
  Driver.create!(	:name => "Max Papis",
               		:number => "13")
  Driver.create!(	:name => "David Ragan",
               		:number => "6")
  Driver.create!(	:name => "Tony Raines",
               		:number => "37")
  Driver.create!(	:name => "David Reutimann",
               		:number => "")
  Driver.create!(	:name => "Robert Richardson Jr",
               		:number => "37")
  Driver.create!(	:name => "Elliott Sadler",
               		:number => "19")
  Driver.create!(	:name => "Boris Said",
               		:number => "26")
  Driver.create!(	:name => "Mike Skinner",
               		:number => "123")
  Driver.create!(	:name => "Regan Smith",
               		:number => "78")
  Driver.create!(	:name => "Scott Speed",
               		:number => "82")
  Driver.create!(	:name => "Tony Stewart",
               		:number => "14")
  Driver.create!(	:name => "Martin Truex Jr",
               		:number => "56")
  Driver.create!(	:name => "Brian Vickers",
               		:number => "83")
  Driver.create!(	:name => "Mike Wallace",
               		:number => "171")
  Driver.create!(	:name => "Steve Wallace",
               		:number => "77")
  Driver.create!(	:name => "Michael Waltrip",
               		:number => "15")
  Driver.create!(	:name => "JJ Yeley",
               		:number => "46")
end

def make_races
	Race.create!(	:name => "Daytona 500",
								:track => "Daytona International Speedway",
								:location => "Daytona, FL",
								:selector_id => 2,
								:racedate => "2011-02-20")
	Race.create!(	:name => "Subway Fresh Fit 500",
								:track => "Phoenix International Raceway",
								:location => "Phoenix, AZ",
								:selector_id => 1,
								:racedate => "2011-02-27")
	Race.create!(	:name => "Daytona 500",
								:track => "Daytona International Speedway",
								:location => "Daytona, FL",
								:selector_id => 7,
								:racedate => "2011-03-06")
end

def make_race_relations
	RaceRelation.custom_create(1, 6, "Kyle Busch")
	RaceRelation.custom_create(1, 6, "Matt Kenseth")
	RaceRelation.custom_create(1, 7, "Greg Biffle")
	RaceRelation.custom_create(1, 7, "Mark Martin")
	RaceRelation.custom_create(1, 4, "Clint Bowyer")
	RaceRelation.custom_create(1, 4, "Kevin Harvick")
	RaceRelation.custom_create(1, 1, "Jamie McMurray")
	RaceRelation.custom_create(1, 1, "Jeff Burton")
	RaceRelation.custom_create(1, 2, "Kurt Busch")
	RaceRelation.custom_create(1, 2, "Carl Edwards")
	RaceRelation.custom_create(1, 5, "Tony Stewart")
	RaceRelation.custom_create(1, 5, "Denny Hamlin")
	RaceRelation.custom_create(1, 3, "Jeff Gordon")
	RaceRelation.custom_create(1, 3, "Jimmie Johnson")
end

def make_race_results
	RaceResult.custom_create(1, "Trevor Bayne", 1)
	RaceResult.custom_create(1, "Carl Edwards", 2)
	RaceResult.custom_create(1, "David Gilliland", 3)
	RaceResult.custom_create(1, "Bobby Labonte", 4)
	RaceResult.custom_create(1, "Kurt Busch", 5)
	RaceResult.custom_create(1, "Juan Pablo Montoya", 6)
	RaceResult.custom_create(1, "Regan Smith", 7)
	RaceResult.custom_create(1, "Kyle Busch", 8)
	RaceResult.custom_create(1, "Paul Menard", 9)
	RaceResult.custom_create(1, "Mark Martin", 10)
	RaceResult.custom_create(1, "AJ Allmendinger", 11)
	RaceResult.custom_create(1, "Bill Elliott", 12)
	RaceResult.custom_create(1, "Tony Stewart", 13)
	RaceResult.custom_create(1, "David Ragan", 14)
	RaceResult.custom_create(1, "Terry Labonte", 15)
	RaceResult.custom_create(1, "Robby Gordon", 16)
	RaceResult.custom_create(1, "Clint Bowyer", 17)
	RaceResult.custom_create(1, "Jamie McMurray", 18)
	RaceResult.custom_create(1, "Martin Truex Jr", 19)
	RaceResult.custom_create(1, "Steve Wallace", 20)
	RaceResult.custom_create(1, "Denny Hamlin", 21)
	RaceResult.custom_create(1, "Ryan Newman", 22)
	RaceResult.custom_create(1, "Joey Logano", 23)
	RaceResult.custom_create(1, "Dale Earnhardt Jr", 24)
	RaceResult.custom_create(1, "Kasey Kahne", 25)
	RaceResult.custom_create(1, "Dave Blaney", 26)
	RaceResult.custom_create(1, "Jimmie Johnson", 27)
	RaceResult.custom_create(1, "Jeff Gordon", 28)
	RaceResult.custom_create(1, "Brad Keselowski", 29)
	RaceResult.custom_create(1, "David Reutimann", 30)
	RaceResult.custom_create(1, "Brian Vickers", 31)
	RaceResult.custom_create(1, "Travis Kvapil", 32)
	RaceResult.custom_create(1, "Andy Lally", 33)
	RaceResult.custom_create(1, "Matt Kenseth", 34)
	RaceResult.custom_create(1, "Greg Biffle", 35)
	RaceResult.custom_create(1, "Jeff Burton", 36)
	RaceResult.custom_create(1, "Marcos Ambrose", 37)
	RaceResult.custom_create(1, "Robert Richardson Jr", 38)
	RaceResult.custom_create(1, "Joe Nemechek", 39)
	RaceResult.custom_create(1, "Michael Waltrip", 40)
	RaceResult.custom_create(1, "Brian Keselowski", 41)
	RaceResult.custom_create(1, "Kevin Harvick", 42)
	RaceResult.custom_create(1, "JJ Yeley", 43)

	RaceResult.custom_create(2, "Trevor Bayne", 40)
	RaceResult.custom_create(2, "Carl Edwards", 28)
	RaceResult.custom_create(2, "David Gilliland", 22)
	RaceResult.custom_create(2, "Bobby Labonte", 21)
	RaceResult.custom_create(2, "Kurt Busch", 8)
	RaceResult.custom_create(2, "Juan Pablo Montoya", 19)
	RaceResult.custom_create(2, "Regan Smith", 34)
	RaceResult.custom_create(2, "Kyle Busch", 2)
	RaceResult.custom_create(2, "Paul Menard", 17)
	RaceResult.custom_create(2, "Mark Martin", 13)
	RaceResult.custom_create(2, "AJ Allmendinger", 9)
	RaceResult.custom_create(2, "Bill Elliott", 23)
	RaceResult.custom_create(2, "Tony Stewart", 7)
	RaceResult.custom_create(2, "David Ragan", 36)
	RaceResult.custom_create(2, "Robby Gordon", 32)
	RaceResult.custom_create(2, "Clint Bowyer", 27)
	RaceResult.custom_create(2, "Jamie McMurray", 35)
	RaceResult.custom_create(2, "Martin Truex Jr", 14)
	RaceResult.custom_create(2, "Denny Hamlin", 11)
	RaceResult.custom_create(2, "Ryan Newman", 5)
	RaceResult.custom_create(2, "Joey Logano", 33)
	RaceResult.custom_create(2, "Dale Earnhardt Jr", 10)
	RaceResult.custom_create(2, "Kasey Kahne", 6)
	RaceResult.custom_create(2, "Dave Blaney", 42)
	RaceResult.custom_create(2, "Jimmie Johnson", 3)
	RaceResult.custom_create(2, "Jeff Gordon", 1)
	RaceResult.custom_create(2, "Brad Keselowski", 15)
	RaceResult.custom_create(2, "David Reutimann", 29)
	RaceResult.custom_create(2, "Brian Vickers", 30)
	RaceResult.custom_create(2, "Travis Kvapil", 39)
	RaceResult.custom_create(2, "Andy Lally", 31)
	RaceResult.custom_create(2, "Matt Kenseth", 12)
	RaceResult.custom_create(2, "Greg Biffle", 20)
	RaceResult.custom_create(2, "Jeff Burton", 26)
	RaceResult.custom_create(2, "Marcos Ambrose", 16)
	RaceResult.custom_create(2, "Brian Keselowski", 15)
	RaceResult.custom_create(2, "Kevin Harvick", 4)
	RaceResult.custom_create(2, "JJ Yeley", 37)
end
