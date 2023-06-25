items = [
  {
    'product': 'camisa',
    'price': 100,
  },
  {
    'product': 'pantalones',
    'price': 300
  },
  {
    'product': 'pantalones 2',
    'price': 200
  }
]


prices = list(map(lambda item: item['price'], items))
print(items)
print(prices)


def add_taxes(item):
  item['taxes'] = item['price'] * .19
  return item


new_items = list(map(add_taxes, items))
print(new_items)
print(items)