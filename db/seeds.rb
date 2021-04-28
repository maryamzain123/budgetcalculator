Entry.destroy_all
User.destroy_all


25.times do


    User.create(name: Faker::JapaneseMedia::Naruto.character, 
    username:Faker::JapaneseMedia::DragonBall.planet,
    password: "password")

end


month=["January", "February", "March", "April", "May", "June", "July",
"August", "September", "October", "November", "December"]

25.times do

    Entry.create(subject:Faker::Company.name,
    details:Faker::Appliance.equipment,
    month: month.sample,
    user: User.all.sample,
    amount:Faker::Number.decimal(r_digits: 2, l_digits:1 ))

end
puts "seeds planted"