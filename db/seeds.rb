# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item = User.new({
  first_name: "Samantha", 
  last_name: "Brinkley", 
  email: "sambrinkley@gmail.com", 
  password: "password"
  })
item.save

item = User.new({
  first_name: "Shannon", 
  last_name: "Brinkley", 
  email: "brinkme@yahoo.com", 
  password: "password"
  })
item.save

item = User.new({
  first_name: "Dalton", 
  last_name: "Brinkley", 
  email: "dbrinkles@aol.com", 
  password: "password"
  })
item.save

item = User.new({
  first_name: "Lena", 
  last_name: "Brinkley", 
  email: "lbrinkley@yahoo.com", 
  password: "password"
  })
item.save

item = User.new({
  first_name: "Peter", 
  last_name: "Jang", 
  email: "peter@email.com", 
  password: "password"
  })
item.save

item = User.new({
  first_name: "Eduardo", 
  last_name: "Pons-Rodriguez", 
  email: "edpons@gmail.com", 
  password: "password"
  })
item.save

category = Category.new({
  name: "Cafe"
  })
category.save

category = Category.new({
  name: "Coffee Shop"
  })
category.save

category = Category.new({
  name: "Restaurant"
  })
category.save

category = Category.new({
  name: "Bar"
  })
category.save

category = Category.new({
  name: "Library"
  })
category.save

location = Location.new({
  name: "Starbucks - Clark & Diversey", 
  address: "2754 N Clark St, Chicago, IL 60614", 
  hours: "5AM - 10PM", 
  phone_number: "773-880-5172", 
  website: "starbucks.com"})
location.save

review = Review.new({
title: "Busy corner Starbucks!", 
body: "I come here all the time because it is right down the block from my apartment - good go-to coffee shop, but it is always busy and noisy because of the location.", 
user_id: 2, 
location_id: location.id
})
review.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Starbucks", 
  url: "https://www.brainerddispatch.com/sites/default/files/styles/16x9_620/public/fieldimages/1/0124/starbucks.jpg?itok=_AOJzIHe", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "Intelligentsia Coffee Broadway Coffeebar", 
  address: "3123 North Broadway, Chicago, IL 60657", 
  hours: "6AM - 8PM", 
  phone_number: "773-348-8058", 
  website: "https://www.intelligentsiacoffee.com/broadway-coffeebar"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Intelligentsia", 
  url: "http://www.sleepgoodnight.com/wp-content/uploads/2017/05/coffee-espresso.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "Next Door", 
  address: "659 W Diversey Pkwy, Chicago, IL 60657", 
  hours: "7AM - 9PM", 
  phone_number: "773-472-3667", 
  website: "https://www.nextdoorchicago.com/"})
location.save

review = Review.new({
title: "Relaxed place to study!", 
body: "Visited on a Tuesday afternoon.  The cafe was relaxed and had a queit atmosphere - very conducive to studying!  I ordered a tall americano, which was great.", 
user_id: 1, 
location_id: location.id
})
review.save

review = Review.new({
title: "Great learning environment!", 
body: "Next Door is great. This lofty cafe with an event wall draws freelancers with work areas & free bookable meeting space.", 
user_id: 3, 
location_id: location.id
})
review.save

review = Review.new({
title: "Convenient & Community atmosphere!", 
body: "If you freelance or just need a place to study, alone or with a group, this is the most convenient place to do it. This isn't your typical coffee shop, it's more like a community space that happens to have a coffee shop.", 
user_id: 2, 
location_id: location.id
})
review.save

review = Review.new({
title: "Next Door has free Classes", 
body: "You can attend free classes (graphic design, marketing, etc) and book a booth for more comfortable group study.", 
user_id: 6, 
location_id: location.id
})
review.save

