# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@motorcycle1 = Motorcycle.create(model: "Vespa 101", description: "Vespa 101 - Description Example 1.", deposit_fee: 101.00, finance_fee:120.00, total_amount:9879.0, duration: 48, apr_percent:9.45) 
@motorcycle2 = Motorcycle.create(model: "Vespa 102", description: "Vespa 102 - Description Example 2.", deposit_fee: 102.00, finance_fee:130.00, total_amount:9977.0, duration: 48, apr_percent:9.45) 
@motorcycle3 = Motorcycle.create(model: "Vespa 103", description: "Vespa 103 - Description Example 3.", deposit_fee: 103.00, finance_fee:140.00, total_amount:9923.0, duration: 48, apr_percent:9.45)
@motorcycle4 = Motorcycle.create(model: "Vespa 104", description: "Vespa 104 - Description Example 4.", deposit_fee: 104.00, finance_fee:150.00, total_amount:9345.0, duration: 48, apr_percent:9.45)
@motorcycle5 = Motorcycle.create(model: "Vespa 105", description: "Vespa 105 - Description Example 5.", deposit_fee: 105.00, finance_fee:160.00, total_amount:9607.0, duration: 48, apr_percent:9.45)

 @booking1 = Booking.create(location: "London", model:@motorcicle1, start_date: '01/01/2023', end_date: '02/02/2023', user_id: 1) 
