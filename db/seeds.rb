# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command(or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Creating Users... "

User.destroy_all

u1 = User.create!(
    email: 'lupobiancotest1@mailinator.com',
    password: 'chicken',
    mobile: 20868847,
    address: '123 Fake Street'
)

u2 = User.create!(
    email: 'lupobiancotest2@mailinator.com',
    password: 'chicken',
    mobile: 20868847,
    address: '321 Imposter Avenue'
)

puts "created #{ User.count } users."


print "Creating profiles... "

Profile.destroy_all

p1 = Profile.create!(
    name: 'Domenic Marino',
    gender: 'Male',
    height: 174,
    weight: 155,
    shoulders: 47,
    neck: 49,
    chest: 150,
    bicep: 48,
    forearm: 34,
    wrist: 20,
    sleeve: 62,
    front_length: 80,
    back_length: 79,
    mid_waist: 167,
    waist: 162,
    hip: 156,
    upper_thigh: 73,
    middle_thigh: 57,
    calf: 46,
    ankle: 27,
    pants_length: 55,
    crotch: 91
)

p2 = Profile.create!(
    name: 'Henderson Wong',
    gender: 'Male',
    height: 167,
    weight: 66,
    shoulders: 40,
    neck: 41,
    chest: 88,
    bicep: 29,
    forearm: 26,
    wrist: 16,
    sleeve: 55,
    front_length: 67,
    back_length: 66,
    mid_waist: 84,
    waist: 83,
    hip: 93,
    upper_thigh: 50,
    middle_thigh: 40,
    calf: 35,
    ankle: 20,
    pants_length: 62,
    crotch: 67
)

p3 = Profile.create!(
    name: 'Nabeela Caunhye',
    gender: 'Female',
    height: 156,
    weight: 49,
    shoulders: 39,
    neck: 31,
    chest: 82,
    bicep: 29,
    forearm: 22,
    wrist: 14,
    sleeve: 53,
    front_length: 60,
    back_length: 60,
    mid_waist: 64,
    waist: 79,
    hip: 88,
    upper_thigh: 53,
    middle_thigh: 37,
    calf: 29,
    ankle: 18,
    pants_length: 59,
    crotch: 64
)

p4 = Profile.create!(
    name: 'Nupur Pai',
    gender: 'Female',
    height: 162,
    weight: 52,
    shoulders: 38,
    neck: 33,
    chest: 88,
    bicep: 29,
    forearm: 22,
    wrist: 14,
    sleeve: 54,
    front_length: 64,
    back_length: 64,
    mid_waist: 72,
    waist: 78,
    hip: 89,
    upper_thigh: 52,
    middle_thigh: 36,
    calf: 33,
    ankle: 21,
    pants_length: 60,
    crotch: 62
)

u1.profiles << p1 << p3
u2.profiles << p2 << p4

puts "User '#{ u1.email }' has profiles #{u1.profiles.pluck(:name).join(', ') }"
puts "Profile '#{ p2.name }' belongs to #{p2.user.email}"

print "Creating Suits... "

Suit.destroy_all

s1 = Suit.create!(
    design: "Black Tuxedo",
    jacket_fit: "Slim",
    pants_fit: "Slim",
    jacket_pocket_style: "Straight",
    jacket_pockets: 2,
    jacket_buttons: 2,
    inner_lining_color: "Red",
    vents: 2,
    lapel: "Shawl",
    inner_lining_name: "D.M",
    shirt_chest_pocket: true,
    shirt_collar: "Wing Tip",
    shirt_cuff: "French Cuff",
    shirt_initials: "",
    shirt_length: 83,
    shirt_sleeve_length: 63,
    extra_shirts: 1,
    extra_pants: 0,
    extra_jackets: 0,
    quality: 250,
    price: 1350,
    notes: "No belt loops, high-waisted pants please",
    paid: true
)

s2 = Suit.create!(
    design: "Skirt Suit Femme",
    jacket_fit: "Slim",
    pants_fit: "Slim",
    jacket_pocket_style: "Straight",
    jacket_pockets: 2,
    jacket_buttons: 1,
    inner_lining_color: "Blue",
    vents: 0,
    lapel: "Peak",
    inner_lining_name: "N, Caunhye",
    extra_shirts: -1,
    extra_pants: 0,
    extra_jackets: 0,
    quality: 150,
    price: 650,
    notes: "Skirt above knee",
    paid: true
)

p1.suits << s1
p3.suits << s2

puts "Suit 'No.#{ s1.id }' belongs to #{s1.profile.name}"