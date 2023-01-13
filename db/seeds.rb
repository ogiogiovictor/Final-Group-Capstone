user1 = User.create!(
  username: 'John',
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
