'''
dict = {}
for i in range(1, 5):
  dict[i] = i * 2

print(dict)

dict_v2 = { i: i * 2 for i in range(1, 5)}
print(dict_v2)

import random
countries = ['col', 'mex', 'bol', 'pe']
population = {}
for country in countries:
  population[country] = random.randint(1, 100)

print(population)

population_v2 = { country: random.randint(1, 100)  for country in countries}
print(population_v2)
'''

names = ['nico', 'zule', 'santi']
ages = [12, 56, 98]


# Zip me permite unir dos listas en un diccionario 
print(list(zip(names, ages))) # [('nico', 12), ('zule', 56), ('santi', 98)]


new_dict = {name: age for (name, age) in zip(names, ages)}
print(new_dict)