review = Review.new({
title: "Next Door has free Classes", 
body: "You can attend free classes (graphic design, marketing, etc) and book a booth for more comfortable group study.", 
user_id: 6, 
location_id: location.id
})
review.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Next Door Cafe", 
  url: "http://nelarusky.com/wp-content/uploads/2012/07/NextDoor.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "5411 Empanadas | Lakeview", 
  address: "2850 N Clark St, Chicago, IL 60657", 
  hours: "11AM - 9PM", 
  phone_number: "773-755-5411", 
  website: "http://5411empanadas.com/"})
location.save

review = Review.new({
title: "Great coffee + bites to eat!", 
body: "Great Argentinean empanadas & special sauces in a contemporary storefront offshoot of a food truck. It's also BYOB, so feel free to bring some wine.", 
user_id: 4, 
location_id: location.id
})
review.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "5411 Empanadas", 
  url: "https://chicago.seriouseats.com/images/2012/07/20120725-215886-we-chat-with-nicolas-ibarzabel-5411-empanadas-side.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "Dollop Coffee Co.", 
  address: "643 N Wells St, Chicago, IL 60654", 
  hours: "7AM - 10PM", 
  phone_number: "312-846-6670", 
  website: "https://www.dollopcoffee.com/"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Dollop Coffee Co.", 
  url: "https://mir-s3-cdn-cf.behance.net/project_modules/disp/f95a3c18466125.562c9ecc25eeb.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "Café Integral at Freehand Chicago", 
  address: "19 E Ohio St, Chicago, IL 60611", 
  hours: "7AM - 5PM", 
  phone_number: "312-940-3699", 
  website: "https://freehandhotels.com/chicago/cafe-integral/"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Café Integral at Freehand Chicago", 
  url: "http://ccd.hwstatic.com/propertyimages/9/91255/79.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "Sawada Coffee", 
  address: "112 N Green St, Chicago, IL 60607", 
  hours: "8AM - 5PM", 
  phone_number: "312-754-0431", 
  website: "http://sawadacoffee.com/"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Sawada Coffee", 
  url: "https://elatlboy.files.wordpress.com/2018/04/sawada-coffee-chicago-008.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "HERO Coffee Bar", 
  address: "439 S Dearborn St, Chicago, IL 60605", 
  hours: "7AM - 7PM", 
  phone_number: "312-631-3269", 
  website: "https://www.hero-coffee.com/"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "HERO Coffee Bar", 
  url: "https://media.timeout.com/images/102540204/630/472/image.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "The Wormhole Coffee", 
  address: "1462 N Milwaukee Ave, Chicago, IL 60622", 
  hours: "7AM - 9PM", 
  phone_number: "773-661-2468", 
  website: "http://www.thewormhole.us/"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "The Wormhole Coffee", 
  url: "http://www.thewormhole.us/wp-content/uploads/2013/11/DSC_0565-670x448.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "Lavazza Kafenio", 
  address: "162 E Ohio St, Chicago, IL 60611", 
  hours: "6AM - 6PM", 
  phone_number: "312-255-8850", 
  website: "http://www.kafeniochicago.com/"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Lavazza Kafenio", 
  url: "https://www.garraways.co.uk/media/wysiwyg/garraways/categories/brands/lavazza/lavazza-coffee-at-garraways.jpg", 
  location_id: location.id
  })
image.save

location = Location.new({
  name: "Stan's Donuts - Diversey & Clark", 
  address: "2800 N Clark St, Chicago, IL 60657", 
  hours: "6AM - 9PM", 
  phone_number: "773-868-0173", 
  website: "http://www.stansdonutschicago.com/"})
location.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "1"
  })
location_category.save

location_category = LocationCategory.new({
  location_id: location.id,
  category_id: "2"
  })
location_category.save

image = Image.new({
  title: "Stan's Donuts", 
  url: "https://static1.squarespace.com/static/59de6cc1bce1765a0a712259/5a04b8cae2c48354c3696f69/5a04c56f652deab388a855db/1510531988529/Stan%E2%80%99s+Donuts+%26+Coffee1.jpg?format=1500w", 
  location_id: location.id
  })
image.save



