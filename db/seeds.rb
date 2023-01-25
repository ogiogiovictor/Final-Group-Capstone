User.create!(
    username: 'JohnVictorFed',
    password: 'password',
    email: 'John@home.com',
    name: 'John'
  )

  5.times do |i|
    Car.create!(
      user_id: 1,
      brand: "Camery #{i + 1}",
      model: 'Toyota',
      release_year: 2009,
      color: 'white',
      transmission: 'manual',
      seats: 6,
      wheel_drive: 'four-wheel',
      price: 3000
    )
  end


  5.times do |i|
    Reservation.create!(
      date: Date.new, reserved_from: Date.new, reserved_until: Date.new, user: User.first, car: Car.first
    )
  end