json.array! @child_categories.each do |child|
  json.id child.id
  json.name child.name
end