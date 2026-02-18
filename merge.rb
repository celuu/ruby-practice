products = [
  { "sku" => "A1", "name" => "Hat" },
  { "sku" => :B2,  "name" => "Shirt" },
  { "sku" => "C3", "name" => "Socks" }
]

orders = [
  { product_sku: :A1, quantity: 2 },
  { product_sku: "A1", quantity: 1 },
  { product_sku: "B2", quantity: 4 },
  { product_sku: "D4", quantity: 1 }
]


def merge(products, orders)
  normalized_products = products.map do |product|
    product.merge(sku: product["sku"].to_s)
  end
  normalized_orders = orders.map do |order|
    order.merge(product_sku: order[:product_sku].to_s)
  end
  products_by_sku = normalized_products.each_with_object(Hash.new{|h,k| h[k] = {}}) do |products, hash|
    hash[products[:sku]] = products
  end

  totals = normalized_orders.each_with_object(Hash.new(0)) do |order, acc|
    acc[order[:product_sku]] += order[:quantity]
  end
  normalized_products.map do |product|
    sku = product[:sku]
    {
      sku: sku,
      name: product["name"],
      total_sold: totals[sku] || 0
    }
  end
end

pp merge(products, orders)