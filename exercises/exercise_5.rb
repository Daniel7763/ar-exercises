require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

average_revenue = Store.average(:annual_revenue)
puts "Average Annual Revenue: #{average_revenue}"

high_earning_stores = Store.where("annual_revenue > ?", 1000000).count
puts "Stores that earn more than $1000000: #{high_earning_stores}"


# 1. Output the total revenue for the entire company (all stores), using Active Record's `.sum` calculation method.
# 2. On the next line, also output the average annual revenue for all stores.
# 3. Output the number of stores that are generating $1M or more in annual sales. **Hint:** Chain together `where` and `size` (or `count`) Active Record methods.
