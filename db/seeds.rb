user1 = User.create!(
  username: 'MrOmachi',
  password: 'password',
  email: 'John@home.com',
  name: 'John'
)

user2 = User.create!(
  username: 'Victor',
  password: 'password',
  email: 'Victor@home.com',
  name: 'Victor'
)

user3 = User.create!(
  username: 'Fernando',
  password: 'password',
  email: 'Fernando@home.com',
  name: 'Fernando'
)


  Car.create!(
    user_id: user1.id,
    brand: "Mercedes #{1}",
    model: 'benz',
    release_year: 2009,
    color: 'black',
    image_path: 'https://parkers-images.bauersecure.com/wp-images/17053/renault_austral.jpg',
    transmission: 'manual',
    seats: 6,
    wheel_drive: 'four-wheel',
    price: 30000
  )

  Car.create!(
    user_id: user2.id,
    brand: "Mercedes #{1}",
    model: 'benz',
    release_year: 2009,
    color: 'black',
    image_path: 'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
    transmission: 'manual',
    seats: 6,
    wheel_drive: 'four-wheel',
    price: 30000
  )

  Car.create!(
    user_id: user3.id,
    brand: "Mercedes #{1}",
    model: 'benz',
    release_year: 2009,
    color: 'black',
    image_path: 'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
    transmission: 'manual',
    seats: 6,
    wheel_drive: 'four-wheel',
    price: 30000
  )

  Reservation.create!(
    date: Date.new, reserved_from: Date.new, reserved_until: Date.new, user: user1, car: Car.first
  )

  Reservation.create!(
    date: Date.new, reserved_from: Date.new, reserved_until: Date.new, user: user2, car: Car.second
  )

  Reservation.create!(
    date: Date.new, reserved_from: Date.new, reserved_until: Date.new, user: user3, car: Car.third
  )
