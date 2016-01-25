json.array!(@products) do |produc|
  json.extract! produc, :id, :title, :description, :image_url, :price, :quantity
  json.url produc_url(produc, format: :json)
end
