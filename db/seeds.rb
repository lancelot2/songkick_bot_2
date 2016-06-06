# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 211 Camden High Street  NW1 8QR London  UK  http://dev.gqindia.com/wp-content/uploads/2015/05/akbarallys-store-at-a-glance.jpg
# 241 Old Street  EC1V 9EY  London  UK  http://www.blogto.com/listings/fashion/upload/2008/05/20080524-fraiche2.jpg
# 18 Shorts Gardens WC2H 9BE  London  UK  http://butthatsnoneofmybusiness.com/wp-content/uploads/2015/03/GettyImages_450871626.0.jpg
# Westfield Stratford City  E20 1EJ London  UK  http://cdn.foodbeast.com.s3.amazonaws.com/content/uploads/2013/10/uocoffee.jpg
# 6 Friary Street GU1 4EH Surrey  UK  http://retaildesignblog.net/wp-content/uploads/2012/10/Incu-store-Melbourne.jpg
# 213 Rue Saint Honoré  75001 Paris France  http://www.kdhamptons.com/wp-content/uploads/2013/07/IMG_4477.jpg
# 7 Rue Froissart 75003 Paris France  http://glamshops.ro/pics/201408/ash-footwear-in-shanghai-china-1407312654-14.jpg
# Hobrechtstraße 18 12047 Berlin  Germany http://www.yourlittleblackbook.me/wp-content/uploads/2014/06/pia-pia-bordeaux-4.jpg
# Carrer de Llull, 48 08005 Barcelona Spain http://www.alumind.com/wp-content/uploads/2015/04/DSCN0811-1290x650.jpg
# Hamngatan 37  111 53  Stockholm Sweden  https://media.timeout.com/images/102058425/617/347/image.jpg
# 212 Clement St  CA 94118  San Francisco US  http://trendy.nikkeibp.co.jp/article/pickup/20080131/1006587/08_px250.jpg
# 1915 Ocean Ave  CA 94127  San Francisco US  https://media.timeout.com/images/102769025/image.jpg
# 28 Bond St  NY 10012  New-York  US  http://static.asiawebdirect.com/m/kl/portals/kuala-lumpur-ws/homepage/kl-top10s/10-shopping-subang-jaya/allParagraphs/010/top10Set/07/image/1200px-pattern-store.jpg
# 524 N Lamar Blvd #103 TX 78703  Austin  US  http://www.moodiereport.com/images2/Rodd_Gunn_store_1.jpg
Store.destroy_all

Store.create({
   address: "211 Camden High Street",
   zipcode: "NW1 8QR",
   city: "London",
   country: "United Kingdom",
   main_image: "http://dev.gqindia.com/wp-content/uploads/2015/05/akbarallys-store-at-a-glance.jpg",
   area: "GB"

  })

Store.create({
   address: "241 Old Street",
   zipcode: "EC1V 9EY",
   city: "London",
   country: "United Kingdom",
   main_image: "http://www.blogto.com/listings/fashion/upload/2008/05/20080524-fraiche2.jpg",
   area: "GB"
  })

Store.create({
   address: "18 Shorts Gardens",
   zipcode: "WC2H 9BE",
   city: "London",
   country: "United Kingdom",
   main_image: "http://butthatsnoneofmybusiness.com/wp-content/uploads/2015/03/GettyImages_450871626.0.jpg",
   area: "GB"
  })

Store.create({
   address: "Westfield Stratford City",
   zipcode: "E20 1EJ",
   city: "London",
   country: "United Kingdom",
   main_image: "http://cdn.foodbeast.com.s3.amazonaws.com/content/uploads/2013/10/uocoffee.jpg",
   area: "GB"
  })

Store.create({
   address: "6 Friary Street",
   zipcode: "GU1 4EH",
   city: "Surrey",
   country: "United Kingdom",
   main_image: "http://retaildesignblog.net/wp-content/uploads/2012/10/Incu-store-Melbourne.jpg",
   area: "GB"
  })

Store.create({
   address: "213 Rue Saint Honoré",
   zipcode: "75001",
   city: "Paris",
   country: "France",
   main_image: "http://www.kdhamptons.com/wp-content/uploads/2013/07/IMG_4477.jpg",
   area: "IDF"
  })

Store.create({
   address: "7 Rue Froissart",
   zipcode: "75003",
   city: "Paris",
   country: "France",
   main_image: "http://glamshops.ro/pics/201408/ash-footwear-in-shanghai-china-1407312654-14.jpg",
   area: "IDF"
  })


Store.create({
   address: "Hobrechtstraße 18",
   zipcode: "12047",
   city: "Berlin",
   country: "Germany",
   main_image: "http://www.yourlittleblackbook.me/wp-content/uploads/2014/06/pia-pia-bordeaux-4.jpg",
   area: "DE"
  })

Store.create({
   address: "Hobrechtstraße 18",
   zipcode: "12047",
   city: "Berlin",
   country: "Germany",
   main_image: "http://www.yourlittleblackbook.me/wp-content/uploads/2014/06/pia-pia-bordeaux-4.jpg",
   area: "DE"
  })


Store.create({
   address: "Carrer de Llull, 48",
   zipcode: "12047",
   city: "Barcelona",
   country: "Spain",
   main_image: "http://www.alumind.com/wp-content/uploads/2015/04/DSCN0811-1290x650.jpg",
   area: "SP"
  })


Store.create({
   address: "Hamngatan 37",
   zipcode: "111 53",
   city: "Stockholm",
   country: "Sweden",
   main_image: "https://media.timeout.com/images/102058425/617/347/image.jpg",
   area: "SW"
  })

Store.create({
   address: "212 Clement Street",
   zipcode: "94118",
   city: "San Francisco",
   country: "United States",
   main_image: "http://trendy.nikkeibp.co.jp/article/pickup/20080131/1006587/08_px250.jpg",
   area: "CA"
  })

Store.create({
   address: "1915 Ocean Avenue",
   zipcode: "94127",
   city: "San Francisco",
   country: "United States",
   main_image: "https://media.timeout.com/images/102769025/image.jpg",
   area: "CA"
  })

Store.create({
   address: "Hamngatan 37",
   zipcode: "10012",
   city: "New-York",
   country: "United States",
   main_image: "http://static.asiawebdirect.com/m/kl/portals/kuala-lumpur-ws/homepage/kl-top10s/10-shopping-subang-jaya/allParagraphs/010/top10Set/07/image/1200px-pattern-store.jpg",
   area: "NY"
  })

Store.create({
   address: "524 N Lamar Boulevard",
   zipcode: "78703",
   city: "Austin",
   country: "United States",
   main_image: "http://www.moodiereport.com/images2/Rodd_Gunn_store_1.jpg",
   area: "TX"
  })





