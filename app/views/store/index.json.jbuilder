json.array!(@products) do |product|
  json.extract! product, :id
  json.url product_url(product, format: :json)
  json.image_url product.image_url
  json.title product.title
  json.price product.price
  json.description product.description
end
