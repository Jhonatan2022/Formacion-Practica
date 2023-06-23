import random
countries = ['col', 'mex', 'bol', 'pe']

population_v2 = { country: random.randint(1, 100)  for country in countries}
print(population_v2) # {'col': 99, 'mex': 99, 'bol': 51, 'pe': 51}

result = { country: population for (country, population) in population_v2.items() if population > 50 }
print(result) # {'mex': 99, 'bol': 51, 'pe': 51}

text = 'Hola, soy Nicolas'
unique = { c: c.upper() for c in text if c in 'aeiou' }
print(unique) # {'o': 'O', 'a': 'A', 'i': 'I', 'o': 'O', 'a': 'A', 'i': 'I'}