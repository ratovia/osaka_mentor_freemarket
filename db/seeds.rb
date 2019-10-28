# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

require "csv"

CSV.read('db/category.csv', headers: true).each do |row|
  Category.create!(
    id: row['id'], 
    name: row['name'], 
    created_at: row['created_at'], 
    updated_at: row['updated_at'], 
    category_id: row['category_id']
  )
end