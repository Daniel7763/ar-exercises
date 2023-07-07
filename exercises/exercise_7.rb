require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :must_carry_apparel

  def must_carry_apparel
    if mens_apparel.blank? && womens_apparel.blank?
      errors.add(:base, "Store must carry at least one type of apparel")
    end
  end
end

class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end

#----

puts "Enter a store name:"
store_name = gets.chomp

store = Store.new(name: store_name)

if store.save
  puts "Store saved successfully!"
  
  store.employees.create(first_name: "John", last_name: "goop", hourly_rate: 30)
  store.employees.create(first_name: "Ric", last_name: "floop", hourly_rate: 40)
else
  puts "Errors occurred while saving the store:"
  store.errors.full_messages.each do |error|
    puts error
  end
end