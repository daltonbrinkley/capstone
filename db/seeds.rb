# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# item = User.new({
#   first_name: "Samantha", 
#   last_name: "Brinkley", 
#   email: "sambrinkley@gmail.com", 
#   password: "password"
#   })
# item.save

# item = User.new({
#   first_name: "Shannon", 
#   last_name: "Brinkley", 
#   email: "brinkme@yahoo.com", 
#   password: "password"
#   })
# item.save

# item = User.new({
#   first_name: "Dalton", 
#   last_name: "Brinkley", 
#   email: "dbrinkles@aol.com", 
#   password: "password"
#   })
# item.save

# item = User.new({
#   first_name: "Lena", 
#   last_name: "Brinkley", 
#   email: "lbrinkley@yahoo.com", 
#   password: "password"
#   })
# item.save

# location = Location.new({
#   name: "Starbucks - Clark & Diversey", 
#   address: "2754 N Clark St, Chicago, IL 60614", 
#   hours: "5AM - 10PM", 
#   phone_number: "773-880-5172", 
#   website: "starbucks.com"})
# location.save

# location = Location.new({
#   name: "Intelligentsia Coffee Broadway Coffeebar", 
#   address: "3123 North Broadway, Chicago, IL 60657", 
#   hours: "6AM - 8PM", 
#   phone_number: "773-348-8058", 
#   website: "https://www.intelligentsiacoffee.com/broadway-coffeebar"})
# location.save

# location = Location.new({
#   name: "Next Door", 
#   address: "659 W Diversey Pkwy, Chicago, IL 60657", 
#   hours: "7AM - 9PM", 
#   phone_number: "773-472-3667", 
#   website: "https://www.nextdoorchicago.com/"})
# location.save

# location = Location.new({
#   name: "5411 Empanadas | Lakeview", 
#   address: "2850 N Clark St, Chicago, IL 60657", 
#   hours: "11AM - 9PM", 
#   phone_number: "773-755-5411", 
#   website: "http://5411empanadas.com/"})
# location.save

# review = Review.new({
# title: "Busy corner Starbucks!", 
# body: "I come here all the time because it is right down the block from my apartment - good go-to coffee shop, but it is always busy and noisy because of the location.", 
# user_id: 2, 
# location_id: 2
# })
# review.save

# review = Review.new({
# title: "Great learning environment!", 
# body: "Next Door is great. This lofty cafe with an event wall draws freelancers with work areas & free bookable meeting space.", 
# user_id: 3, 
# location_id: 3
# })
# review.save

# review = Review.new({
# title: "Great coffee + bites to eat!", 
# body: "Great Argentinean empanadas & special sauces in a contemporary storefront offshoot of a food truck. It's also BYOB, so feel free to bring some wine.", 
# user_id: 4, 
# location_id: 4
# })
# review.save

# review = Review.new({
# title: "Great Coffee Shop!", 
# body: "Visited on a Tuesday afternoon.  The cafe was relaxed and had a queit atmosphere - very conducive to studying!  I ordered a tall americano, which was great.", 
# user_id: 1, 
# location_id: 1
# })
# review.save

# category = Category.new({
#   name: "Cafe"
#   })
# category.save

# category = Category.new({
#   name: "Coffee Shop"
#   })
# category.save

# category = Category.new({
#   name: "Restaurant"
#   })
# category.save

# category = Category.new({
#   name: "Bar"
#   })
# category.save

# category = Category.new({
#   name: "Library"
#   })
# category.save

# location_category = LocationCategory.new({
#   location_id: "1",
#   category_id: "1"
#   })
# location_category.save

# location_category = LocationCategory.new({
#   location_id: "1",
#   category_id: "1"
#   })
# location_category.save

# location_category = LocationCategory.new({
#   location_id: "1",
#   category_id: "1"
#   })
# location_category.save

# location_category = LocationCategory.new({
#   location_id: "1",
#   category_id: "1"
#   })
# location_category.save

image = Image.new({
  title: "5411 Empanadas", 
  url: "https://chicago.seriouseats.com/images/2012/07/20120725-215886-we-chat-with-nicolas-ibarzabel-5411-empanadas-side.jpg", 
  location_id: 3
  })
image.save

image = Image.new({
  title: "Starbucks", 
  url: "https://www.brainerddispatch.com/sites/default/files/styles/16x9_620/public/fieldimages/1/0124/starbucks.jpg?itok=_AOJzIHe", 
  location_id: 1
  })
image.save

image = Image.new({
  title: "Intelligentsia", 
  url: "http://www.sleepgoodnight.com/wp-content/uploads/2017/05/coffee-espresso.jpg", 
  location_id: 4
  })
image.save

image = Image.new({
  title: "Next Door Cafe", 
  url: "http://nelarusky.com/wp-content/uploads/2012/07/NextDoor.jpg", 
  location_id: 2
  })
image.save
