namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
    puts "Gerando os tipos de contatos (Contacts)..."
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.paragraph([1..5].sample)
      )
    end
    puts "Gerando os tipos de contatos (Contacts)...[OK]"

    puts "Gerando os tipos de endereços (Addresses)..."
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts "Gerando os tipos de endereços (Addresses)...[OK]"

    puts "Gerando os tipos de telefones (Phones)..."
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Gerando os tipos de telefones (Phones)...[OK]"
  end
end
