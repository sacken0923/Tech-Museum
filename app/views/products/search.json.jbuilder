json.array! @products do |product|
  json.id product.id
  json.title product.title
  json.image product.image
  # json.description product.description
end