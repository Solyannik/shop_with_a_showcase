# Магазин с витриной

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require_relative 'lib/cart'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)

cart = Cart.new

loop do
  puts "Что хотите купить:"
  collection.in_stock.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end

  puts "0. Выход"
  user_choise = STDIN.gets.to_i

  if (1..collection.in_stock.size).include?(user_choise)
    product_choice = collection.in_stock[user_choise - 1]
    puts "Вы выбрали: #{product_choice.without_amount}"
    puts
    cart.add_product(product_choice)
    puts "Всего товаров на сумму: #{cart.sum} руб."
  end

   break puts 'Такого товара нет в наличии.' if user_choise > collection.in_stock.size
   break if user_choise.zero?
end

puts "Вы купили:"
puts cart
puts "С Вас — #{cart.sum} руб. Спасибо за покупки!"
