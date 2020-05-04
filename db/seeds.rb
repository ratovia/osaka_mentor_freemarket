# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

require "csv"

CSV.read('db/csv/category.csv', headers: true).each do |row|
  Category.first_or_create!(
    id: row['id'],
    name: row['name'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    category_id: row['category_id']
  )
end

brands = []
CSV.foreach('db/csv/brands.csv', headers: true) do |row|
  brand = Brand.find_or_initialize_by(id: row['id'])
  next if brand.persisted?
  brand.attributes = {name: row['name']}
  brands << brand
end
Brand.import brands

size_groups = []
CSV.foreach('db/csv/size_groups.csv', headers: true) do |row|
  size_group = SizeGroup.find_or_initialize_by(id: row['id'])
  next if size_group.persisted?
  size_group.attributes = {name: row['name']}
  size_groups << size_group
end
SizeGroup.import size_groups

sizes = []
CSV.foreach('db/csv/sizes.csv', headers: true) do |row|
  size = Size.find_or_initialize_by(id: row['id'])
  next if size.persisted?
  size.attributes = {name: row['name'], size_group_id: row['size_group_id']}
  sizes << size
end
Size.import sizes

product_categories = []
CSV.foreach('db/csv/product_categories.csv', headers: true) do |row|
  product_category = ProductCategory.find_or_initialize_by(id: row['id'])
  next if product_category.persisted?
  product_category.attributes = {name: row['name'], ancestry: row['ancestry'], size_group_id: row['size_group_id']}
  product_categories << product_category
end
ProductCategory.import product_categories
