# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

require "csv"

CSV.read('db/category.csv').each do |row|
  Category.create!(
    id: row[0], 
    name: row[1], 
    created_at: row[2], 
    updated_at: row[3], 
    category_id: row[4])
end