# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.strategy = :truncation, {:only => [:products, :categories]}
DatabaseCleaner.clean

1.upto(4).each do |i|
	filename = "category-#{Time.now.to_i * 1000 + rand(1000)}"
	Image.upload("/tmp/images/#{i}.jpeg", filename)

	category = Category.create(name: "category #{i}", logo: filename)

	1.upto(6).each do |j|
		filename = "product-#{Time.now.to_i * 1000 + rand(1000)}"
		Image.upload("/tmp/images/#{(i + j) % 9 + 1}.jpeg", filename)

		product = category.products.create(name: "product #{j}", logo: filename)
	end
end