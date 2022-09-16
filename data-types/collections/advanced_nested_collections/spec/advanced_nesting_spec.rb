require_relative 'nesting'

# The intent of this exercise is to practice working with nested collections.
# Some tests will be able to pass without any enumeration, and others will require
# more complex iteration over multiple portions of the nested collection.

# All tests can be completed without using any enumerable other than #each.
# My suggestion would be to complete all tests using only #each, and then
# to go back over each test and refactor it using a different enumerable.

# The collection you're going to be using lives in ./nesting.rb and is called stores.
# If you spot an error or want to make this exercise better, please let us know!


RSpec.describe 'Advanced Nested Collections' do
  it 'test 1' do
    # EXAMPLE
    employees = []
      stores[:olive_garden][:employees].each do |employee|
        employees << employee
    end
    expected = ["Jeff", "Zach", "Samantha"]
    expect(employees).to eq(expected)
  end

  it 'test 2' do
    # Find the ingredients for pancakes
    pancake_ingredients =[]
    stores[:dennys][:dishes].each do |dish|
     if dish[:name] == "Pancakes"
      pancake_ingredients << dish[:ingredients]
     end
     pancake_ingredients = pancake_ingredients.flatten
    end
    expected = ["Flour", "Eggs", "Milk", "Syrup"]
    expect(pancake_ingredients).to eq(expected)
  end

  it 'test 3' do
    # Find the price of risotto
    risotto_price = 0
      stores[:olive_garden][:dishes].each do |dish|
        if dish[:name] == "Risotto"
          risotto_price = dish[:price]
        end
        risotto_price
      end
    expect(risotto_price).to eq(12)
  end

  it 'test 4' do
    # Find the ingredients for a Big Mac
  big_mac_ingredients = stores[:macdonalds][:dishes][0][:ingredients]

    expected = ['Bun','Hamburger','Ketchup','pickles']
    expect(big_mac_ingredients).to eq(expected)
  end

  it 'test 5' do
    # Find a list of restaurants
    store_names = stores.map do |store|

      store[0]
    end.flatten
    expected = [:olive_garden, :dennys, :macdonalds]
    expect(store_names).to eq(expected)
  end

  it 'test 6' do
    # Find dishes names for Olive Garden
    dishes_names = stores[:olive_garden][:dishes].map do |dish|
      dish[:name]

    end
    expect(dishes_names).to eq(['Risotto', 'Steak'])
  end

  it 'test 7' do
    # Return a list of employees across
    # all restaurants
    employee_names = []
     stores.each do |store, names|
      employee_names << names[:employees]
    end
    employee_names = employee_names.flatten

    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 8' do
    # Return a list of all ingredients
    # across all restaurants
    ingredients = []
    dishes = []
    # require 'pry'; binding.pry
      stores.each do |store, details|
        dishes << details[:dishes]

    end
    dishes = dishes.flatten
    dishes.each do |ingredient|
      ingredients << ingredient[:ingredients]
    end
    ingredients= ingredients.flatten

    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]

    expect(ingredients).to eq(expected)
  end

  it 'test 9' do

   dish_price =[]
    stores[:olive_garden][:dishes].each do |dish|
      dish_price << dish[:price]
    end
    full_menu_price = dish_price.sum

     expect(full_menu_price).to eq(27)
  end

  it 'test 10' do
    # Return the full menu for Olive Garden
    olive_garden_menu ={}
    stores[:olive_garden][:dishes].each do |dish|
      olive_garden_menu[dish[:name]]
    end
     stores[:olive_garden][:dishes].each do |dish|
      olive_garden_menu[dish[:name]] = dish

    end

    olive_garden_menu = olive_garden_menu
    expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      }
    }
    expect(olive_garden_menu).to eq(expected)
  end

  it 'test 11' do
    # Return a full menu across all restaurants\

    dishes = []
    full_menu = {}
    stores.each do |name, full|
      #  require 'pry'; binding.pry
     dishes << full[:dishes]
    end
     dishes = dishes.flatten
    dishes.each do |dish|
       full_menu[dish[:name]]
    end
      dishes.each do |dish|
        full_menu[dish[:name]] = dish
      end
      p full_menu

    expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      },
      "Pancakes" => {
        :name => "Pancakes",
        :ingredients => ["Flour", "Eggs", "Milk", "Syrup"],
        :price => 10
      },
      "Waffles" => {
        :name => "Waffles",
        :ingredients => ["Flour", "Eggs", "Syrup"],
        :price => 7
      },
      "Big Mac" => {
        :name => "Big Mac",
        :ingredients => ["Bun", "Hamburger", "Ketchup", "pickles"],
        :price => 5
      },
      "Fries" => {
        :name => "Fries",
        :ingredients => ["Potatoes", "Salt"],
        :price => 2
      }
    }
    expect(full_menu).to eq(expected)
  end
end
